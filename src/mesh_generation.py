import numpy as np
np.seterr(all="ignore")
from utils import in_volume, exclude_points, determinate_quadrant, generate_point_in_quadrant, \
                    angle, calculate_position, adjacency_matrix, calculate_segments_dist, \
                    calculate_neighbors_in_node, isin, decompose_structure
                    
from sklearn.neighbors import NearestNeighbors
from scipy.spatial import KDTree
import os
import networkx as nx
   
class MeshGen:

    def __init__(self, shell_points, radius, output_path):
        self.shell_points = self.fixed_points =  shell_points
        self.r = radius
        self.points, self.bot_points, self.top_points = decompose_structure(self.shell_points, self.radius)
        self.z_max = self.points[-1][-1]
        self.z = self.points[0][-1]
        self.max_global_dist = 0
        self.connections = {}
        self.kd_tree = KDTree(self.shell_points)
        self.G = nx.Graph()
        self.output_path = output_path


    def generate_mesh(self):
        i = 0
        while self.z < self.z_max:

            if (self.top_points[:, None] == self.points[i]).all(-1).any():
                break
            nbrs = NearestNeighbors(algorithm="kd_tree").fit(self.points)
            _, indices = nbrs.radius_neighbors([self.points[i]], radius=1.3*self.r, return_distance=True, sort_results=True)
            self.points_to_join = []
            pnts = self.points[indices[0]]

            #Select one point to evaluate
            current_point = pnts[0,:]
            # print(f"current point: {current_point} is shell point {isin(shell_points, current_point)}")
            self.connections[i] = {"point": current_point, "connections": {}, "connections_below" :{}}

            #Filter the neighbours of the point to keep only the ones above it
            indx_pos_above = np.where(pnts[:,-1] > current_point[-1])
            #Array of this points
            points_above = pnts[indx_pos_above]
            indx_above = indices[0][indx_pos_above]

            fixed_points_above = points_above[(points_above[:, None] == self.fixed_points).all(-1).any(-1)]
            not_fixed_points_above = points_above[~(points_above[:, None] == self.fixed_points).all(-1).any(-1)]
            index_not_fixed_points_above = indx_above[~(points_above[:, None] == self.fixed_points).all(-1).any(-1)]

            available_quadrants = [1,2,3,4]

            if len(fixed_points_above) > 0:
                for point in fixed_points_above:
                    union_angle = np.arcsin(np.divide(np.matmul(point-current_point, np.array([0,0,1])), np.linalg.norm(point - current_point)))*180/np.pi
                    quadrant = determinate_quadrant(point, current_point)
                    if union_angle >= 44.9 and quadrant in available_quadrants:
                        self.__add_connection(point, i, quadrant, "connections", True)
                        available_quadrants.remove(quadrant)

            # print(f"{len(self.points_to_join)} fixed points joined, remaining quadrants {available_quadrants}")
            j = 0
            while len(available_quadrants) > 0 and j < len(not_fixed_points_above):
                point = not_fixed_points_above[j]
                union_angle = np.arcsin(np.divide(np.matmul(point-current_point, np.array([0,0,1])), np.linalg.norm(point - current_point)))*180/np.pi
                quadrant = determinate_quadrant(point, current_point)

                if union_angle >= 44.9:
                    #If the angle is correct and it is in an empty quadrant, it joins
                    if quadrant in available_quadrants:
                        # print(f"union angle: {union_angle} between {point} and current point joined in quadrant {quadrant}")
                        self.__add_connection(point, i, quadrant, "connections", True)
                        available_quadrants.remove(quadrant)
  
                    # If the angle is correct but its quadrant is occupied, it is moved to an available quadrant
                    else:
                        destiny_quadrant = available_quadrants[0]
                        new_point = generate_point_in_quadrant(current_point, self.r, 1, destiny_quadrant)[0]
                        if not in_volume(new_point, self.shell_points):
                            break

                        # print(f"union angle: {union_angle} between {point} and current point joined in quadrant {destiny_quadrant}  as new point {new_point} because quadrant {quadrant} is ocupied, new angle {new_angle}")
                        self.__add_point(new_point, index_not_fixed_points_above[j], i, destiny_quadrant, "connections")
                        available_quadrants.remove(destiny_quadrant)

                #If the angle is not correct, it is moved to an available quadrant with a correct angle
                else:
                    destiny_quadrant = available_quadrants[0]
                    new_point = generate_point_in_quadrant(current_point, self.r, 1, destiny_quadrant)[0]
                    if not in_volume(new_point, self.shell_points):
                        break

                    # print(f"union angle: {union_angle} between {point} and current point joined in quadrant {destiny_quadrant}  as new point {new_point} because angle is not correct, new angle {new_angle}")
                    self.__add_point(new_point, index_not_fixed_points_above[j], i, destiny_quadrant, "connections")
                    available_quadrants.remove(destiny_quadrant)


                j+=1
            if len(available_quadrants) > 0:
                # print(f"quadrants {available_quadrants} left, generating new points in those quadrants")
                for quadrant in available_quadrants:
                    new_point = generate_point_in_quadrant(current_point, self.r, 1, quadrant)[0]
                    if not in_volume(new_point, self.shell_points):
                        nearest_shell_points = self.shell_points[self.kd_tree.query_ball_point(current_point, self.r)]
                        available_nearest_shell_points = nearest_shell_points[np.where(angle(nearest_shell_points, current_point, np.array([0,0,1])) > 44.9)[0]]
                        for shell_point in available_nearest_shell_points:
                            if quadrant == determinate_quadrant(shell_point, current_point):
                                self.__insert_point(shell_point, i, quadrant, "connections")

                    else:
                        self.__insert_point(new_point, i, quadrant, "connections")
                    # print(f"new point {new_point} generated in quadrant {quadrant}")

            # print(f"points joined: {self.points_to_join}")
            local_dist = np.max(np.linalg.norm(self.points_to_join - current_point, axis=1)) if len(self.points_to_join) > 0 else 0
            self.max_global_dist = local_dist if local_dist > self.max_global_dist else self.max_global_dist
            
            self.z = np.max(exclude_points(self.fixed_points,self.shell_points)[:,2])
            i+=1

        reversed_points = self.points[np.argsort(self.points[:, 2])[::-1]]
        nbrs = NearestNeighbors(algorithm="kd_tree").fit(reversed_points)

        for p in reversed_points:
            if (self.bot_points[:, None] == p).all(-1).any():
                break
            indx_point = np.where(np.all(self.points == p, axis=1))[0][0]
            if indx_point not in self.connections.keys():
                self.connections[indx_point] = {"point": p, "connections": {}, "connections_below" :{}}
            _, indices = nbrs.radius_neighbors([p], radius=1.3*self.r, return_distance=True, sort_results=True)
            pnts = reversed_points[indices[0]]
            #Select one point to evaluate
            current_point = pnts[0,:]
            #Filter the neighbours of the point to keep only the ones below it
            indx_pos_below = np.where(pnts[:,-1] < current_point[-1])
            #Array of this points
            points_below = pnts[indx_pos_below]
            available_quadrants = [1,2,3,4]

            for point in points_below:
                #TODO: change to function
                union_angle = np.arcsin(np.divide(np.matmul(point-current_point, np.array([0,0,-1])), np.linalg.norm(point - current_point)))*180/np.pi
                quadrant = determinate_quadrant(point, current_point)
                if union_angle >= 44.9 and quadrant in available_quadrants:
                    self.__add_connection(point, indx_point, quadrant, "connections_below", False)
                    available_quadrants.remove(quadrant)

        self.__generate_graph()
        self.__remove_close_edges()

        return self.G

    def __remove_close_edges(self):

        init_edges = len(self.G.edges())
        nodes = np.array(self.G.nodes()) 
        tree_points = KDTree(nodes)
        for segment in self.G.edges():
            p1,p2 = np.array(segment)
            mid_point = (p1+p2)/2
            observable_points = np.unique(np.concatenate([x[1:] for x in tree_points.query_ball_point([p1,p2,mid_point], self.max_global_dist)], dtype= int, casting= "unsafe"))
            valid_points = exclude_points(nodes[observable_points],[p1,p2, mid_point])

            observable_segments = []
            for valid_point in valid_points:  
                point_nodes = self.G.neighbors(tuple(valid_point))
                for n in point_nodes:
                    if not isin(np.array(segment), np.array(n)).any() and isin(nodes[observable_points], np.array(n)).any():
                        observable_segments.append(np.array([valid_point,n]))

            observable_segments = np.unique(np.array(list(map(lambda x: x[np.argsort(x[:,0])], observable_segments))), axis=0)
            min_nbr_current_segment = min(list(map(lambda x: calculate_neighbors_in_node(self.G,x), [p1,p2])))
            for s in observable_segments:
                if calculate_segments_dist(s, (p1,p2)) < 0.1:
                    nbr_node = list(map(lambda x: calculate_neighbors_in_node(G,x), s))
                try:
                    if min(nbr_node) > min_nbr_current_segment:
                        self.G.remove_edge(tuple(s[0]), tuple(s[1]))
                    else:
                        self.G.remove_edge(tuple(p1), tuple(p2))
                except:
                    continue
        
        print(f"Initially were {init_edges}. {init_edges - len(G.edges())} edges were removed")

    def __add_point(self, point, array_index, connection_idx, quadrant, connection_type,):
        self.points[array_index] = point
        self.fixed_points = np.vstack((self.fixed_points, point))
        self.connections[connection_idx][connection_type].update({quadrant: point})
        self.points_to_join.append(point)
    
    def __insert_point(self, point, connection_idx, quadrant, connection_type):
        self.points = calculate_position(self.points, point)
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

    def save_data(self):
        np.savez(os.path.join(self.output_path, "tetrahedrons.npz"), tetrahedrons=self.tetrahedrons, free_points=self.free_points, bot_points=self.bot_points, points=self.points)

    def save_adjacency_matrix(self):    
        nodes, matrix = adjacency_matrix(self.G)
        np.savez(os.path.join(self.output_path, "adjacency_matrix.npz"), nodes=nodes, matrix=matrix)