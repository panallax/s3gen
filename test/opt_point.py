import numpy as np
np.seterr(all="ignore")
import matplotlib.pyplot as plt
from stl import mesh
from utils import in_volume, extract_points_from__STL
from sklearn.neighbors import NearestNeighbors
import networkx as nx
import os
from collections import Counter
from scipy.spatial import  KDTree
from time import time

#angle

#knn

#flat

#min_max_points

#fill_volume

#calculate_position

# generate_point_in_quadrant

# determinate_quadrant

def generate_points(center, points):
  "Unused function"
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

# exclude points

#isin

#calculate_segments_dist

#calculate_neighbors_in_node
t = time()

shell_points = extract_points_from__STL('../data/Cone.stl')
r = 0.6
new_points = fill_volume(shell_points, r)
connections = {}

#Sort from z=0
new_points = new_points[np.argsort(new_points[:, 2])[::1]]
top_points = shell_points[np.where(shell_points[:,-1] > np.max(shell_points[:,-1]) - 0.1)]
bot_points = shell_points[np.where(shell_points[:,-1] < np.min(shell_points[:,-1]) + 0.1)]

z = new_points[0][-1]
z_max = new_points[-1][-1]
i = 1
max_global_dist = 0
fixed_points = shell_points
kd_tree = KDTree(shell_points)

while z<z_max:

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
  # print(f"current point: {current_point} is shell point {isin(shell_points, current_point)}")
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
    # print(f"quadrants {available_quadrants} left, generating new points in those quadrants")
    for quadrant in available_quadrants:
      new_point = generate_point_in_quadrant(current_point, r,1, quadrant)[0]
      if not in_volume(new_point, shell_points):
          nearest_shell_points = shell_points[kd_tree.query_ball_point(current_point,r)]
          available_nearest_shell_points = nearest_shell_points[np.where(angle(nearest_shell_points, current_point, np.array([0,0,1])) > 44.9)[0]]
          for ap in available_nearest_shell_points:
              if quadrant == determinar_cuadrante(ap - current_point):
                new_point = ap
                connections[i]["connections"].update({quadrant: new_point})
                new_points = calculate_position(new_points, new_point)
                fixed_points = np.vstack((fixed_points, new_point))
                points_to_join.append(new_point)
                local_dist = np.max(np.linalg.norm(points_to_join - current_point, axis=1)) if len(points_to_join) > 0 else 0

      else:
        connections[i]["connections"].update({quadrant: new_point})
        new_points = calculate_position(new_points, new_point)
        fixed_points = np.vstack((fixed_points, new_point))
        points_to_join.append(new_point)
      # print(f"new point {new_point} generated in quadrant {quadrant}")

  # print(f"points joined: {points_to_join}")
  local_dist = np.max(np.linalg.norm(points_to_join - current_point, axis=1)) if len(points_to_join) > 0 else 0
  max_global_dist = local_dist if local_dist > max_global_dist else max_global_dist
  
  z = np.max(exclude_points(fixed_points,shell_points)[:,2])
  i+=1

reversed_points = new_points[np.argsort(new_points[:, 2])[::-1]]
nbrs = NearestNeighbors(algorithm="kd_tree").fit(reversed_points)

for i,p in enumerate(reversed_points):
  if (bot_points[:, None] == p).all(-1).any():
      break
  indx_point = np.where(np.all(new_points == p, axis=1))[0][0]
  if indx_point not in connections.keys():
      connections[indx_point] = {"point": p, "connections": {}, "connections_below" :{}}
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

  for i,point in enumerate(points_below):
      union_angle = np.arcsin(np.divide(np.matmul(point-current_point, np.array([0,0,-1])), np.linalg.norm(point - current_point)))*180/np.pi
      quadrant = determinar_cuadrante(point - current_point)
      if union_angle >= 44.9 and quadrant in available_quadrants:
          connections[indx_point]["connections_below"].update({quadrant: point})
          available_quadrants.remove(quadrant)
          points_to_join.append(point)

print(f"Structure generated in {time() - t} seconds.")
t1 = time()
G = nx.Graph()
for j,value in enumerate(connections.values()):
    tuples_points = list(map(tuple,[value['point']] + list(value.get('connections', {}).values()) + list(value.get('connections_below', {}).values())))
    G.add_nodes_from(list(map(tuple,tuples_points)))
    for i in range(1,len(tuples_points)):
      G.add_edge(tuples_points[0], tuples_points[i])

init_edges = len(G.edges())

nodes = np.array(G.nodes()) 
tree_points = KDTree(nodes)
for segment in G.edges():
  p1,p2 = np.array(segment)
  mid_point = (p1+p2)/2
  observable_points = np.unique(np.concatenate([x[1:] for x in tree_points.query_ball_point([p1,p2,mid_point], max_global_dist)], dtype= int, casting= "unsafe"))
  valid_points = exclude_points(nodes[observable_points],[p1,p2, mid_point])

  observable_segments = []
  for valid_point in valid_points:  
    point_nodes = G.neighbors(tuple(valid_point))
    for n in point_nodes:
      if not isin(np.array(segment), np.array(n)).any() and isin(nodes[observable_points], np.array(n)).any():
        observable_segments.append(np.array([valid_point,n]))

  observable_segments = np.unique(np.array(list(map(lambda x: x[np.argsort(x[:,0])], observable_segments))), axis=0)
  min_nbr_current_segment = min(list(map(lambda x: calculate_neighbors_in_node(G,x), [p1,p2])))
  for s in observable_segments:
    if calculate_segments_dist(s, (p1,p2)) < 0.1:
      nbr_node = list(map(lambda x: calculate_neighbors_in_node(G,x), s))
      try:
        if min(nbr_node) > min_nbr_current_segment:
          G.remove_edge(tuple(s[0]), tuple(s[1]))
        else:
          G.remove_edge(tuple(p1), tuple(p2))
      except Exception as e:
        continue

plt.show()

print(time()-t)
print(f"Initially were {init_edges}. {init_edges - len(G.edges())} edges were removed")
print(f"Optimization done in {time() - t1} seconds.")

fig = plt.figure(figsize=(10,10))
ax = fig.add_subplot(projection = "3d")
for edge in G.edges():
  edege = np.array(edge)
  ax.plot([edge[0][0], edge[1][0]],[edge[0][1], edge[1][1]],[edge[0][2], edge[1][2]])

plt.show()

print(f"Execution time: {time() - t} seconds")


# nodes = list(map(np.array,G.nodes()))
# matrix = nx.adjacency_matrix(G).todense()
# np.savez(os.path.join('.', "adjacency_matrix.npz"), nodes=nodes, matrix=matrix)


