import numpy as np
np.seterr(all="ignore")
import os
import networkx as nx
import pickle
import trimesh
import triangle
from collections import defaultdict
from scipy.spatial import Delaunay
from utils import tessellate_points, polar_angle_sort, area_polygon, sort_simplices, \
                    adjacency_matrix, update_polyhedrons_dict, find_POI, find_apex, \
                    min_dist, between_points, remove_close_edges, isin, connectivity,  \
                    get_growth_vect, calculate_number_of_simplices, \
                    plot_tessellation, print_dict, initial_area, group_segments, detect_holes, \
                    valid

class MeshGen:

    def __init__(self,mesh, points, base_points, top_points, lateral_mesh, inner_mesh, radius, pore_area, output_path, tmp_path):
        self.mesh = mesh
        self.points = points
        self.base_points = base_points
        self.top_points = top_points
        self.lateral_mesh = lateral_mesh
        self.inner_mesh = inner_mesh
        self.z_max = np.max(self.top_points[:,-1])
        self.L = radius #mm
        self.pore_area = pore_area
        self.polyhedrons = {}
        self.G = nx.Graph()
        self.output_path = output_path
        self.tmp_path = os.path.join("..", tmp_path)

        self.L, self.pore_area = initial_area(self.L, self.pore_area)

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
        banned_points = []

        while True:
            optimal_points = []
            if iteration == 0:
                bot_points, simplices, outter_shell_pts, inner_shell_pts = self.__initial_points(self.mesh, self.pore_area)
                num_simplices = len(simplices)

            else:
                print(f"iteration {iteration}")
                simplices, bot_points, outter_shell_pts, inner_shell_pts = tessellate_points(num_simplices, self.lateral_mesh, bot_points,
                                                                                            outter_shell_apex_idx, inner_shell_apex_idx_dict)
                # plot_tessellation(bot_points[:,:2],simplices)

            outter_shell_apex_idx = []
            inner_shell_apex_idx_dict = defaultdict(list)
            for i,indice in enumerate(simplices):
                base_points = bot_points[indice]
                try:
                    initial_point = find_POI(base_points)
                except:
                    initial_point = np.mean(base_points,axis=0)

                growth_vect = get_growth_vect(self.lateral_mesh,
                                            initial_point,
                                            initial_point[2] + self.L if initial_point[2] + self.L <= self.z_max
                                                                                    else self.z_max - 1e-6)
                optimal_point = find_apex(base_points, initial_point, growth_vect)

                if optimal_point[-1] >= self.z_max:
                    not_in_opt_points = base_points[~isin(base_points, optimal_points)] if len(optimal_points) > 0 else base_points
                    outter_shell_points_to_join = isin(not_in_opt_points, outter_shell_pts)
                    if any(outter_shell_points_to_join):
                        outter_shell_apex_idx.extend(np.flatnonzero(outter_shell_points_to_join) + (len(optimal_points)))

                    for c, m in enumerate(inner_shell_pts):
                        inner_shell_points_to_join = isin(not_in_opt_points, m)
                        if any(inner_shell_points_to_join):
                            inner_shell_apex_idx_dict[c].extend(np.flatnonzero(inner_shell_points_to_join) + (len(optimal_points)))

                    optimal_points.extend(not_in_opt_points)
                    banned_points.extend(not_in_opt_points)

                else:
                    if len(banned_points) == 0 or not isin(base_points, banned_points).any():
                        optimal_points.append(optimal_point)
                        self.polyhedrons[f"{iteration}_{i}"] = {"base_points": base_points, "apex": optimal_point}

                        outter_shell_points_in_base = isin(base_points, outter_shell_pts)
                        if np.count_nonzero(outter_shell_points_in_base) > 1:
                            if valid(outter_shell_points_in_base):
                                outter_shell_apex_idx.append(len(optimal_points)-1)

                        else:
                            for c,m in enumerate(inner_shell_pts):
                                inner_shell_points_in_base = isin(base_points, m)
                                if np.count_nonzero(inner_shell_points_in_base) > 1:
                                    if valid(inner_shell_points_in_base):
                                        inner_shell_apex_idx_dict[c].append(len(optimal_points)-1)
                                        break

            if len([x for x in self.polyhedrons.keys() if x.startswith(f"{iteration}_")]) == 0:
                break

            optimal_points = np.array(optimal_points)

            bot_points, self.polyhedrons, inner_shell_apex_idx_dict, self.inner_mesh = self.__join_hull_and_shell(self.polyhedrons, self.lateral_mesh, 
                                                                                                        self.inner_mesh, optimal_points,
                                                                                                        outter_shell_apex_idx, inner_shell_apex_idx_dict)
            iteration += 1

        self.__dict_to_graph(outter_shell_apex_idx, inner_shell_apex_idx_dict)
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
        
        
    def __initial_points(self,mesh, pore_area):

        section_points, segments, holes, _ = detect_holes(mesh, 0.1)

        current_area = 0
        min_val = pore_area/10
        max_val = pore_area*100
        max_it = 50
        it = 0
        while not np.isclose(current_area, pore_area, atol = pore_area*0.05):
            if it == max_it:
                raise Exception("Maximum number of iterations reached. Desired pore area cannot be reached.")

            current_val = (min_val + max_val)/2
            opt = f"pqa{current_val}"
            t = triangle.triangulate({"vertices": section_points, "segments": segments, **({"holes": holes} if holes else {})}, opt)
            triang_points = np.array(t["vertices"].tolist())
            simplices = np.array(t["triangles"].tolist())
            current_area =  np.mean([area_polygon(triang_points[x]) for x in sort_simplices(triang_points[simplices], simplices, triang_points)[1]])

            if current_area < pore_area:
                min_val = current_val
            else:
                max_val = current_val

            it += 1

        triang_points = np.c_[triang_points, np.zeros(triang_points.shape[0])]

        segments_groups = sorted(group_segments(t["segments"]), key= len, reverse= True)
        outter_points = triang_points[segments_groups[0]]
        inner_points =  [triang_points[idx] for idx in segments_groups[1:]]

        return triang_points, simplices, outter_points, inner_points


    def __join_hull_and_shell(self, tetra_dict, lateral_mesh, inner_mesh, apexes, outter_points_idx, inner_points_idx_dict):

        closer_points = trimesh.proximity.closest_point(lateral_mesh, apexes[outter_points_idx])[0]
        for i,p in enumerate(apexes[outter_points_idx]):
            if not np.isclose(p, closer_points[i]).all():
                apexes[np.argwhere((apexes == p).all(-1))[0][0]] = closer_points[i]
                tetra_dict = update_polyhedrons_dict(tetra_dict, p, closer_points[i])

        if inner_mesh:
            dead = []
            alive = set()
            for num, inner_points_idx in inner_points_idx_dict.items():
                for j, mesh in enumerate(inner_mesh):
                    if np.isclose(mesh.centroid[:2], np.mean(apexes[inner_points_idx], axis= 0)[:2], atol=10).all():
                        closer_points = trimesh.proximity.closest_point(mesh, apexes[inner_points_idx])[0]
                        for i,p in enumerate(apexes[inner_points_idx]):
                            if not np.isclose(p, closer_points[i]).all():
                                if abs(p[2] - closer_points[i][2]) >5:
                                    break

                                apexes[np.argwhere((apexes == p).all(-1))[0][0]] = closer_points[i]
                                tetra_dict = update_polyhedrons_dict(tetra_dict, p, closer_points[i])
                            
                        else:
                            alive.add(j)
                            break

                else:
                    dead.append(num)

            if dead:
                for num in dead:
                    del inner_points_idx_dict[num]

                for m in sorted(set(range(len(inner_mesh))).difference(alive), reverse= True):
                    del inner_mesh[m]

            return apexes, tetra_dict, inner_points_idx_dict, inner_mesh
    
    def __dict_to_graph(self, outter_shell_apex_idx, inner_shell_apex_idx_dict):
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
                    if between_points(np.array([previous, p, following]), v["apex"]) or isin(self.lateral_mesh.vertices, v["apex"]):
                        self.G.add_edge(tuple(p), tuple(v["apex"]), length= np.linalg.norm(v["apex"] - p))
        
        # Move the nodes to the top of the shell
        # nodes = list(self.G.nodes())
        # to_remove = []
        # for node in nodes:
        #     neighb = list(self.G.neighbors(node))
        #     for n in neighb:
        #         if n[2] > node[2]:
        #             break
        #     else:
        #         to_remove.append([node, neighb])

        # new_nodes = []
        # for node, neighb in to_remove:
        #     self.G.remove_node(node)
        #     new_node = tuple(np.array([node[0], node[1], self.z_max]))
        #     self.polyhedrons = update_polyhedrons_dict(self.polyhedrons, np.array(node), np.array(new_node))
        #     self.G.add_node(new_node)
        #     new_nodes.append(new_node)
        #     for n in neighb:
        #         self.G.add_edge(new_node, n, length= np.linalg.norm(np.array(new_node) - np.array(n)))
        
        # # Move the outter and inner nodes to the perimeter of the top section
        # new_nodes = np.array(new_nodes)
        # adpt, self.polyhedrons = self.__join_hull_and_shell(self.polyhedrons, self.lateral_mesh, 
        #                                                     self.inner_mesh, new_nodes,
        #                                                     outter_shell_apex_idx, inner_shell_apex_idx_dict)
        
        # for i, p in enumerate(~(new_nodes[:, None] == adpt).all(-1).any(-1)):
        #     if p:
        #         point = tuple(new_nodes[i])
        #         n = self.G.neighbors(point)
        #         self.G.remove_node(point)
        #         self.G.add_node(tuple(adpt[i]))
        #         for node in n:
        #             self.G.add_edge(tuple(adpt[i]), node, length= np.linalg.norm(adpt[i] - np.array(node)))

        # simplex = Delaunay(adpt[:,:2]).simplices
        # self.__add_base(simplex, adpt)

        # self.G = remove_close_edges(self.G, max_global_dist)
        # self.G.remove_nodes_from(list(nx.isolates(self.G)))

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