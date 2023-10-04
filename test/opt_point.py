import numpy as np
np.seterr(all="ignore")
import matplotlib.pyplot as plt
from stl import mesh
from utils import in_volume
from sklearn.neighbors import NearestNeighbors
import networkx as nx

from mpl_toolkits.mplot3d import Axes3D
from matplotlib.animation import FuncAnimation
from functools import partial
# # def generar_tensor_coordenadas(n):

# #     xmin = np.min(base_points[:,0])
# #     xmax = np.max(base_points[:,0])
# #     ymin = np.min(base_points[:,1])
# #     ymax = np.max(base_points[:,1])
# #     zmin = np.max(base_points[:,2])

# #     x = np.linspace(xmin, xmax, n)
# #     y = np.linspace(ymin, ymax, n)
# #     z = np.linspace(zmin, zmin + (xmax-xmin), n)
# #     Z, X, Y = np.meshgrid(z, x, y, indexing='ij')

# #     return np.stack((X, Y, Z), axis=-1)

# def generar_tensor_coordenadas(base_points, n):
#     altura = np.linalg.norm(base_points[0] - base_points[1])
#     # Generar coordenadas bariocéntricas aleatorias para el plano base
#     r1 = np.sqrt(np.random.uniform(0, 1, n))
#     r2 = np.random.uniform(0, 1, n)
#     alpha = 1 - r1
#     beta = (1 - r2) * r1
#     gamma = r2 * r1

#     # Generar alturas aleatorias dentro del prisma
#     alturas_aleatorias = np.random.uniform(0, altura, n)
#     # Calcular las coordenadas cartesianas de los puntos dentro del prisma de manera vectorizada
#     puntos_base = alpha[:, np.newaxis] * base_points[0] + beta[:, np.newaxis] * base_points[1] + gamma[:, np.newaxis] * base_points[2] 

#     # Combinar el punto en el plano base con la altura en la dirección Z
#     puntos_generados = puntos_base + np.column_stack((np.zeros(n), np.zeros(n), alturas_aleatorias))

#     return puntos_generados

# def check_point(apex_pos, base_points) -> None:

#   f1 = (np.degrees(np.arccos(-(base_points[0,-1] - apex_pos[-1])/np.linalg.norm([base_points[0,0] - apex_pos[0], base_points[0,1] - apex_pos[1], base_points[0,2] - apex_pos[2]]))) - 45) + \
#         (np.degrees(np.arccos(-(base_points[1,-1] - apex_pos[-1])/np.linalg.norm([base_points[1,0] - apex_pos[0], base_points[1,1] - apex_pos[1], base_points[1,2] - apex_pos[2]]))) - 45) + \
#         (np.degrees(np.arccos(-(base_points[2,-1] - apex_pos[-1])/np.linalg.norm([base_points[2,0] - apex_pos[0], base_points[2,1] - apex_pos[1], base_points[2,2] - apex_pos[2]]))) - 45)

#   f2 = np.degrees(np.arccos(-(base_points[0,-1] - apex_pos[-1])/np.linalg.norm([base_points[0,0] - apex_pos[0], base_points[0,1] - apex_pos[1], base_points[0,2] - apex_pos[2]])))
#   f3 = np.degrees(np.arccos(-(base_points[1,-1] - apex_pos[-1])/np.linalg.norm([base_points[1,0] - apex_pos[0], base_points[1,1] - apex_pos[1], base_points[1,2] - apex_pos[2]])))
#   f4 = np.degrees(np.arccos(-(base_points[2,-1] - apex_pos[-1])/np.linalg.norm([base_points[2,0] - apex_pos[0], base_points[2,1] - apex_pos[1], base_points[2,2] - apex_pos[2]])))


#   print(f1,f2,f3,f4)

# def eval_objective_function(apex_pos, base_points) -> float:

#         f1 = (np.degrees(np.arccos(-(base_points[0,-1] - apex_pos[-1])/np.linalg.norm([base_points[0,0] - apex_pos[0], base_points[0,1] - apex_pos[1], base_points[0,2] - apex_pos[2]]))) - 45)
#         f2 = (np.degrees(np.arccos(-(base_points[1,-1] - apex_pos[-1])/np.linalg.norm([base_points[1,0] - apex_pos[0], base_points[1,1] - apex_pos[1], base_points[1,2] - apex_pos[2]]))) - 45)
#         f3 = (np.degrees(np.arccos(-(base_points[2,-1] - apex_pos[-1])/np.linalg.norm([base_points[2,0] - apex_pos[0], base_points[2,1] - apex_pos[1], base_points[2,2] - apex_pos[2]]))) - 45)

#         angles = [f1,f2,f3]
#         if np.min(angles) < 0:
#           return 100

#         return np.sum(angles)

# base_points = np.array([[ 0.87858421 ,-1.21576715 , 0.28925565],
#  [ 1.11338913, -1.00516903  ,0.29742363],
#  [ 0.87235419 ,-0.93263633,  0.18392836]])



# tensor_coords = generar_tensor_coordenadas(base_points, 1000)
# print(tensor_coords.shape)

# valores_funcion = np.apply_along_axis(eval_objective_function, axis=1, arr=tensor_coords, base_points=base_points)
# valores_funcion[np.isnan(valores_funcion)] = 100

# indice_minimo = np.argmin(np.abs(valores_funcion))

# indice_minimo_3d = np.unravel_index(indice_minimo, valores_funcion.shape)
# punto_optimo = tensor_coords[indice_minimo_3d]
# print(punto_optimo)
# check_point(punto_optimo, base_points)

# fig = plt.figure(figsize=(15,15))
# ax = fig.add_subplot(111, projection="3d")
# ax.scatter(base_points[:, 0], base_points[:, 1], base_points[:,2], facecolors='none', edgecolors='black')
# ax.scatter(punto_optimo[0], punto_optimo[1], punto_optimo[2], facecolors='none', edgecolors='green')

# for i in range(3):
#     plt.plot([base_points[i,0],punto_optimo[0]],[base_points[i,1],punto_optimo[1]],[base_points[i,2],punto_optimo[2]], "yellow")


# plt.show()

def angle(points, ref, plane):
    """
    Compute the angle between a set of points and a reference point and the horizontal plane

    Parameters
    ----------
    point (n) : numpy.ndarray (n, 3, m)
        Array of points
    ref (m) : numpy.ndarray (m, 3)
        Reference point
    plane : numpy.ndarray (1, 3)
        Normal vector of the plane

    Returns
    -------
    numpy.ndarray
        Array of angles (n, 1, m)

    """

    plane_vecs = np.tile(np.array(plane).T, (ref.shape[0],1,1))
    norm_product = np.reshape(np.linalg.norm(points-ref[:,np.newaxis], axis=2), (ref.shape[0], points.shape[1],1))

    return np.reshape(np.arcsin(np.divide(np. matmul(points-ref[:,np.newaxis], plane_vecs), norm_product))*180/np.pi, (ref.shape[0], 1, points.shape[1]))

def knn(X, n_neighbors):
    """
    Compute the k-nearest neighbors of a set of points

    Parameters
    ----------
    X : numpy.ndarray
        Array of points
    n_neighbors : int
        Number of neighbors to compute

    Returns
    -------
    numpy.ndarray
        Array of neighbors
    numpy.ndarray
        Array of distances
    numpy.ndarray
        Array of indices

    """
    nbrs = NearestNeighbors(n_neighbors=n_neighbors, algorithm="ball_tree").fit(X)
    d, indices = nbrs.kneighbors(X)

    return X[indices], d[:,1:], indices[:,1:]

def flat(a):
    """
    Round the values of a tuple to the nearest integer

    Parameters
    ----------
    a : tuple
        Tuple of values

    Returns
    -------
    tuple
        Tuple of rounded values
    """
    return list(map(lambda x: int(np.ceil(x)) if x >= 0 else int(np.floor(x)), a))

def min_max_points(points):
    """
    Compute the minimum and maximum values of a set of points

    Parameters
    ----------
    points : numpy.ndarray
        Array of points

    Returns
    -------
    tuple
        Tuple of tuples with the minimum and maximum values of the points
    """
    return tuple(map(lambda axis: (min(axis), max(axis)), zip(*points)))

m = mesh.Mesh.from_file('../data/Cilindro.stl')
points = np.unique(m.points.reshape([-1,3]), axis=0)

from scipy.stats.qmc import PoissonDisk
min_max = min_max_points(points)

x_min, x_max = flat(min_max[0])
y_min, y_max = flat(min_max[1])
z_min, z_max = flat(min_max[2])

radius = 0.3
n = 1000
all_points = np.zeros([(x_max-x_min)*(y_max-y_min)*(z_max-z_min)*n,3])
for k in range(z_min, z_max):
  for j in range(y_min,y_max):
    for i in range(x_min, x_max):
      vect = np.array([i,j,k])
      engine = PoissonDisk(d=3, radius=radius)
      sample = engine.random(n)
      sub_points = sample + vect
      index_location = int(np.argwhere(np.all(all_points == [0, 0, 0], axis=1))[0])
      all_points[index_location : index_location + len(sub_points)] = sub_points

all_points = all_points[np.argwhere(np.all(all_points != [0, 0, 0], axis=1))]
inner_points = all_points[in_volume(all_points, points)]

all_points = np.concatenate((points, inner_points), axis=0)
_, dist,idx = knn(all_points, 10)


pairs = []
unique_points = set()
for i,d in enumerate(dist):
  c = np.where(d < 0.1)[0]
  if len(c) > 0:
    unique_points.add(i)
    for j in c:
      if (idx[i][c[j]+1], i) not in pairs:
        pairs.append((i,idx[i][c[j]+1]))
        unique_points.add(idx[i][c[j]+1])

new_points = all_points[~np.isin(np.arange(len(all_points)), np.array(list(unique_points)))]
for p in pairs:
  point_1,point_2 = all_points[list(p)]
  if point_1 in points:
    new_points = np.vstack((new_points, point_1))
  elif point_2 in points:
    new_points = np.vstack((new_points, point_2))
  else:
    new_points = np.vstack((new_points, np.mean([point_1, point_2], axis= 0)))

fig = plt.figure(figsize = (10,10))
ax = fig.add_subplot(111, projection='3d')
ax.scatter(*new_points.T, c="blue")
plt.show()

pnts, dists, indices =  knn(new_points,20)

ref_points = pnts[:,0,:]
nbr_points = pnts[:,1:,:]
plane = np.array([[0,0,1]])

angles = angle(nbr_points,ref_points,plane)

G = nx.Graph()
G.add_nodes_from(np.arange(len(indices)))

fig = plt.figure(figsize = (10,10))
ax = fig.add_subplot(111, projection='3d')
ax.scatter(*pnts.T)
uniones =  {}

for i,v in enumerate(pnts):

    current_point = v[0,:]

    indx_pos = np.where(v[:,-1] > current_point[-1]) #Nos quedamos solo con puntos por encima del de referencia
    points_above = v[indx_pos]
    filtered_angles = angles[i][0][np.array(indx_pos) - 1][0] #Angulos con los puntos superiores
    indx_angles = np.where(np.absolute(filtered_angles) > (45- 0.1)) #Angulos mayores a 44.9

    filtered_angles = (filtered_angles[indx_angles] - 45)/360 #Normalizamos los angulos
    filtered_points = points_above[indx_angles] #Puntos que cumplen la condición de angularidad

    filtered_dist = (dists[i][np.array(indx_pos) - 1][0][indx_angles] - np.mean(dists))/np.max(dists) #Distancia de los puntos que cumplen la condición 
                                                                                                    #al punto de refrencia normalizada
    filtered_indices = indices[i][np.array(indx_pos) - 1][0][indx_angles]  #Indices que cumplen la condición de angularidad
    score_array = np.absolute(filtered_angles + filtered_dist)

    for pos,idx in enumerate(filtered_indices):
        node_connections = len(nx.to_dict_of_dicts(G)[idx])
        if node_connections > 0 and node_connections <= 6:
            score_array[pos] /= (7-node_connections)

    for timer,j in enumerate(np.argsort(score_array)):
        # if timer == 5:
        #     break
        G.add_edge(i,filtered_indices[j])
        ax.plot([current_point[0], filtered_points[j,0]],[current_point[1], filtered_points[j,1]],[current_point[2], filtered_points[j,2]])


num_iteraiones = 0
anim = FuncAnimation(fig, partial(actualizar, pnts, angles, dists, indices), repeat= False)
anim.save('./generacion_uniones.gif', writer='pillow')
plt.show()





# from sklearn.neighbors import NearestNeighbors
# np.random.seed(1)
# min_max = min_max_points(points)

# x_min, x_max = flat(min_max[0])
# y_min, y_max = flat(min_max[1])
# z_min, z_max = flat(min_max[2])

# pc = np.array([[np.random.uniform(x_min, x_max), np.random.uniform(y_min, y_max), np.random.uniform(z_min, z_max)] for _ in range(5000)])
# pc = pc[in_volume(pc, points)]
# all_points = np.concatenate((points, pc), axis=0)
# nbr = NearestNeighbors(n_neighbors=10, algorithm='ball_tree').fit(all_points)
# dist, idx = nbr.kneighbors(all_points)

# pairs = []
# unique_points = set()
# for i,d in enumerate(dist):
#   c = np.where(d[1:]<0.1)[0]
#   if len(c) > 0:
#     unique_points.add(i)
#     for j in c:
#       if (idx[i][c[j]+1], i) not in pairs:
#         pairs.append((i,idx[i][c[j]+1]))
#         unique_points.add(idx[i][c[j]+1])

# new_points = all_points[~np.isin(np.arange(len(all_points)), np.array(list(unique_points)))]

# for p in pairs:
#   point_1,point_2 = all_points[list(p)]
#   if point_1 in points:
#     new_points = np.vstack((new_points, point_1))

#   elif point_2 in points:
#     new_points = np.vstack((new_points, point_2))

#   else:
#     new_points = np.vstack((new_points, np.mean([point_1, point_2], axis= 0)))

# print(len(new_points))
# fig = plt.figure(figsize = (10,10))
# ax = fig.add_subplot(111, projection='3d')
# ax.scatter(points[:,0], points[:,1], points[:,2], c='red', marker='*')
# ax.scatter(*new_points.T, c="blue")
# plt.show()