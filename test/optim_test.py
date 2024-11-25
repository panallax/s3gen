import numpy as np
np.seterr(all="ignore")
from utils import in_volume, extract_points_from_STL, \
                  exclude_points, generate_coords_tensor, eval_objective_function,\
                  remove_short_edges, print_dict, adjacency_matrix, caracteristic_distsance, \
                  plot_Dealunay, update_polyhedrons_dict, min_dist
from scipy.spatial import Delaunay, ConvexHull
from scipy.spatial import cKDTree
import os

TODO = "Refactorize"
TODO = "Move funcitons to utils.py"
TODO = "Add comments and docstrings"
TODO = "Translate to english"

# vertex = 30
# neighbors = get_simplices(dea,vertex)
# print(neighbors)

# points = bot_points_pr
# tri = dea
# plt.triplot(points[:,0], points[:,1], tri.simplices)
# plt.plot(points[neighbors,0], points[neighbors,1], 'or')
# plt.plot(points[vertex,0], points[vertex,1], 'ob')
# plt.show()


TODO = "Finish this function, to join the shell with the inner points"
# def add_shell(shell_points, dict_points):

   
class OPTMeshGen:

    def __init__(self, points, output_path, max_iterations):
        self.points = points
        self.bot_points = self.points[np.where(points[:,-1] < np.min(self.points[:,-1]) + 0.1)]
        self.top_points = self.points[np.where(self.points[:,-1] > np.max(self.points[:,-1]) - 0.1)]
        self.free_points = exclude_points(self.points, self.bot_points)
        self.kd_tree = cKDTree(self.points)
        self.d = caracteristic_distsance(self.points)
        self.tetrahedrons = {}
        if max_iterations :
            self.max_iterations = int(max_iterations)
        else:
            self.max_iterations = 1e5
        self.output_path = output_path

    def generate_mesh(self):
     
        iteration = 0
        bot_points = self.bot_points
        reached_top = False
        while not reached_top or iteration < self.max_iterations:
            if iteration == self.max_iterations:
                print("Max iterations reached")
                break

            optimal_points = []
            bot_points_pr = bot_points[:,:2]
            indices = Delaunay(bot_points_pr).simplices
            # plot_Dealunay(bot_points_pr)
            for i,indice in enumerate(indices):
                # Obtain the base points from triangulation
                base_points = bot_points[indice]
                # Generate a tensor of coordinates
                # tensor_coords = generate_coords_tensor(20, base_points)
                tensor_coords = generate_coords_tensor(1000, base_points)

                # Evaluate the objective function in the tensor of coordinates
                # function_values = np.apply_along_axis(eval_objective_function, axis=3, arr=tensor_coords, base_points=base_points)
                function_values = np.apply_along_axis(eval_objective_function, axis=1, arr=tensor_coords, base_points=base_points)
                # Asign the value 100 to the NaN values
                function_values[np.isnan(function_values)] = 100
                # Finded the minimum index of the objective function
                minimum_index = np.argmin(np.abs(function_values))
                # Obtain the coordinates of the minimum index
                minimum_index_3d = np.unravel_index(minimum_index, function_values.shape)
                # Obtain the coordinates of the optimal point
                optimal_point = tensor_coords[minimum_index_3d]
                if optimal_point[-1] >= np.max(self.points[:,-1]):
                    reached_top = True
                else:
                    if not in_volume(optimal_point, self.points):
                        optimal_point = self.points[self.kd_tree.query(optimal_point, 2)[1][1]]
                    # Add the optimal point to the list of optimal points if it is inside the volume
                    optimal_points.append(optimal_point)
                    self.tetrahedrons[str(iteration) + "_" + str(i)] = {"base_points": base_points, "apex": optimal_point, "generation":  iteration}
            # print_dict(self.tetrahedrons) #plot the tetrahedrons
            # plot_Dealunay(optimal_points)
            shell = self.z_shell_points(self.points, optimal_points, self.d)
            # self.free_points = exclude_points(self.free_points, shell)
            import matplotlib.pyplot as plt
            import matplotlib 
            matplotlib.rcParams.update({'font.size': 16})
            matplotlib.rcParams['mathtext.fontset'] = 'custom'
            matplotlib.rcParams['mathtext.rm'] = 'Bitstream Vera Sans'
            matplotlib.rcParams['mathtext.it'] = 'Bitstream Vera Sans:italic'
            matplotlib.rcParams['mathtext.bf'] = 'Bitstream Vera Sans:bold'
            fig, ax = plt.subplots(1,2, figsize=(15,10))

            points = np.array(optimal_points)
            joined_points, new_dict = self.join_hull_and_shell(self.tetrahedrons, points, self.points)
            tri2 = Delaunay(joined_points[:,:2])
            ax[0].triplot(joined_points[:,0], joined_points[:,1], tri2.simplices)
            ax[0].scatter(*joined_points[:,:2].T, c = "orange")
            ax[0].set_aspect('equal')
            ax[0].set_ylabel("Y [mm]")
            ax[0].set_xlabel("X [mm]")
            print(f"Number of points: {len(joined_points)}")
            np.save("points1.npy", joined_points)
            a = remove_short_edges(points, self.tetrahedrons, self.d/2)
            joined_points, new_dict = self.join_hull_and_shell(self.tetrahedrons, a[0], self.points)
            tri = Delaunay(joined_points[:,:2])
            ax[1].triplot(joined_points[:,:2][:,0], joined_points[:,:2][:,1], tri.simplices)
            ax[1].scatter(*joined_points[:,:2].T, c = "orange")
            ax[1].set_aspect('equal')
            ax[1].set_xlabel("X [mm]")
            print(f"Number of points: {len(joined_points)}")
            np.save("points2.npy", joined_points)
            plt.tight_layout()
            plt.show()
            # new_points, new_dict = remove_short_edges(optimal_points, self.tetrahedrons, self.d/2)
        
            # joined_points, new_dict = self.join_hull_and_shell(self.tetrahedrons, new_points, self.points)
            # joined_points = np.array(optimal_points)
            print(np.mean(joined_points[:,-1]))
            # points_with_shell = np.append(joined_points, shell, axis=0)
            plot_Dealunay(joined_points)

            # points_with_shell = joined_points

            print_dict(new_dict) #plot the tetrahedrons

            # print(np.array(optimal_points).shape)
            # print(self.free_points.shape, self.free_points)

            # altura = np.max(np.max(new_points[:,-1]))
            # print(f"Height: {np.round(altura,3)} mm. {np.round(altura*100/np.max(self.top_points[:,-1]),1)} % completed.", )

            bot_points = np.array(joined_points); del joined_points
            # self.tetrahedrons = new_dict; del new_dict
            iteration += 1

        #Uncommet to plot the triangulation of each iteration
        # plot_Dealunay(bot_points_pr)

        # add_shell(free_points, tetrahedrons, kd_tree)
        # print(self.free_points)
        # print_dict(self.tetrahedrons)

    def save_adjacency_matrix(self):    
        nodes, matrix = adjacency_matrix(self.tetrahedrons)
        np.savez(os.path.join(self.output_path, "adjacency_matrix.npz"), nodes=nodes, matrix=matrix)

    def save_data(self):
        np.savez(os.path.join(self.output_path, "tetrahedrons.npz"), tetrahedrons=self.tetrahedrons, free_points=self.free_points, bot_points=self.bot_points, points=self.points)


    # def z_shell_points(self, points, outter_points, lateral_points, d, L = 5):
    #     """ Not used"""

    #     if outter_points:
    #         z = np.mean(np.array(outter_points)[:,2])
    #     else:
    #         z = np.mean(np.array(points)[:,2])  
            
    #     section_points = lateral_points[(lateral_points[:,2] >= z - d) & (lateral_points[:,2] <= z + d)]
    #     section_line = []
    #     #   s = np.array(list(sorted(section_points, key=lambda p: polar_angle_sort(p, np.array([0,0,0])))))
    #     #   s = np.append(s, [s[0]], axis=0)
    #     #   section_line = LineString(s).simplify(L/10).coords

    #     return np.array(section_line)
    
    def z_shell_points(self, points, bot_points,d):
        """ Extrae los puntos del shell que están más cercanos a los puntos de la capa
        """
        bot_points = np.array(bot_points)
        hull = ConvexHull(bot_points[:,:2])
        hull_points = bot_points[np.unique(hull.vertices)]

        for pt in hull_points:
            bot_points = np.append(bot_points, [points[np.argmin(np.linalg.norm(points - pt, axis= 1))]], axis=0)
        
        return bot_points
    
    def join_hull_and_shell(self, tetra_dict, points, shell):
        # points = np.array(points)
        # inner_points = points[:,:2]
        # dea = Delaunay(inner_points)
        # indices = dea.convex_hull

        # hull = points[np.unique(indices)]
        # closer_points = list(map(lambda x: min_dist(shell,x), hull))

        # for old,new in closer_points:
        #     tetra_dict = update_polyhedrons_dict(tetra_dict, old, new)
        #     points[(points == old).all(-1)] = new
        hull = ConvexHull(points[:,:2])
        hull_points = points[np.unique(hull.vertices)]

        for pt in hull_points:
            points = np.append(points, [shell[np.argmin(np.linalg.norm(shell - pt, axis= 1))]], axis=0)



        return points, tetra_dict
    


if __name__ == "__main__":
    mesh, points, bot_points, top_points, lateral_points = extract_points_from_STL("data/Cilindro(1).stl")
    opt = OPTMeshGen(points, ".", 10000).generate_mesh()
