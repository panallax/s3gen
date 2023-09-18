import numpy as np
np.seterr(all="ignore")
from utils import in_volume, extract_points_from_STL, z_shell_points, \
                  exclude_points, generate_coords_tensor, eval_objective_function,\
                  remove_short_edges, print_dict, adjacency_matrix, caracteristic_distsance, \
                  plot_Dealunay
from scipy.spatial import Delaunay
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

   
class MeshGen:

    def __init__(self, points, output_path, max_iterations):
        self.points = points
        self.bot_points = self.points[np.where(points[:,-1] < np.min(self.points[:,-1]) + 0.1)]
        self.top_points = self.points[np.where(self.points[:,-1] > np.max(self.points[:,-1]) - 0.1)]
        self.free_points = exclude_points(self.points, self.bot_points)
        self.kd_tree = cKDTree(self.points)
        self.d = caracteristic_distsance(self.points)
        self.tetrahedrons = {}
        if max_iterations :
            self.max_iterations = max_iterations
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
                tensor_coords = generate_coords_tensor(20, base_points)
                # Evaluate the objective function in the tensor of coordinates
                function_values = np.apply_along_axis(eval_objective_function, axis=3, arr=tensor_coords, base_points=base_points)
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

            shell = z_shell_points(self.points, optimal_points, self.d)
            self.free_points = exclude_points(self.free_points, shell)
            optimal_points = np.append(optimal_points, shell, axis=0) 
            new_points, new_dict = remove_short_edges(optimal_points, self.tetrahedrons, self.d/2)

            print_dict(new_dict) #plot the tetrahedrons

            # print(np.array(optimal_points).shape)
            # print(new_points.shape)
            altura = np.max(np.max(new_points[:,-1]))
            print(f"Height: {np.round(altura,3)} mm. {np.round(altura*100/np.max(self.top_points[:,-1]),1)} % completed.", )

            bot_points = np.array(new_points); del new_points
            self.tetrahedrons = new_dict; del new_dict
            bot_points_pr = bot_points[:,:2]
            iteration += 1

        #Uncommet to plot the triangulation of each iteration
        # plot_Dealunay(bot_points_pr)

        # add_shell(free_points, tetrahedrons, kd_tree)
        print_dict(self.tetrahedrons)

    def save_adjacency_matrix(self):    
        nodes, matrix = adjacency_matrix(self.tetrahedrons)
        np.savez(os.path.join(self.output_path, "adjacency_matrix.npz"), nodes=nodes, matrix=matrix)

    def save_data(self):
        np.savez(os.path.join(self.output_path, "tetrahedrons.npz"), tetrahedrons=self.tetrahedrons, free_points=self.free_points, bot_points=self.bot_points, points=self.points)

