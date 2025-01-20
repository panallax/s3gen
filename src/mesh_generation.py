import numpy as np
np.seterr(all="ignore")
from scipy.spatial import Delaunay
import config
import os
import networkx as nx
import pickle
from shapely.geometry import LineString
from triangle import triangulate
from utils import tessellate_points, polar_angle_sort, area_polygon, sort_simplices, \
                    adjacency_matrix, update_polyhedrons_dict, find_POI, find_apex, \
                    min_dist, between_points, remove_close_edges, isin, find_POI, \
                    find_apex, connectivity, get_growth_vect, calculate_number_of_simplices, \
                    plot_tessellation, print_dict, pore_area

class MeshGen:

    def __init__(self,mesh, points, base_points, top_points, lateral_mesh, radius, pore_area, output_path, tmp_path):
        self.mesh = mesh
        self.points = points
        self.base_points = base_points
        self.top_points = top_points
        self.lateral_mesh = lateral_mesh
        self.z_max = np.max(self.top_points[:,-1])
        self.L = radius #mm
        self.pore_area = self.pore_area
        self.polyhedrons = {}
        self.G = nx.Graph()
        self.output_path = output_path
        self.tmp_path = os.path.join("..", tmp_path)

        self.L, self.pore_area = pore_area(self.L, self.pore_area)

    def generate_mesh(self):
        """ Generate the mesh of the structure. The generation of the mesh follows
        an iterative process that creates stacked polyhedrons until all the 
        polyhedrons created in an interation are outside the volume. 
        
        In each iteration, a set of points, called bot points, are tessellated. 
        From this tessellation, a set of polygons are obtained that will be used
        as the called base points from which the apex will be calculated. 
        
        To calculate the apex, the point of inaccessibility of each polygon is 
        calculated (if it cannot be calculated then the midle point of the polygon 
        is used) and used as the intial position of the apex. Then, another iterative 
        process is performed in which each iteration calculates a new position of 
        the apex until all the edges of the polyhedron formed have an angle greater 
        than 50 degrees respect to the horizontal plane. All the apexes obtained
        in each iteration are used in the following iteration as its bot points.

        The outer apexes are replaced by the nearest shell point to ensure the
        connection between the structure and the shell.

        """

        iteration = 0
        shll = []
        while True:
            optimal_points = []
            if iteration == 0: 
                bot_points, simplices = self.__initial_points()
                # initial_sect = LineString(bot_points_pr[np.unique(Delaunay(bot_points_pr).convex_hull)]).length
                num_simplices = len(simplices)
                self.__add_base(simplices, bot_points)

            else:
                print(f"iteration {iteration}")
                num_simplices = calculate_number_of_simplices(self.mesh, np.mean(bot_points[:,-1]), num_simplices)
                simplices = tessellate_points(num_simplices, bot_points)
                # plot_tessellation(bot_points_pr,simplices)

            for i,indice in enumerate(simplices):
                # Obtain the base points from tessellation
                base_points = bot_points[indice]
                try:
                    initial_point = find_POI(base_points)
                except:
                    initial_point = np.mean(base_points,axis=0)

                growth_vect = get_growth_vect(self.mesh, 
                                                initial_point,
                                                initial_point[2] + config.PORERADIUS if initial_point[2] + config.PORERADIUS <= self.z_max 
                                                                                    else self.z_max - 1e-6)
                optimal_point = find_apex(base_points, initial_point, growth_vect)
                if optimal_point[-1] >= self.z_max:
                    optimal_points.extend(base_points)
                else:
                    optimal_points.append(optimal_point)
                    self.polyhedrons[f"{iteration}_{i}"] = {"base_points": base_points, "apex": optimal_point}

            if len([x for x in self.polyhedrons.keys() if x.startswith(f"{iteration}_")]) == 0:
                break
            joined_points, self.polyhedrons = self.__join_hull_and_shell(self.polyhedrons, optimal_points, self.lateral_points)
            bot_points = np.unique(np.array(joined_points), axis=0)

            iteration += 1

        self.__dict_to_graph()
        print_dict(self.points, self.polyhedrons)

    def __add_base(self, simplex, points):
        """ Add the base triangulation to the graph to facilitate printing it.

        Arguments:
            simplex {np.ndarray} -- Array of simplices
            points {np.ndarray} -- Array of points
        
        """
        _, simplex = sort_simplices(points[:,:2][simplex], simplex, points[:,:2])
        for s in simplex:
            simplex_points = points[s]
            for point in [(simplex_points[i], simplex_points[(i + 1) % len(simplex_points)]) for i in range(len(simplex_points))]:
                self.G.add_edge(tuple(point[0]), tuple(point[1]), length = np.linalg.norm(point[1] - point[0]))
        
        
    def __initial_points(self):
        """ Generate the initial points of the mesh. The points are generated
        using the Douglas-Peucker algorithm to reduce the density of points in the
        peroimeter of the convex hull. Then, Delauany triangulation is used to
        generate the simplices until the area of the simplices is close to the
        desired area.

        Returns:
            np.ndarray -- Array of points
            np.ndarray -- Array of simplices
        
        """

        dea = Delaunay(self.base_points[:,:2])
        indices = dea.convex_hull
        hull = self.base_points[np.unique(indices)]

        section_points = np.array(list(sorted(hull, key=lambda x : polar_angle_sort(x,np.mean(hull, axis=0)))))
        section_points = np.append(section_points, [section_points[0]], axis=0)
        section_line = LineString(section_points)
        # Aplicar el algoritmo de Douglas-Peucker para reducir la densidad de puntos
        simplified_line = section_line.simplify(self.L/10)
        simplified_hull = np.array(simplified_line.coords)

        current_area = 0
        min_val = 0.1
        max_val = 20

        while not np.isclose(current_area, self.pore_area, atol= 0.2):
            current_val = (min_val + max_val)/2
            opt = f"qa{current_val}"
            t = triangulate({"vertices": simplified_hull[:,:2]}, opt)
            triang_points = np.array(t["vertices"].tolist())
            simplices = np.array(t["triangles"].tolist())
            current_area =  np.mean([area_polygon(triang_points[x]) for x in sort_simplices(triang_points[simplices], simplices, triang_points)[1]])
            if current_area < self.pore_area:
                min_val = current_val
            else:
                max_val = current_val

        triang_points_3d = np.c_[triang_points, np.zeros(triang_points.shape[0])]
        
        return triang_points_3d, simplices

    def __join_hull_and_shell(self, tetra_dict, points, shell):
        """ Join the hull and the shell of the triangulation.

        Arguments:
            tetra_dict {dict} -- Dictionary of polyhedrons
            points {np.ndarray} -- Array of points
            shell {np.ndarray} -- Array of points of the shell

        Returns:
            np.ndarray -- Array of points with the shell
            dict -- Dictionary of polyhedrons with the shell
        
        """
        points = np.array(points)
        inner_points = points[:,:2]
        dea = Delaunay(inner_points)
        indices = dea.convex_hull

        hull = points[np.unique(indices)]
        closer_points = list(map(lambda x: min_dist(shell,x), hull))

        for old,new in closer_points:
            tetra_dict = update_polyhedrons_dict(tetra_dict, old, new)
            points[(points == old).all(-1)] = new
  
        return points, tetra_dict

    
    def __dict_to_graph(self):
        """ Convert a dictionary of polyhedrons to a graph. Not printable edges 
        won't be added and the highest nodes will be connected to the top of the
        shell.

        Arguments:
            dict {dict} -- Dictionary of polyhedrons
            lateral_points {np.ndarray} -- Array of points of the shell
            max_value {float} -- Maximum value of the z axis
        
        Returns:
            nx.Graph -- Graph of the structure
        
        """
        max_global_dist = 0
        for v in self.polyhedrons.values():
            for i, p in enumerate(v["base_points"]):
                local_dist = np.linalg.norm(v["apex"] - p)
                max_global_dist = local_dist if local_dist > max_global_dist else max_global_dist
                if len(v["base_points"]) == 3:
                    self.G.add_edge(tuple(p), tuple(v["apex"]), length= np.linalg.norm(v["apex"] - p))
                else:  
                    previous = v["base_points"][i-1] if i > 0 else v["base_points"][-1]
                    following = v["base_points"][(i+1)] if i < len(v["base_points"])-1 else v["base_points"][0]
                    if between_points(np.array([previous, p, following]), v["apex"]) or isin(self.lateral_points, v["apex"]):
                        self.G.add_edge(tuple(p), tuple(v["apex"]), length= np.linalg.norm(v["apex"] - p))

        nodes = list(self.G.nodes())
        to_remove = []
        for node in nodes:
            neighb = list(self.G.neighbors(node))
            for n in neighb:
                if n[2] > node[2]:
                    break
            else:
                to_remove.append([node, neighb])

        new_nodes = []
        for node, neighb in to_remove:
            self.G.remove_node(node)
            new_node = tuple(np.array([node[0], node[1], self.z_max]))
            self.polyhedrons = update_polyhedrons_dict(self.polyhedrons, np.array(node), np.array(new_node))
            self.G.add_node(new_node)
            new_nodes.append(new_node)
            for n in neighb:
                self.G.add_edge(new_node, n, length= np.linalg.norm(np.array(new_node) - np.array(n)))

        new_nodes = np.array(new_nodes)
        adpt, self.polyhedrons = self.__join_hull_and_shell(self.polyhedrons, 
                                                                 new_nodes, 
                                                                 self.top_points[np.unique(Delaunay(self.top_points[:,:2]).convex_hull)])
        
        for i, p in enumerate(~(new_nodes[:, None] == adpt).all(-1).any(-1)):
            if p:
                point = tuple(new_nodes[i])
                n = self.G.neighbors(point)
                self.G.remove_node(point)
                self.G.add_node(tuple(adpt[i]))
                for node in n:
                    self.G.add_edge(tuple(adpt[i]), node, length= np.linalg.norm(adpt[i] - np.array(node)))

        simplex = Delaunay(adpt[:,:2]).simplices
        self.__add_base(simplex, adpt)

        self.G = remove_close_edges(self.G, max_global_dist)
        self.G.remove_nodes_from(list(nx.isolates(self.G)))

    def save_graph(self):
        pickle.dump(self.polyhedrons, open(os.path.join(self.tmp_path, "tetra.pickle"),"wb"))
        pickle.dump(self.G, open(os.path.join(self.output_path, "G.pickle"),"wb"))
        pickle.dump(self.G, open(os.path.join(self.tmp_path, "G.pickle"),"wb"))

    def save_adjacency_matrix(self):   
        nodes, matrix = adjacency_matrix(self.G)
        connectivity_list = connectivity(self.G)
        np.savez(os.path.join(self.output_path, "adjacency_matrix.npz"),nodes=nodes, 
                                                                        matrix=matrix, 
                                                                        conn= connectivity_list)