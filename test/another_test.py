import numpy as np
np.seterr(all="ignore")
from stl import mesh
from sklearn.neighbors import NearestNeighbors
from utils import plot
import matplotlib.pyplot as plt
from scipy.spatial import Delaunay

def generate_coords_tensor(n, base_points) -> np.ndarray:

    xmin = np.min(base_points[:,0])
    xmax = np.max(base_points[:,0])
    ymin = np.min(base_points[:,1])
    ymax = np.max(base_points[:,1])
    zmin = np.max(base_points[:,2])

    x = np.linspace(xmin, xmax, n)
    y = np.linspace(ymin, ymax, n)
    z = np.linspace(zmin, zmin + (xmax-xmin), n)
    Z, X, Y = np.meshgrid(z, x, y, indexing='ij')
    
    return np.stack((X, Y, Z), axis=-1)

def check_point(apex_pos, base_points) -> None:
  
    f1 = (np.degrees(np.arccos(-(base_points[0,-1] - apex_pos[-1])/np.linalg.norm([base_points[0,0] - apex_pos[0], base_points[0,1] - apex_pos[1], base_points[0,2] - apex_pos[2]]))) - 45) + \
        (np.degrees(np.arccos(-(base_points[1,-1] - apex_pos[-1])/np.linalg.norm([base_points[1,0] - apex_pos[0], base_points[1,1] - apex_pos[1], base_points[1,2] - apex_pos[2]]))) - 45) + \
        (np.degrees(np.arccos(-(base_points[2,-1] - apex_pos[-1])/np.linalg.norm([base_points[2,0] - apex_pos[0], base_points[2,1] - apex_pos[1], base_points[2,2] - apex_pos[2]]))) - 45) 

    f2 = np.degrees(np.arccos(-(base_points[0,-1] - apex_pos[-1])/np.linalg.norm([base_points[0,0] - apex_pos[0], base_points[0,1] - apex_pos[1], base_points[0,2] - apex_pos[2]])))
    f3 = np.degrees(np.arccos(-(base_points[1,-1] - apex_pos[-1])/np.linalg.norm([base_points[1,0] - apex_pos[0], base_points[1,1] - apex_pos[1], base_points[1,2] - apex_pos[2]])))
    f4 = np.degrees(np.arccos(-(base_points[2,-1] - apex_pos[-1])/np.linalg.norm([base_points[2,0] - apex_pos[0], base_points[2,1] - apex_pos[1], base_points[2,2] - apex_pos[2]])))


    print(f1,f2,f3,f4)

def eval_objective_function(apex_pos, base_points) -> float:

    f1 = (np.degrees(np.arccos(-(base_points[0,-1] - apex_pos[-1])/np.linalg.norm([base_points[0,0] - apex_pos[0], base_points[0,1] - apex_pos[1], base_points[0,2] - apex_pos[2]]))) - 45) 
    f2 = (np.degrees(np.arccos(-(base_points[1,-1] - apex_pos[-1])/np.linalg.norm([base_points[1,0] - apex_pos[0], base_points[1,1] - apex_pos[1], base_points[1,2] - apex_pos[2]]))) - 45) 
    f3 = (np.degrees(np.arccos(-(base_points[2,-1] - apex_pos[-1])/np.linalg.norm([base_points[2,0] - apex_pos[0], base_points[2,1] - apex_pos[1], base_points[2,2] - apex_pos[2]]))) - 45) 

    angles = [f1,f2,f3]
    if np.min(angles) < 0:
        return 100

    return np.sum(angles)


m = mesh.Mesh.from_file('/home/alex/Downloads/Cilindro.stl')
points = np.unique(m.points.reshape([-1,3]), axis=0)
bot_points = points[np.where(points[:,-1] < np.min(points[:,-1]) + 0.1)]
top_points = points[np.where(points[:,-1] > np.max(points[:,-1]) - 0.1)]


fig = plt.figure(figsize=(15,15))
ax = fig.add_subplot(111, projection="3d")


new_vertexs = []
reached_top = False
while not reached_top:
    ax.scatter3D(*bot_points.T)
    bot_points_pr = bot_points[:,:2]
    print(bot_points)
    indices = Delaunay(bot_points_pr).simplices
    print(indices.shape)
    print(indices)
    plt.triplot(bot_points_pr[:,0], bot_points_pr[:,1], indices)
    plt.plot(bot_points_pr[:,0], bot_points_pr[:,1], 'o')
    plt.show()
 
    puntos_optimos = []
    for indice in indices:
        # Obtain the base points from triangulation
        base_points = bot_points[indice]
        # Generate a tensor of coordinates
        tensor_coordenadas = generate_coords_tensor(15, base_points) 
        # Evaluate the objective function in the tensor of coordinates
        valores_funcion = np.apply_along_axis(eval_objective_function, axis=3, arr=tensor_coordenadas, base_points=base_points)
        # Asign the value 100 to the NaN values
        valores_funcion[np.isnan(valores_funcion)] = 100
        # Finded the minimum index of the objective function
        indice_minimo = np.argmin(np.abs(valores_funcion))
        # Obtain the coordinates of the minimum index
        indice_minimo_3d = np.unravel_index(indice_minimo, valores_funcion.shape)
        # Obtain the coordinates of the optimal point
        punto_optimo = tensor_coordenadas[indice_minimo_3d]
        if punto_optimo[-1] >= np.max(points[:,-1]):
            reached_top = True
        else:
            # Add the optimal point to the list of optimal points if it is inside the volume 
            puntos_optimos.append(punto_optimo)
            new_vertexs.append(punto_optimo)
        # print(punto_optimo)
        # check_point(punto_optimo, base_points)

        # ax.scatter(base_points[:, 0], base_points[:, 1], base_points[:,2], facecolors='none', edgecolors='black')
        # ax.scatter(punto_optimo[0], punto_optimo[1], punto_optimo[2], facecolors='none', edgecolors='green')

        # for i in range(3):
        #     plt.plot([base_points[i,0],punto_optimo[0]],[base_points[i,1],punto_optimo[1]],[base_points[i,2],punto_optimo[2]], "blue")
    print(np.array(puntos_optimos).shape)
    print("altura: ", np.max(np.max(np.array(puntos_optimos)[:,-1])))
    bot_points = np.array(puntos_optimos)

plt.show()


# plot(base_points, [base_points[indices[0][0]], base_points[indices[0][1]], base_points[indices[0][3]]])