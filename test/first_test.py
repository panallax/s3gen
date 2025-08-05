import numpy as np
from stl import mesh
import matplotlib.pyplot as plt
import networkx as nx
from scipy.spatial import Delaunay
from sklearn.neighbors import NearestNeighbors

def in_volume(p, hull):
    if not isinstance(hull,Delaunay):
        hull = Delaunay(hull)

    return hull.find_simplex(p) >= 0
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
    if len(points.shape) <= 2:
      norm_product = np.linalg.norm(points-ref, axis=1)
      return np.arcsin(np.divide(np. matmul(points-ref, plane), norm_product))*180/np.pi

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
    nbrs = NearestNeighbors(n_neighbors=n_neighbors, algorithm="kd_tree").fit(X)
    d, indices = nbrs.kneighbors(X)

    return X[indices], d[:,1:], indices[:,1:]

m = mesh.Mesh.from_file('../data/Cilindro(1).stl')
points = np.unique(m.points.reshape([-1,3]), axis=0)

fig = plt.figure(figsize=(10,10))
ax = fig.add_subplot(111, projection='3d')
ax.scatter(*points.T)
ax.set_aspect('equal')
plt.show()

# np.random.seed(1)

# min_max = min_max_points(points)

# x_min, x_max = flat(min_max[0])
# y_min, y_max = flat(min_max[1])
# z_min, z_max = flat(min_max[2])

# pc = np.array([[np.random.uniform(x_min, x_max), np.random.uniform(y_min, y_max), np.random.uniform(z_min, z_max)] for _ in range(100)])
# pc = pc[in_volume(pc, points)]
# all_points = pc
# # all_points = np.concatenate((points, pc), axis=0)
# done = False
# l=0
# while not done:
#   nbr = NearestNeighbors(n_neighbors=10, algorithm='ball_tree').fit(all_points)
#   dist, idx = nbr.kneighbors(all_points)
#   pairs = []
#   unique_points = set()
#   for i,d in enumerate(dist):
#     c = np.where(d[1:]<0.1)[0] 
#     if len(c) > 0:
#       unique_points.add(i)
#       for j in c:
#         if (idx[i][c[j]+1], i) not in pairs:
#           pairs.append((i,idx[i][c[j]+1]))
#           unique_points.add(idx[i][c[j]+1])

#   new_points = all_points[~np.isin(np.arange(len(all_points)), np.array(list(unique_points)))]
#   for p in pairs:
#     point_1,point_2 = all_points[list(p)]
#     if point_1 in points:
#       new_points = np.vstack((new_points, point_1))
#     elif point_2 in points:
#       new_points = np.vstack((new_points, point_2))
#     else:
#       new_points = np.vstack((new_points, np.mean([point_1, point_2], axis= 0)))

#   nbr = NearestNeighbors(n_neighbors=10, algorithm='ball_tree').fit(new_points)
#   dist,_ = nbr.kneighbors(new_points)
#   for d in dist:
#       c = np.where(d[1:]<0.1)[0]
#       if len(c) > 0:
#         done = False
#         all_points = new_points
#       else:
#         done = True
#   l+=1

# # fig = plt.figure(figsize = (10,10))
# # ax = fig.add_subplot(111, projection='3d')
# # ax.scatter(points[:,0], points[:,1], points[:,2], c='red', marker='*')
# # ax.scatter(*new_points.T, c="blue")
# # plt.show()

# """
# Algoritmo que une los puntos
# """

# #Sort from z=0
# new_points = new_points[np.argsort(new_points[:, 2])[::1]]
# #Calculate neighbors, distances and indices of neighbors for each point
# pnts, dists, indices =  knn(new_points,30)
# #Array of evaluated points
# ref_points = pnts[:,0,:]
# #Array of nearest neighbros for each reference point
# nbr_points = pnts[:,1:,:]
# #Normal vector of horizontal plane
# plane = np.array([[0,0,1]])
# #Tensor of angles, in each slice the angles between the correponding reference point and its neighbours are calculated
# angles = angle(nbr_points,ref_points,plane)

# G = nx.Graph()
# G.add_nodes_from(np.arange(len(indices)))

# fig = plt.figure(figsize = (10,10))
# ax = fig.add_subplot(111, projection='3d')
# ax.scatter(*pnts.T)

# for i,v in enumerate(pnts):
#     #Select one point to evaluate
#     current_point = v[0,:]
#     #Filter the neighbours of the point to keep only the ones above it
#     indx_pos = np.where(v[:,-1] > current_point[-1])
#     #Array of this points
#     points_above = v[indx_pos]
#     #Array of angles of those points
#     filtered_angles = angles[i][0][np.array(indx_pos) - 1][0]
#     #Discard the points with an angle of less than 45 degree
#     indx_angles = np.where(np.absolute(filtered_angles) > (45 - 0.1))
#     #Noramlization of those angles (should try to devide by 90 instead of 360)
#     filtered_angles = (filtered_angles[indx_angles] - 45)/360
#     #Array of points that meet the angularity condition
#     filtered_points = points_above[indx_angles]
#     #Normlization of the distance between points with the maximum distance
#     filtered_dist = (dists[i][np.array(indx_pos) - 1][0][indx_angles])/np.max(dists)
#     #Array of index that meet the angularity condition
#     filtered_indices = indices[i][np.array(indx_pos) - 1][0][indx_angles]

#     score_array = np.absolute(filtered_angles + filtered_dist)
#     #Restrict connections to a maximum of 6 and favour connections to points with fewer connections (might change)
#     for pos,idx in enumerate(filtered_indices):
#         node_connections = len(nx.to_dict_of_dicts(G)[idx])
#         if node_connections > 0 and node_connections <= 6:
#             score_array[pos] /= (6-node_connections)
#     print(current_point, score_array)
#     for timer,j in enumerate(np.argsort(score_array)):
#         if len(score_array)<=20:
#           # if timer == 6:
#           #     break
#           G.add_edge(i,filtered_indices[j])
#           ax.plot([current_point[0], filtered_points[j,0]],[current_point[1], filtered_points[j,1]],[current_point[2], filtered_points[j,2]])

#     # plt.show()

#     # print(filtered_points)
#     # print(filtered_angles)
#     # print(filtered_dist)
#     # print(indices[i][np.array(indx_pos) - 1][0][indx_angles])
#     # print(np.absolute(filtered_angles + filtered_dist))
#     # print("----")
# ax.set_aspect("equal")
# ax.set_xlabel("X [mm]", {'fontsize': 16})
# ax.set_ylabel("Y [mm]", {'fontsize': 16})
# ax.set_zlabel("Z [mm]", {"fontsize": 16})
# ax.set_aspect('equal')
# plt.tight_layout()
# # plt.savefig("first_test.svg")

# plt.show()
