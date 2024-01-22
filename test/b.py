import numpy as np
np.seterr(all="ignore")
from stl import mesh
from sklearn.neighbors import NearestNeighbors
# from utils import plot
import matplotlib.pyplot as plt
from scipy.spatial import Delaunay, cKDTree
from scipy.spatial.distance import pdist, squareform
import itertools
import config
from utils import extract_points_from_STL, parsed_path, angle
import networkx as nx
import pickle
import os

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


def eval_objective_function(apex_pos, base_points) -> float:

    # f1 = (np.degrees(np.arccos(-(base_points[0,-1] - apex_pos[-1])/np.linalg.norm([base_points[0,0] - apex_pos[0], base_points[0,1] - apex_pos[1], base_points[0,2] - apex_pos[2]]))) - 45)
    # f2 = (np.degrees(np.arccos(-(base_points[1,-1] - apex_pos[-1])/np.linalg.norm([base_points[1,0] - apex_pos[0], base_points[1,1] - apex_pos[1], base_points[1,2] - apex_pos[2]]))) - 45)
    # f3 = (np.degrees(np.arccos(-(base_points[2,-1] - apex_pos[-1])/np.linalg.norm([base_points[2,0] - apex_pos[0], base_points[2,1] - apex_pos[1], base_points[2,2] - apex_pos[2]]))) - 45)

    # angles = [f1,f2,f3]
    # if np.min(angles) < 0:
    #     return 100

    # return np.sum(angles)
    angles = []
    for i in range(len(base_points)):
      f = (np.degrees(np.arcsin(-(base_points[i,-1] - apex_pos[-1])/np.linalg.norm([base_points[i,0] - apex_pos[0], base_points[i,1] - apex_pos[1], base_points[i,2] - apex_pos[2]]))) - 45)
      angles.append(f)
    if np.min(angles) < 0:
      return 100

    return np.sum(angles)

def neighbours(simplex, simplices):
  """
  n -> puntos del simplex vecino
  n_idx -> indice de los vecinos dentro de simplices
  """

  # simplices = np.array(simplices)
  n = []
  n_idx = []
  for pr in [(simplex[i], simplex[(i + 1) % len(simplex)]) for i in range(len(simplex))]:
    for idx, splx in enumerate(simplices):
      if np.count_nonzero((splx[:, None] == pr).all(-1).any(-1)) >= 2 and not (splx[:,None] == simplex).all(-1).diagonal().all():
        n.append(splx)
        n_idx.append(idx)

  return n_idx,n

def polar_angle_sort(point, ref_point):
    x, y = point[0] - ref_point[0], point[1] - ref_point[1]
    return np.arctan2(y, x)

def area_polygon(points):
    center = np.mean(points, axis=0)
    sorted_points = sorted(points, key=lambda p: polar_angle_sort(p, center))
    # Aplicar la fórmula de Shoelace
    area = 0.5 * abs(sum(x0*y1 - x1*y0 for ((x0, y0), (x1, y1)) in zip(sorted_points, sorted_points[1:] + [sorted_points[0]])))
    return area

def plot_tessellation(points, dea):
  fig, ax = plt.subplots(figsize=(10,10))
  for d in dea:
    # pares = alpha_shape_edges(points[d],0.3)
    # lista_puntos = list(sorted(points[d], key=lambda p: polar_angle_sort(p, np.mean(points[d], axis=0))))
    points_simplex = points[d]
    pares_consecutivos = [(points_simplex[i], points_simplex[(i + 1) % len(points_simplex)]) for i in range(len(points_simplex))]
    for par in pares_consecutivos:
        x_values = [par[0][0], par[1][0]]
        y_values = [par[0][1], par[1][1]]
        ax.plot(x_values, y_values, marker='o', color="green")

  ax.set_aspect('equal', adjustable='datalim')

  # Mostrar el gráfico
  plt.show()

def remove_closer_points(tetra_dict, points, shell_points):
  points = np.unique(points, axis=0)
  points_pr = points[:,:2]
  dists = squareform(pdist(points_pr))
  closer = np.where((dists <= 0.1) & (dists>0))
  groups = join_paths(list(zip(*closer)))

  if len(groups) != 0:
    indx_to_delete = []
    for g in groups:
      g = np.array(g)
      check_shell = (points_pr[g][:,None] == shell_points[:,:2]).all(-1).any(-1)
      if check_shell.any():
        print("AAAA")
        shell_point = points_pr[g][np.nonzero(check_shell)][0]
        indx_to_delete.extend(np.delete(g, np.nonzero(check_shell), axis=0).tolist())
        # bot_points_pr = np.delete(points[g],np.nonzero(check_shell), axis=0)
        for p in np.delete(points_pr[g],np.nonzero(check_shell), axis=0):
          tetra_dict = update_tetrahedrons_dict(tetra_dict, p, shell_point)
      else:
        new_point = np.mean(points[g], axis=0)
        indx_to_delete.extend(g.tolist())
        # bot_points_pr = np.delete(bot_points_pr,bot_points_pr[g] , axis=0)
        points = np.vstack((points, new_point))
        for pt in points_pr[np.array(g)]:
          tetra_dict = update_tetrahedrons_dict(tetra_dict, pt, new_point)

    spaced_points = np.delete(points, indx_to_delete, axis=0)
    
    return tetra_dict, spaced_points
  else:
    return tetra_dict, points
  
def exclude_points(arr, values_to_remove):
  mask = ~np.all(np.isin(arr,values_to_remove), axis=1)
  new_arr = arr[mask]

  return new_arr

def in_volume(p, hull):
    if not isinstance(hull,Delaunay):
        hull = Delaunay(hull)

    return hull.find_simplex(p) >= 0

def caracteristic_distsance(points):
    kd_tree = cKDTree(points)
    total_dist = 0.0
    for point in points:
        dist,_ = kd_tree.query(point, k=2)
        total_dist += dist[1]  # Ignorar la distancia a sí mismo

    return total_dist / len(points)

def z_shell_points(points, bot_points,d):
  """ Extrae los puntos del shell que están más cercanos a los puntos de la capa
  """
  #Cambiar 1.48 a d(r)
  shell = points[np.linalg.norm(points[:,:2], axis=1) > 1.48]
  z = shell[abs(shell[:,2] - np.mean(bot_points,axis=0)[-1]).argmin()]
  return shell[abs(shell[:,2] - z[-1]) < 0.45*d]

def join_paths(list_of_tuples):
    value_group = {}
    groups = []

    for tuple_ in list_of_tuples:
        values = set(tuple_)
        current_groups = [value_group.get(value) for value in values]
        current_groups = [group for group in current_groups if group is not None]

        if not current_groups:
            new_group = set(values)
            groups.append(new_group)
            for value in new_group:
                value_group[value] = new_group
        else:
            union_group = set().union(*current_groups)
            for group in current_groups:
                if group in groups:
                    groups.remove(group)
            union_group.update(values)
            groups.append(union_group)
            for value in union_group:
                value_group[value] = union_group

    grouped_list = [tuple(group) for group in groups]
    return grouped_list

def print_dict(tetra_dict):

  fig = plt.figure(figsize=(15,15))
  ax = fig.add_subplot(111, projection="3d")
  for elem in tetra_dict.values():
    ax.scatter(elem["base_points"][:, 0], elem["base_points"][:, 1], elem["base_points"][:,2], facecolors='none', edgecolors='black')
    ax.scatter(elem["apex"][0], elem["apex"][1], elem["apex"][2], facecolors='none', edgecolors='green')
    for i in range(len(elem["base_points"])):
        plt.plot([elem["base_points"][i,0],elem["apex"][0]],[elem["base_points"][i,1],elem["apex"][1]],[elem["base_points"][i,2],elem["apex"][2]], "blue")

  plt.show()

def update_tetrahedrons_dict(tetra_dict, old_points, new_point):
  """
  Updates the tetra_dict positions where the apex value matches old_points with the value of new_point
  """

  if old_points.ndim > 1:
    return {k:{"base_points": v["base_points"], "apex": new_point  if (v['apex'][:2] == old_points).all(1).any() else v["apex"]} for k,v in tetra_dict.items()}
  return {k:{"base_points": v["base_points"], "apex": new_point  if (v['apex'][:2] == old_points).all().any() else v["apex"]} for k,v in tetra_dict.items()}

def merge_sorted_simplices(s1, s2):
    comm_val = np.intersect1d(s1, s2)
    nocomm_val = s2[np.setdiff1d(np.arange(len(s2)), np.where(np.isin(s2, s1)))]
    positions = np.where((comm_val[:,None] == s1).any(0))[0]
    rp =np.where((comm_val[:,None] == s2).any(0))[0]
    
    if len(rp) == len(s1):
      return s2
    elif len(positions) == len(s2):
      return s1

    if len(rp) == 2:
      if abs(np.subtract(*rp)) != 1:
        r = np.roll(s2, -max(rp))[2:]
      else:
        r = np.roll(s2, -min(rp))[2:]
      if np.subtract(*positions) != -1:
        resultado = np.insert(s1,positions[-1]+1,r)
      else:
        resultado = np.insert(s1,positions[0]+1,r)

      return resultado
    else:
      return np.append(s1,s2)
    
def sort_simplices(simplices, idx_simplices, points):
  areas = list(map(lambda x: area_polygon(x), simplices))
  sorted_simplices = np.array(list(map(lambda s: sorted(s, key=lambda x : polar_angle_sort(points[x],np.mean(points[s], axis=0))), idx_simplices)))
  return areas, sorted_simplices

def tessellate_points(inital_len, points):
  indices = Delaunay(points)
  dea = indices.simplices
  simplices = points[dea]
  areas, sorted_idx_dea = sort_simplices(simplices, dea, points)
  simplices = points[sorted_idx_dea]

  sorted_areas_idx = np.argsort(areas)
  sorted_areas = list(np.array(areas)[sorted_areas_idx])
  sorted_simplices = list(simplices[sorted_areas_idx])
  sorted_dea = list(dea[sorted_areas_idx])
  initial_len = len(sorted_simplices)
  print(initial_len)
  # print(sorted_dea)

  while len(sorted_simplices) > inital_len:
    # print("=====================================")
    simplex = sorted_simplices[0]
    area_simplex = sorted_areas[0]
    # print("simplex",simplex, sorted_dea[0])
    # print("area simplex",sorted_areas[0])
    idx,n = neighbours(simplex, sorted_simplices)
    # print(idx, n)
    # print(np.array(sorted_dea)[idx])
    # print(list((j, n[j], area_polygon(n[j])) for j, x in sorted(enumerate(range(len(n))), key=lambda k: area_polygon(n[k[1]]))))
    # a = [(j, n[j]) for j, x in sorted(enumerate(range(len(n))), key=lambda k: area_polygon(n[k[1]]))]
    idx_smaller_neighbor, smaller_neighbor, smaller_area = [(idx[x], n[x], sorted_areas[idx[x]]) for x in sorted(range(len(n)), key=lambda k: sorted_areas[idx[k]])][0]
    merged_dea = merge_sorted_simplices(sorted_dea[0], sorted_dea[idx_smaller_neighbor])
    merged_simplex = points[merged_dea]
    merged_area = area_simplex + smaller_area
    # smaller_neighbor = sorted(n, key=lambda x: area_polygon(x))[0]
    # print("merged_area", merged_area)
    # print(merged_dea)
    for id in [0,idx_smaller_neighbor-1]: #restamos uno porque cuando quitamos el indice 0 y el otro se adelanta una posición
      del sorted_areas[id]
      del sorted_simplices[id]
      del sorted_dea[id]
    pos = np.argsort([abs(sa - merged_area) for sa in sorted_areas])[0]
    sorted_areas.insert(pos, merged_area)
    sorted_simplices.insert(pos, merged_simplex)
    sorted_dea.insert(pos, merged_dea)

  print(len(sorted_dea))
  return sorted_dea


def min_dist(points,point):
  return points[np.argmin(np.linalg.norm(points-point, axis=1))]


def join_hull_and_shell(tetra_dict, points, shell):
  points = np.array(points)
  inner_points = points[:,:2]
  dea = Delaunay(inner_points)
  indices = dea.convex_hull
  hull = inner_points[np.unique(indices)]
  shell_pr = shell[:,:2]
  closer_points = list(map(lambda x: min_dist(shell_pr,x), hull))

  for i,v in enumerate(hull):
    closer_point = shell[np.where(np.all(shell_pr == closer_points[i], axis =1))[0]][0]
    # print(v)
    points[np.where(np.all(inner_points == v, axis =1))[0]] = closer_point
    # print(v, closer_points)
    tetra_dict = update_tetrahedrons_dict(tetra_dict, v, closer_point)

  return points, tetra_dict

def abc(base_points, apex_pos):
  angles = []
  for i in range(len(base_points)):
    f = (np.degrees(np.arcsin(-(base_points[i,-1] - apex_pos[-1])/np.linalg.norm([base_points[i,0] - apex_pos[0], base_points[i,1] - apex_pos[1], base_points[i,2] - apex_pos[2]]))))
    angles.append(f>45)

  return all(angles)

def dict_to_graph(lateral, dict):
  G = nx.Graph()

  kd_tree = cKDTree(lateral)
  for point in lateral:
      a = kd_tree.query(point, k=10)[1][1:]
      points_above =  lateral[a[np.where(lateral[a][:,-1] > point[-1])]]
      joined = 0
      for i in points_above:
          if angle(i, point, np.array([0,0,1])) > 44 and joined < 2:
              joined +=1
              G.add_edge(tuple(point), tuple(i))
  
  for v in dict.values():
    for i in v["base_points"]:
      G.add_edge(tuple(i), tuple(v["apex"]))

  return G

points = extract_points_from_STL(config.STLFILE)
bot_points = points[np.where(points[:,-1] < np.min(points[:,-1]) + 0.1)]
top_points = points[np.where(points[:,-1] > np.max(points[:,-1]) - 0.1)]
free_points = exclude_points(points, bot_points)
lateral = exclude_points(free_points, top_points)
kd_tree = cKDTree(points)
d = caracteristic_distsance(points)
tetrahedrons = {}
aux = {}
reached_top = False
iteration = 0

while not reached_top:
# for _ in range(4):
  aux = {}

  optimal_points = []
  if iteration != 0: 
    # TODO: Mejorar esta función
    shell_points = z_shell_points(points, bot_points, d)
    tetrahedrons, bot_points = remove_closer_points(tetrahedrons, bot_points, shell_points)
    bot_points_pr = bot_points[:,:2]
    simplices = tessellate_points(initial_len, bot_points_pr)
    plot_tessellation(bot_points_pr,simplices)

  else:
    bot_points_pr = bot_points[:,:2]
    simplices = Delaunay(bot_points_pr).simplices
    initial_len = len(simplices)
    plt.triplot(bot_points_pr[:,0], bot_points_pr[:,1], simplices)
    plt.plot(bot_points_pr[:,0], bot_points_pr[:,1], 'o')
    plt.show()

  print(len(simplices))
  for i,indice in enumerate(simplices):
      # Obtain the base points from triangulation
      base_points = bot_points[indice]
      found = False
      optimal_point = np.mean(base_points,axis=0)
      while not found:
        optimal_point[2] += 0.05
        if abc(base_points, optimal_point):
          found = True

      if optimal_point[-1] >= np.max(points[:,-1]):
          # TODO: implementar función que busque puntos del top a los que anclarse
          reached_top = True
      else:
        if not in_volume(optimal_point, points):
          optimal_point = points[kd_tree.query(optimal_point, 2)[1][1]]
          # Add the optimal point to the list of optimal points if it is inside the volume
        optimal_points.append(optimal_point)
        tetrahedrons[str(iteration) + str(i)] = {"base_points": base_points, "apex": optimal_point}
        aux[str(iteration) + str(i)] = {"base_points": base_points, "apex": optimal_point}
        # if iteration != 0:
        #   print(base_points)
        #   print(optimal_point)

        #   fig = plt.figure(figsize = (10,10))
        #   ax = fig.add_subplot(projection="3d")
        #   ax.set_aspect("equal")
        #   ax.scatter(base_points[:,0], base_points[:,1], base_points[:,2], facecolors='none', edgecolors='black')
        #   ax.scatter(optimal_point[0], optimal_point[1], optimal_point[2], facecolors='none', edgecolors='green')
        #   plt.show()
# print(punto_optimo)
      # check_point(punto_optimo, base_points)
  shell = z_shell_points(points, optimal_points, d)
  # free_points = exclude_points(free_points, shell)

  # new_points, new_dict = remove_short_edges(optimal_points, tetrahedrons, d/2)
  joined_points, new_dict = join_hull_and_shell(tetrahedrons, optimal_points, shell)
  # joined_points, new_dict = join_hull_and_shell(aux, optimal_points, shell)
  joined_points = np.append(joined_points, shell, axis=0)

  bot_points = np.array(joined_points)
  tetrahedrons = new_dict
  # aux = new_dict
  iteration += 1

  print_dict(tetrahedrons)
  bot_points_pr = bot_points[:,:2]
  indices = Delaunay(bot_points_pr).simplices
  plt.triplot(bot_points_pr[:,0], bot_points_pr[:,1], indices)
  plt.plot(bot_points_pr[:,0], bot_points_pr[:,1], 'o')
  plt.show()




G = dict_to_graph(lateral,tetrahedrons)
pickle.dump(G, open(os.path.join(parsed_path(config.TMPPATH), "G.pickle"),"wb"))