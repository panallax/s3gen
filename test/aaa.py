import numpy as np
np.seterr(all="ignore")
from utils import in_volume, exclude_points, determinate_quadrant, generate_point_in_quadrant, \
                    angle, calculate_position, adjacency_matrix, calculate_segments_dist, \
                    calculate_neighbors_in_node, isin, decompose_structure, plot_graph, extract_points_from_STL, parsed_path
                    
from sklearn.neighbors import NearestNeighbors
from scipy.spatial import KDTree
import os
import networkx as nx
import pickle
from itertools import chain
import matplotlib.pyplot as plt
import config
from time import time
from scipy.spatial.distance import cdist
class MeshGen:

    def __init__(self, shell_points, radius, output_path, tmp_path):
        self.shell_points = self.fixed_points =  shell_points
        self.r = radius
        self.points, self.bot_points, self.top_points = decompose_structure(self.shell_points, radius)
        self.points = shell_points[np.argsort(shell_points[:, 2])[::1]]
        self.z_max = self.points[-1][-1]
        self.z = self.points[0][-1]
        self.max_global_dist = 0
        self.connections = {}
        self.kd_tree = KDTree(self.shell_points)
        self.G = nx.Graph()
        self.output_path = output_path
        self.tmp_path = tmp_path
        self.j=1000


    def generate_mesh(self):
        t = time()
        i = 0
        while self.z < self.z_max:
        # while i < 150:
            if (self.top_points[:, None] == self.points[i]).all(-1).any():
                break
            nbrs = NearestNeighbors(algorithm="kd_tree").fit(self.points)
            _, indices = nbrs.radius_neighbors([self.points[i]], radius=1.5*self.r, return_distance=True, sort_results=True)
            self.points_to_join = []
            pnts = self.points[indices[0]]
            #Select one point to evaluate
            current_point = pnts[0,:]
            print("====================================================")
            print(f"current point: {current_point} is shell point {isin(self.shell_points, current_point).any()}")

            self.connections[i] = {"point": current_point, "connections": {}, "connections_below" :{}}
            self.G.add_node(tuple(current_point))
            # self.fixed_points = np.vstack((self.fixed_points, current_point))

            #Filter the neighbours of the point to keep only the ones above it
            indx_pos_above = np.where(pnts[:,-1] > current_point[-1])
            #Array of this points
            points_above = pnts[indx_pos_above]
            self.a = points_above
            indx_above = indices[0][indx_pos_above]

            # fixed_points_above = points_above[(points_above[:, None] == self.fixed_points).all(-1).any(-1)]
            # not_fixed_points_above = points_above[~(points_above[:, None] == self.fixed_points).all(-1).any(-1)]
            # print(len(indices[0]),len(points_above))

            # index_not_fixed_points_above = indx_above[~(points_above[:, None] == self.fixed_points).all(-1).any(-1)]

            available_quadrants = {1,2,3,4}
            # self.ishell = isin(self.shell_points, current_point).any()
            used_quadrants = set()
            for point in points_above:
                union_angle = angle(point, current_point, np.array([0,0,1]))
                quadrant = determinate_quadrant(point, current_point)
                # print(union_angle)
                if union_angle >= 44.9:
                    # print(self.check_position(current_point, point, False), not self.inner_colisions(current_point, point))
                    if self.check_position(current_point, point, False) and not self.inner_colisions(current_point, point):
                # if union_angle >= 44.9 and self.check_position(current_point, point, False):
                        self.__add_connection(point, i, quadrant, "connections", True)
                        # available_quadrants.remove(quadrant)
                        used_quadrants.add(quadrant)
                        self.G.add_edge(tuple(current_point), tuple(point))
                        # print("1",tuple(current_point), tuple(point), "edge add len G changed to: ", len(self.G), "and len edges", len(self.G.edges()))

                        # print(f"------ point {point} added in quadrant {quadrant} ------")

                # print(f"{len(self.points_to_join)} fixed points joined, remaining quadrants {available_quadrants}")
                # if len(not_fixed_points_above) == 0 and not isin(self.shell_points, current_point).any():
                not_used_quadrants = available_quadrants.difference(used_quadrants)
            print(f"not used quadrants: {not_used_quadrants}, {len(self.points_to_join)} points joined")
                # if current_point[-1] >0.6:
            # fig = plt.figure(figsize=(10,10))
            # ax = fig.add_subplot(projection = "3d")
            # ax.set_aspect("equal")
            # u, v = np.mgrid[0:2*np.pi:20j, 0:np.pi:10j]
            # x = 1.5*self.r*np.cos(u)*np.sin(v) + current_point[0]
            # y = 1.5*self.r*np.sin(u)*np.sin(v) + current_point[1]
            # z = 1.5*self.r*np.cos(v) + current_point[2]
            # ax.plot_wireframe(x, y, z, color="r", linewidths=0.3)
            # # if len(self.G.nodes()) > 3:
            # #     for p1,p2 in self.obersevable_segments:
            # #         print(p1,p2)
            # #         plt.plot([p1[0], p2[0]],[p1[1], p2[1]], [p1[2], p2[2]])
            #     # ax.scatter(*exclude_points(self.fixed_points, self.shell_points).T, c="blue", marker="+")
            # ax.scatter(*self.points[self.points[:,-1] < 1.3*self.z].T, c="green", marker="+")
            # ax.scatter(*points_above.T, c="red", s=20, marker = "*")
            # # print(angle(points_above, current_point, np.array([0,0,1])))
            # ax.scatter(*points_above[angle(points_above, current_point, np.array([0,0,1])) > 44.9].T, c="red", s=20)
            # ax.scatter(*current_point.T, c="black")
            # plt.show()

            # print("~~~~~~~~~~")
            
            if len(not_used_quadrants) > 0:
                for quadrant in list(not_used_quadrants):
                    new_point = self.generate_point(current_point, quadrant, self.r ,100)
                    if new_point is None:
                        continue
                    if not in_volume(new_point, self.shell_points):
                        nearest_shell_points = self.shell_points[self.kd_tree.query_ball_point(current_point, self.r, workers= -1)]
                        available_nearest_shell_points = nearest_shell_points[np.where(angle(nearest_shell_points, current_point, np.array([0,0,1])) > 44.9)[0]]
                        for shell_point in available_nearest_shell_points:
                            if quadrant == determinate_quadrant(shell_point, current_point) and self.check_position(current_point, shell_point, True):
                                print(f"point {shell_point} create pointsd")
                                not_used_quadrants.remove(quadrant)
                                self.__insert_point(shell_point, i, quadrant, "connections")
                                self.G.add_edge(tuple(current_point), tuple(shell_point))
                                # print("5",tuple(current_point), tuple(new_point), "edge add len G changed to: ", len(self.G), "and len edges", len(self.G.edges()))
                    else:
                        not_used_quadrants.remove(quadrant)
                        self.__insert_point(new_point, i, quadrant, "connections")
                        self.G.add_edge(tuple(current_point), tuple(new_point))
                        # print("6",tuple(current_point), tuple(new_point), "edge add len G changed to: ", len(self.G), "and len edges", len(self.G.edges()))
                        print(f"new point {new_point} generated in quadrant {quadrant}")
            print(f"not used quadrants: {not_used_quadrants}, {len(self.points_to_join)} points joined")
            # if current_point[2] >0.6:
            #     plot_graph(self.G)
            
            # print(f"points joined: {self.points_to_join}")
            local_dist = np.max(np.linalg.norm(self.points_to_join - current_point, axis=1)) if len(self.points_to_join) > 0 else 0
            self.max_global_dist = local_dist if local_dist > self.max_global_dist else self.max_global_dist
            print(f"max global dist: {self.max_global_dist}")
            try:
                self.z = np.max(exclude_points(self.fixed_points,self.shell_points)[:,2])
            except: 
                pass
            i +=1
            # print("--------------------------------------------------")

        # reversed_points = self.points[np.argsort(self.points[:, 2])[::-1]]
        # nbrs = NearestNeighbors(algorithm="kd_tree").fit(reversed_points)

        # for p in reversed_points:
        #     if (self.bot_points[:, None] == p).all(-1).any():
        #         break
        #     indx_point = np.where(np.all(self.points == p, axis=1))[0][0]
        #     if indx_point not in self.connections.keys():
        #         self.connections[indx_point] = {"point": p, "connections": {}, "connections_below" :{}}
        #     _, indices = nbrs.radius_neighbors([p], radius=1.5*self.r, return_distance=True, sort_results=True)
        #     pnts = reversed_points[indices[0]]
        #     #Select one point to evaluate
        #     current_point = pnts[0,:]
        #     #Filter the neighbours of the point to keep only the ones below it
        #     indx_pos_below = np.where(pnts[:,-1] < current_point[-1])
        #     #Array of this points
        #     points_below = pnts[indx_pos_below]
        #     available_quadrants = [1,2,3,4]
        #     for point in points_below:
        #         union_angle = angle(point, current_point, np.array([0,0,-1]))
        #         quadrant = determinate_quadrant(point, current_point)
        #         if union_angle >= 44.9 and quadrant in available_quadrants and self.check_position(current_point, point, False):
        #             self.__add_connection(point, indx_point, quadrant, "connections_below", False)
        #             available_quadrants.remove(quadrant)
        #             self.G.add_edge(tuple(current_point), tuple(point))

        print(time() - t)
        self.G.remove_nodes_from(list(nx.isolates(self.G)))
        # self.G.remove_nodes_from([n for n in self.G.nodes() if len(list(self.G.neighbors(n))) == 1])
        # self.__generate_graph()
        # plot_graph(self.G)
        # self.__remove_close_edges()
        plot_graph(self.G)
        return self.G

    def __add_point(self, point, array_index, connection_idx, quadrant, connection_type,):
        self.points[array_index] = point
        self.fixed_points = np.vstack((self.fixed_points, point))
        self.connections[connection_idx][connection_type].update({quadrant: point})
        self.points_to_join.append(point)
    
    def __insert_point(self, point, connection_idx, quadrant, connection_type):
        self.points = calculate_position(self.points, point)
        # self.points = np.vstack((self.points, point))
        self.fixed_points = np.vstack((self.fixed_points, point))
        self.connections[connection_idx][connection_type].update({quadrant: point})
        self.points_to_join.append(point)

    def __add_connection(self, point, connection_idx, quadrant, connection_type, fix_point= True):
        self.connections[connection_idx][connection_type].update({quadrant: point})
        if fix_point:
            self.fixed_points = np.vstack((self.fixed_points, point))
            self.points_to_join.append(point)

    def __generate_graph(self):
        for value in self.connections.values():
            tuples_points = list(map(tuple,[value['point']] + list(value.get('connections', {}).values()) + list(value.get('connections_below', {}).values())))
            self.G.add_nodes_from(list(map(tuple,tuples_points)))
            for i in range(1,len(tuples_points)):
                self.G.add_edge(tuples_points[0], tuples_points[i])

    def save_graph(self):
        pickle.dump(self.G, open(os.path.join(parsed_path(self.output_path), "G.pickle"),"wb"))
        pickle.dump(self.G, open(os.path.join(parsed_path(self.tmp_path), "G.pickle"),"wb"))

    def save_adjacency_matrix(self):   
        nodes, matrix = adjacency_matrix(self.G)
        # print(os.path.join(parsed_path(self.output_path), "adjacency_matrix.npz"))
        np.savez(os.path.join(parsed_path(self.output_path), "adjacency_matrix.npz"), nodes=nodes, matrix=matrix)

                        
    def generate_point(self,origin, quadrant,r,n):

        points = self.aux_generate_point_in_quadrant(origin, r, n, quadrant, 6)
        self.obersevable_segments = self.get_observable_segments(origin, points[0])
        
        # print("observable_segments", obersevable_segments)
        if len(self.obersevable_segments) != 0:
            # if self.generate_valid_point_in_quadrant(origin, points, obersevable_segments) is None:
                # if self.ishell  == "a" :
                #     fig = plt.figure(figsize = (10,10))
                #     ax = fig.add_subplot(projection="3d")
                #     ax.set_aspect("equal")
                #     for p1,p2 in obersevable_segments:
                #         plt.plot([p1[0], p2[0]],[p1[1], p2[1]], [p1[2], p2[2]])

                #     ax.scatter(*points.T)
                #     ax.scatter(*self.fixed_points[self.fixed_points[:,-1]< 1.3*self.z].T, marker="+")
                #     ax.scatter(*origin.T, c="black",s=20)
                #     ax.scatter(*self.a.T, c="black",marker="*")
                #     plt.show()
            return self.generate_valid_point_in_quadrant(origin, points, self.obersevable_segments)
        else:
            return points[~np.apply_along_axis(self.check_proximity, 1, points)][0]
        
    def generate_valid_point_in_quadrant(self, origin, points, observable_segments):
        for point in points:
            dists = np.array(list(map(lambda x: calculate_segments_dist([point,origin], x), observable_segments)))
            if (dists > 0.15).all() and not self.check_proximity(point):
                return np.array(point)

    def check_proximity(self, point):
        return len(KDTree(self.fixed_points).query_ball_point(point, 0.15, workers= -1)) != 0
            
        
    def get_observable_segments(self, origin, point):
        remove_node = False
        if not self.G.has_node(tuple(point)):
            self.G.add_node(tuple(point))
            remove_node = True

        nodes = np.array(self.G.nodes())
        tree_points = KDTree(nodes)
        p1,p2 = origin, point
        mid_point = (p1+p2)/2
        observable_points = np.unique(np.concatenate([x[1:] for x in tree_points.query_ball_point([p1,p2,mid_point], self.max_global_dist, workers= -1)], dtype= int, casting= "unsafe"))            

        valid_points = exclude_points(nodes[observable_points],[p1,p2, mid_point])
        observable_segments = []
        for valid_point in valid_points:
            point_nodes = self.G.neighbors(tuple(valid_point))
            for n in point_nodes:
                if not isin(np.array([p1,p2]), np.array(n)).any() and isin(nodes[observable_points], np.array(n)).any():
                    observable_segments.append(np.array([valid_point,n]))

        observable_segments = np.unique(np.array(list(map(lambda x: x[np.argsort(x[:,0])], observable_segments))), axis=0)
        if remove_node:
            self.G.remove_node(tuple(point))

        return observable_segments
       
    def check_position(self,origin, point, new_point= False):
        if len(self.G.nodes()) < 3:
            return True

        if new_point:
            if self.check_proximity(point):
                return False
        
        observable_segments = self.get_observable_segments(origin, point)
        # if len(self.obersevable_segments) > 0:
        #     fig = plt.figure(figsize=(10,10))
        #     ax = fig.add_subplot(projection = "3d")
        #     for p1,p2 in self.obersevable_segments:
        #         plt.plot([p1[0], p2[0]],[p1[1], p2[1]], [p1[2], p2[2]])
        #     ax.scatter(*self.points[self.points[:,-1] < 1.3*self.z].T, c="green", marker="+")
        #     ax.scatter(*origin.T, c="black",s=20)
        #     plt.show()

        for s in observable_segments:
            # print("segment, observable_segment, distance", [origin,point], s, calculate_segments_dist(s, (origin,point)))
            d = calculate_segments_dist(s, (origin, point))
            if d < 0.15:
                # print(d)
                # p1 = origin
                # p2 = point
                # fig = plt.figure(figsize=(10,10))
                # ax = fig.add_subplot(projection = "3d")
                # plt.plot([p1[0], p2[0]],[p1[1], p2[1]], [p1[2], p2[2]], c = "black")
                # for s in observable_segments:
                #     plt.plot(s[:,0], s[:,1], s[:,2])
                # ax.scatter(*self.points[self.points[:,-1] < 1.3*self.z].T, c="green", marker="+")
                # plt.show()

                return False
            
        return True

    
    def inner_colisions(self, origin, point):
        s1 = np.linspace(origin, point, 20)
        for p in self.points_to_join:
            s2 = np.linspace(origin, p,20)
            if (np.min(cdist(s1,s2), axis=0) < 0.1).all():

                return True
        return False
    
    def aux_generate_point_in_quadrant(self, center, r,n,quadrant, slices):
        np.random.seed(1)
        "https://www.bogotobogo.com/Algorithms/uniform_distribution_sphere.php"
        if quadrant == 5:
            theta_range = np.array([0, np.pi*2])
        else:
            theta_range =  np.array([np.pi/18, np.pi/2 - np.pi/18]) + (quadrant - 1)*np.pi/2


        phi_range = np.array([np.pi/36, np.pi/4])
        rs = np.linspace(r,0.2,slices)
    
        dr = 1 - (rs[0] - rs[1])/r 
        slice_n = [0]+[int(n*(dr)**i) for i in range(slices)]
        p = np.zeros((sum(slice_n),3))

        for i,r_ in enumerate(rs):
            first = slice_n[i]
            last = slice_n[i+1]

            theta = np.random.uniform(*theta_range, last)
            phi = np.random.uniform(*phi_range, last)
            x = r_*np.sin(phi)*np.cos(theta)
            y = r_*np.sin(phi)*np.sin(theta)
            z = r_*np.cos(phi)
            p[first:first+last] = np.column_stack((x, y, z)) + center

        return p
if __name__ == "__main__":
    points = extract_points_from_STL(config.STLFILE)
    output_path = config.OUTPUTPATH
    mesh = MeshGen(points, config.PORERADIUS, output_path, config.TMPPATH)
    mesh.generate_mesh()
    # mesh.save_graph()
    # mesh.save_adjacency_matrix()
