import numpy as np
np.seterr(all="ignore")
import matplotlib.pyplot as plt
from stl import mesh
from utils import in_volume
from sklearn.neighbors import NearestNeighbors
import networkx as nx
from mpl_toolkits.mplot3d import Axes3D
from matplotlib.animation import FuncAnimation
import os
from scipy.stats.qmc import PoissonDisk
from collections import Counter
from scipy.spatial import cKDTree

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

def fill_volume(shell_points, r=0.2):
  min_max = min_max_points(shell_points)

  x_min, x_max = flat(min_max[0])
  y_min, y_max = flat(min_max[1])
  z_min, z_max = flat(min_max[2])

  radius = r
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
  inner_points = all_points[in_volume(all_points, shell_points)]

  all_points = np.concatenate((shell_points, inner_points), axis=0)
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
    if point_1 in shell_points:
      new_points = np.vstack((new_points, point_1))
    elif point_2 in shell_points:
      new_points = np.vstack((new_points, point_2))
    else:
      new_points = np.vstack((new_points, np.mean([point_1, point_2], axis= 0)))

  return new_points


def calculate_position(cloud_points, point):

    distances = np.abs(cloud_points[:,2] - point[2])
    print(f"in position {np.argsort(distances)[0]}")
    cloud_points = np.insert(cloud_points, np.argsort(distances)[0]+1, point, axis=0)

    return cloud_points

def generate_point_in_quadrant(center, r, n, quadrant):
    "https://www.bogotobogo.com/Algorithms/uniform_distribution_sphere.php"
    if quadrant == 5:
      theta_range = np.array([0, np.pi*2])
    else:
      theta_range =  np.array([np.pi/9, np.pi/2 - np.pi/9]) + (quadrant - 1)*np.pi/2

    #Between 45 and 80 degrees
    phi_range = np.array([ np.pi/9, np.pi/4])
    theta = np.random.uniform(*theta_range, n)
    phi = np.random.uniform(*phi_range, n)

    x = r*np.sin(phi)*np.cos(theta)
    y = r*np.sin(phi)*np.sin(theta)
    z = r*np.cos(phi)

    return np.column_stack((x, y, z)) + center

def determinar_cuadrante(punto):
    if len(punto) == 2:
      x,y = punto
    else:
      x, y, z = punto
    if x > 0:
      return 1 if y > 0 else 4
    else:
      return 2 if y > 0 else 3

def generate_points(center, points):

  # points = generate_point_in_quadrant(center,1,2, 5)
  if len(points) > 0:
    norms = points[:,:2] - center[:2]
    cuadrantes = list(map(lambda punto: determinar_cuadrante(punto), norms))
    repes = [n for n, t in Counter(cuadrantes).items() for _ in range(t-1) if t > 1]
  else:
    cuadrantes = [1,2,3,4]

  faltan = set(range(1, 5)) - set(cuadrantes)
  if len(repes) > 0:
    for i,v in enumerate(cuadrantes):
      if v in repes:
        quadrant = faltan.pop()
        points[i] = generate_point_in_quadrant(center, 1,1,quadrant)
        cuadrantes[i] = quadrant
        repes.remove(v)

  if len(cuadrantes) < 4:
    for i in faltan:
      points = np.vstack((points, generate_point_in_quadrant(center, 1,1,i)))
      cuadrantes.append(i)

  return points

def exclude_points(arr, values_to_remove):
  """
  Remove the rows of arr that are equal to any of the rows of values_to_remove

  Arguments:
      arr {np.ndarray} -- Array of points
      values_to_remove {np.ndarray} -- Array of points to remove

  Returns:
      np.ndarray -- Array of points without the points of values_to_remove

  """
  arr = np.array(arr)
  values_to_remove = np.array(values_to_remove)
  mask = ~np.all(np.isin(arr,values_to_remove), axis=1)
  new_arr = arr[mask]

  return new_arr

m = mesh.Mesh.from_file('../data/Cilindro.stl')
shell_points = np.unique(m.points.reshape([-1,3]), axis=0)
r = 0.6
new_points = fill_volume(shell_points, r)
connections = {}

#Sort from z=0
new_points = new_points[np.argsort(new_points[:, 2])[::1]]
top_points = shell_points[np.where(shell_points[:,-1] > np.max(shell_points[:,-1]) - 0.1)]
bot_points = shell_points[np.where(shell_points[:,-1] < np.min(shell_points[:,-1]) + 0.1)]
print(len(top_points))
z = new_points[0][-1]
z_max = new_points[-1][-1]
i = 0

fixed_points = shell_points

fig = plt.figure(figsize = (10,10))
ax = fig.add_subplot(111, projection='3d')
kd_tree = cKDTree(shell_points)
while z<z_max:
# while i <200:
    print(i)
    if (top_points[:, None] == new_points[i]).all(-1).any():
       break
    nbrs = NearestNeighbors(algorithm="kd_tree").fit(new_points)
    d, indices = nbrs.radius_neighbors([new_points[i]], radius=1.3*r, return_distance=True, sort_results=True)
    points_to_join = []
    pnts = new_points[indices[0]]
    dists = d[0][1:]
    index = indices[0][1:]
    #Select one point to evaluate
    current_point = pnts[0,:]
    print("current point: ", current_point)
    connections[i] = {"point": current_point, "connections": {}, "connections_below" :{}}

    #Filter the neighbours of the point to keep only the ones above it
    indx_pos_above = np.where(pnts[:,-1] > current_point[-1])
    #Array of this points
    points_above = pnts[indx_pos_above]
    indx_above = indices[0][indx_pos_above]

    fixed_points_above = points_above[(points_above[:, None] == fixed_points).all(-1).any(-1)]
    index_fixed_points_above = indx_above[(points_above[:, None] == fixed_points).all(-1).any(-1)]
    not_fixed_points_above = points_above[~(points_above[:, None] == fixed_points).all(-1).any(-1)]
    index_not_fixed_points_above = indx_above[~(points_above[:, None] == fixed_points).all(-1).any(-1)]

    available_quadrants = [1,2,3,4]

    if len(fixed_points_above) > 0:
        for point in fixed_points_above:
            union_angle = np.arcsin(np.divide(np.matmul(point-current_point, np.array([0,0,1])), np.linalg.norm(point - current_point)))*180/np.pi
            quadrant = determinar_cuadrante(point - current_point)
            if union_angle >= 44.9 and quadrant in available_quadrants:
                connections[i]["connections"].update({quadrant: point})
                available_quadrants.remove(quadrant)
                fixed_points = np.vstack((fixed_points, point))
                points_to_join.append(point)
    # print(f"{len(points_to_join)} fixed points joined, remaining quadrants {available_quadrants}")
    j = 0
    while len(available_quadrants) > 0 and j < len(not_fixed_points_above):
        point = not_fixed_points_above[j]
        union_angle = np.arcsin(np.divide(np.matmul(point-current_point, np.array([0,0,1])), np.linalg.norm(point - current_point)))*180/np.pi
        quadrant = determinar_cuadrante(point - current_point)

        if union_angle >= 44.9:
            #If the angle is correct and it is in an empty quadrant, it joins
            if quadrant in available_quadrants:
                # print(f"union angle: {union_angle} between {point} and current point joined in quadrant {quadrant}")
                connections[i]["connections"].update({quadrant: point})
                available_quadrants.remove(quadrant)
                fixed_points = np.vstack((fixed_points, point))
                points_to_join.append(point)
            # If the angle is correct but its quadrant is occupied, it is moved to an available quadrant
            else:
                destiny_quadrant = available_quadrants[0]
                new_point = generate_point_in_quadrant(current_point,r,1, destiny_quadrant)[0]
                if not in_volume(new_point, shell_points):
                    break

                new_angle = np.arcsin(np.divide(np. matmul(new_point-current_point, np.array([0,0,1])), np.linalg.norm(new_point - current_point)))*180/np.pi  
                # print(f"union angle: {union_angle} between {point} and current point joined in quadrant {destiny_quadrant}  as new point {new_point} because quadrant {quadrant} is ocupied, new angle {new_angle}")
                new_points[index_not_fixed_points_above[j]] = new_point
                connections[i]["connections"].update({destiny_quadrant: new_point})
                fixed_points = np.vstack((fixed_points, new_point))
                available_quadrants.remove(destiny_quadrant)
                points_to_join.append(new_point)
        #If the angle is not correct, it is moved to an available quadrant with a correct angle
        else:
            destiny_quadrant = available_quadrants[0]
            new_point = generate_point_in_quadrant(current_point,r,1, destiny_quadrant)[0]
            if not in_volume(new_point, shell_points):
                break

            new_angle = np.arcsin(np.divide(np. matmul(new_point-current_point, np.array([0,0,1])), np.linalg.norm(new_point - current_point)))*180/np.pi
            # print(f"union angle: {union_angle} between {point} and current point joined in quadrant {destiny_quadrant}  as new point {new_point} because angle is not correct, new angle {new_angle}")
            new_points[index_not_fixed_points_above[j]] = new_point
            connections[i]["connections"].update({destiny_quadrant: new_point})
            fixed_points = np.vstack((fixed_points, new_point))
            available_quadrants.remove(destiny_quadrant)
            points_to_join.append(new_point)

        j+=1
    if len(available_quadrants) > 0:
    #   print(f"quadrants {available_quadrants} left, generating new points in those quadrants")
      for quadrant in available_quadrants:
        new_point = generate_point_in_quadrant(current_point, r,1, quadrant)[0]
        if not in_volume(new_point, shell_points):
            continue
        connections[i]["connections"].update({quadrant: new_point})
        new_points = calculate_position(new_points, new_point)
        
        fixed_points = np.vstack((fixed_points, new_point))
        points_to_join.append(new_point)
    # print(points_to_join)


    for p in range(len(points_to_join)):
      ax.plot([current_point[0], points_to_join[p][0]],[current_point[1], points_to_join[p][1]],[current_point[2], points_to_join[p][2]])

    z = np.max(exclude_points(fixed_points,shell_points)[:,2])
    # print("points to join: ", points_to_join)
    # print(z)
    print("=================================")
    # print(len(fixed_points), z)
    i+=1

reversed_points = new_points[np.argsort(new_points[:, 2])[::-1]]
for i,p in enumerate(reversed_points):
    if (bot_points[:, None] == p).all(-1).any():
        break
    indx_point = np.where(np.all(new_points == p, axis=1))[0][0]
    if indx_point not in connections.keys():
        connections[indx_point] = {"point": p, "connections": {}, "connections_below" :{}}
    nbrs = NearestNeighbors(algorithm="kd_tree").fit(new_points)
    d, indices = nbrs.radius_neighbors([p], radius=1.3*r, return_distance=True, sort_results=True)
    pnts = reversed_points[indices[0]]
    dists = d[0][1:]
    index = indices[0][1:]
    #Select one point to evaluate
    current_point = pnts[0,:]
    #Filter the neighbours of the point to keep only the ones below it
    indx_pos_below = np.where(pnts[:,-1] < current_point[-1])
    #Array of this points
    points_below = pnts[indx_pos_below]
    indx_below = indices[0][indx_pos_below]
    points_to_join = []
    available_quadrants = [1,2,3,4]

    for point in points_below:
        union_angle = np.arcsin(np.divide(np.matmul(point-current_point, np.array([0,0,-1])), np.linalg.norm(point - current_point)))*180/np.pi
        quadrant = determinar_cuadrante(point - current_point)
        if union_angle >= 44.9 and quadrant in available_quadrants:
            connections[indx_point]["connections_below"].update({quadrant: point})
            available_quadrants.remove(quadrant)
            points_to_join.append(point)
    for p in range(len(points_to_join)):
      ax.plot([current_point[0], points_to_join[p][0]],[current_point[1], points_to_join[p][1]],[current_point[2], points_to_join[p][2]])

print(len(top_points), len(new_points), len(fixed_points))
print(connections)

G = nx.Graph()
for value in connections.values():
    tuples_points = list(map(tuple,[value['point']] + list(value.get('connections', {}).values()) + list(value.get('connections_below', {}).values())))
    G.add_nodes_from(list(map(tuple,tuples_points)))
    for i in range(1,len(tuples_points)):
      G.add_edge(tuples_points[0], tuples_points[i])

nodes = list(map(np.array,G.nodes()))
matrix = nx.adjacency_matrix(G).todense()
np.savez(os.path.join('.', "adjacency_matrix.npz"), nodes=nodes, matrix=matrix)
ax.scatter(*fixed_points.T)
plt.show()


