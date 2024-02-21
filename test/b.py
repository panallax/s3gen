import numpy as np
np.seterr(all="ignore")
import matplotlib.pyplot as plt
from scipy.spatial import Delaunay, KDTree
from scipy.spatial.distance import pdist, squareform, cdist
import config
from utils import extract_points_from_STL, parsed_path, angle, isin, calculate_segments_dist, plot_graph, \
                  calculate_neighbors_in_node
import networkx as nx
import pickle
import os
from shapely.geometry import Polygon
from shapely.ops import polylabel
from shapely.geometry import LineString
from triangle import triangulate, convex_hull
from itertools import chain


def inner_colisions(G, D, node, point):
    C = nx.compose(G,D)
    
    if tuple(node) not in C:
        return False
    
    norm = np.linalg.norm(node - point)
    s1 = np.linspace(node, point, 20)
    for nbr in C.neighbors(tuple(node)):
        s2 = np.linspace(node, np.array(nbr),20)

        if norm >= np.linalg.norm(node - np.array(nbr)):
          colision = (np.min(cdist(s1,s2), axis=0) < 0.1).all()
          if colision:
            return True 
        else: 
          colision = (np.min(cdist(s2,s1), axis=0) < 0.1).all()
          if colision:
            return True 
        
    return False


def get_observable_segments(G, origin, point,d, D= None):
    if D:
      C = nx.compose(G,D)
    else:
      C = G

    nodes = np.array(C.nodes())
    tree_points = KDTree(nodes)
    p1,p2 =  origin, point
    mid_point = (p1+p2)/2
    observable_points = np.unique(np.concatenate([x[1:] for x in tree_points.query_ball_point([p1,p2,mid_point], 2*d, workers= -1)], dtype= int, casting= "unsafe"))            

    valid_points = exclude_points(nodes[observable_points], np.array([p1,p2, mid_point]))
    observable_segments = []
    for valid_point in valid_points:
        point_nodes = C.neighbors(tuple(valid_point))
        for n in point_nodes:
            if not isin(np.array([p1,p2]), np.array(n)).any() and isin(nodes[observable_points], np.array(n)).any():
                observable_segments.append(np.array([valid_point,n]))

    observable_segments = np.unique(np.array(list(map(lambda x: x[np.argsort(x[:,0])], observable_segments))), axis=0)

    return observable_segments

def check_connection(G, D, origin, point, d):
    # print(angle(origin, point, np.array([0,0,-1])))
    if angle(origin, point, np.array([0,0,-1])) < 44:
        # print("angle")
        return False
    
    if len(G.nodes()) < 3:
        return True
    
    colisions = inner_colisions(G, D, origin, point)
    if colisions:
        # print("colision")
        return False
    
    observable_segments = get_observable_segments(G, origin, point,d , D)
    # fig = plt.figure()
    # ax = fig.add_subplot(projection = "3d")
    # plt.plot([origin[0], point[0]],[origin[1], point[1]], [origin[2], point[2]], color= "black")
    # print(origin, point, observable_segments)
    for s in observable_segments:
        # plt.plot([s[0][0], s[1][0]],[s[0][1], s[1][1]], [s[0][2], s[1][2]])
        d = calculate_segments_dist(s, (origin, point))
        # print(origin, point, d, s)
        if d < 0.45:            
            # print("dist")
            return False
    # plt.show()  
    return True


def shell_graph(D, lateral, d): 

  nodes = np.array(D.nodes())
  base_points = nodes[nodes[:,2] == np.min(nodes[:,2])]
  lateral_base_points = base_points[np.unique(Delaunay(base_points[:,:2]).convex_hull)]

  lateral = exclude_points(lateral, exclude_points(lateral, nodes))
  lateral = np.vstack((lateral, lateral_base_points))
  lateral = lateral[np.argsort(lateral[:, 2])[::1]]
  kd_tree = KDTree(lateral)

  g = nx.Graph()
  g.add_nodes_from(list(map(tuple, lateral)))
  for point in lateral:
      a = np.array(kd_tree.query_ball_point(point, 2*d))
      # points_above =  lateral[a]
      points_above =  lateral[a[np.where(lateral[a][:,-1] > point[-1])]]
      # print(point, points_above)
      for i in points_above:
          if check_connection(g, D, point, i, d):
            g.add_edge(tuple(point), tuple(i))

  # nodes =  list(g.nodes())
  # for node in nodes:
  #     if len(list(g.neighbors(node))) <= 1:
  #         g.remove_node(node)

  return g


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

def plot_tessellation(aux, points, dea):
  indices = Delaunay(points)
  dea_ = indices.simplices
  # fig, ax = plt.subplots(figsize=(10,10))
  # ax.triplot(points[:,0], points[:,1], dea_)
  # ax.plot(points[:,0], points[:,1], 'o')
  # ax.set_aspect('equal', adjustable='datalim')
  # plt.show()
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
    # plt.show()
  ax.set_aspect('equal', adjustable='datalim')
  # print_dict(aux)
  # plt.scatter(*np.array(out)[:,:2].T, color="black")
  # Mostrar el gráfico
  plt.show()

def remove_closer_points(tetra_dict, points, shell_points):
  points = np.unique(points, axis=0)
  shell_points = np.array(shell_points)
  points_pr = points[:,:2]

  dists = squareform(pdist(points_pr))
  closer = np.where((dists <= 1) & (dists>0))
  groups = join_paths(list(zip(*closer)))

  if len(groups) != 0:
    indx_to_delete = []
    for g in groups:
      g = np.array(g)
      check_shell = (points_pr[g][:,None] == shell_points[:,:2]).all(-1).any(-1)
      if check_shell.any():
        shell_point = points[g][np.nonzero(check_shell)][0]
        indx_to_delete.extend(np.delete(g, np.nonzero(check_shell), axis=0).tolist())
        # bot_points_pr = np.delete(points[g],np.nonzero(check_shell), axis=0)
        for p in np.delete(points[g],np.nonzero(check_shell), axis=0):
          tetra_dict = update_tetrahedrons_dict(tetra_dict, p, shell_point)
      # else:
      #   new_point = points[g[np.argmax(points[g][:,2])]]
      #   indx_to_delete.extend(g.tolist())
      #   # bot_points_pr = np.delete(bot_points_pr,bot_points_pr[g] , axis=0)
      #   points = np.vstack((points, new_point))
      #   for pt in points[np.array(g)]:
      #     tetra_dict = update_tetrahedrons_dict(tetra_dict, pt, new_point)

    spaced_points = np.delete(points, indx_to_delete, axis=0)

    return tetra_dict, spaced_points
  else:
    return tetra_dict, points
  
def exclude_points(arr, values_to_remove):

  new_arr = arr[~(arr==values_to_remove[:,None]).all(-1).any(0)]

  return new_arr

def in_volume(p, hull):
    if not isinstance(hull,Delaunay):
        hull = Delaunay(hull)

    return hull.find_simplex(p) >= 0

def caracteristic_distsance(points):
    kd_tree = KDTree(points)
    total_dist = 0.0
    for point in points:
        dist,_ = kd_tree.query(point, k=2)
        total_dist += dist[1]  # Ignorar la distancia a sí mismo

    return total_dist / len(points)

def z_shell_points(points, outter_points, lateral_points, d, L = 5):
  """ Extrae los puntos del shell que están más cercanos a los puntos de la capa
  """
  # print(len(outter_points))
  # if outter_points:
  #   s = []
  #   for p,n  in outter_points:
  #     if not isin(lateral_points, p):
  #       section_points = lateral_points[(lateral_points[:,2] >= p[2] - d) & (lateral_points[:,2] <= p[2] + d)]
  #       s.extend(np.array(sorted(section_points, key= lambda x: np.abs(np.linalg.norm(x - p) - L/2 + abs(x[2]-p[2]))))[:n])
  #     else:
  #       s.append(p)
  # else:
  #   points = np.array(points)
  #   inner_points = points[:,:2]
  #   dea = Delaunay(inner_points)
  #   indices = dea.convex_hull
  #   hull = points[np.unique(indices)]
  #   s = []
  #   for p in hull:
  #     if not isin(lateral_points, p):
  #       section_points = lateral_points[(lateral_points[:,2] >= p[2] - d) & (lateral_points[:,2] <= p[2] + d)]
  #       s.extend(np.array(sorted(section_points, key= lambda x: np.abs(np.linalg.norm(x - p) - L/2 + abs(x[2]-p[2]))))[:2])
  #     else:
  #       s.append(p)
  if outter_points:
    z = np.mean(np.array(outter_points)[:,2])
  else:
    z = np.mean(np.array(points)[:,2])
     
  section_points = lateral_points[(lateral_points[:,2] >= z - d) & (lateral_points[:,2] <= z + d)]
  s = np.array(list(sorted(section_points, key=lambda p: polar_angle_sort(p, np.array([0,0,0])))))
  s = np.append(s, [s[0]], axis=0)
  section_line = LineString(s).simplify(L/10).coords


  # rm = []
  # s_aux = s
  # for i in range(len(s_aux)-1):
  #   if np.linalg.norm(s_aux[i][:2] - s_aux[i+1][:2]) < 1:
  #     print(s_aux[i], s_aux[i+1])
  #     # mid_point = np.mean([s_aux[i], s_aux[i+1]], axis=0)
  #     # closer_hull_point = lateral_points[np.argmin(np.linalg.norm(lateral_points - mid_point, axis=1))]
  #     # s = np.append(s, [closer_hull_point], axis=0)

  #     # if np.linalg.norm(s[i] - closer_hull_point) > np.linalg.norm(s[i+1] - closer_hull_point):
  #     if np.min(np.linalg.norm(hull - s[i], axis=1)) > np.argmin(np.linalg.norm(hull - s[i+1], axis=1)):
  #       rm.append(i)
  #     else:
  #       rm.append(i+1)

  # s = np.delete(s, rm, axis =0)

  # fig = plt.figure(figsize=(15,15))
  # ax = fig.add_subplot(111, projection="3d")
  # # ax.scatter(*points.T, color="blue")
  # ax.scatter(*hull.T, color="red")
  # ax.scatter(*np.array(section_line).T, color="black")
  # plt.show()

  # fig = plt.figure(figsize=(15,15))
  # ax = fig.add_subplot(111, projection="3d")
  # ax.scatter(*hull.T, color="blue")
  # ax.scatter(*s.T, color="black")
  return np.array(section_line)

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

  # for k,v in tetra_dict.items():
  #   print(k,v)

  fig = plt.figure(figsize=(15,15))
  ax = fig.add_subplot(111, projection="3d")
  for k,elem in tetra_dict.items():
    ax.scatter(elem["base_points"][:, 0], elem["base_points"][:, 1], elem["base_points"][:,2], facecolors='none', edgecolors='black')
    ax.scatter(elem["apex"][0], elem["apex"][1], elem["apex"][2], facecolors='none', edgecolors='green')
    for i,p in enumerate(elem["base_points"]):

      if len(elem["base_points"]) == 3:
        plt.plot([elem["base_points"][i,0],elem["apex"][0]],[elem["base_points"][i,1],elem["apex"][1]],[elem["base_points"][i,2],elem["apex"][2]], "blue")
      else:  
        previous = elem["base_points"][i-1] if i > 0 else elem["base_points"][-1]
        following = elem["base_points"][(i+1)] if i < len(elem["base_points"])-1 else elem["base_points"][0]
        if between_points(np.array([previous, p, following]), elem["apex"]):
          plt.plot([elem["base_points"][i,0],elem["apex"][0]],[elem["base_points"][i,1],elem["apex"][1]],[elem["base_points"][i,2],elem["apex"][2]], "blue")
        # else:
        #    print(previous, p, following, elem["apex"])
        # plt.plot([elem["base_points"][i,0],elem["apex"][0]],[elem["base_points"][i,1],elem["apex"][1]],[elem["base_points"][i,2],elem["apex"][2]], "blue")
  ax.set_xlabel('X')
  ax.set_ylabel('Y')
  ax.set_zlabel('Z')
  plt.show()

def update_tetrahedrons_dict(tetra_dict, old_point, new_point):
  """
  Updates the tetra_dict positions where the apex value matches old_points with the value of new_point
  """

  # if old_points.ndim > 1:
  #   return {k:{"base_points": v["base_points"], "apex": new_point  if (v['apex'][:2] == old_points).all(1).any() else v["apex"]} for k,v in tetra_dict.items()}
  return {k:{"base_points": v["base_points"], "apex": new_point  if (v['apex'] == old_point).all() else v["apex"]} for k,v in tetra_dict.items()}

def merge_sorted_simplices(s1, s2):
    comm_val = np.intersect1d(s1, s2)
    nocomm_val = s2[np.setdiff1d(np.arange(len(s2)), np.where(np.isin(s2, s1)))]
    positions = np.where((comm_val[:,None] == s1).any(0))[0]
    rp =np.where((comm_val[:,None] == s2).any(0))[0]
    # print(s1,s2,comm_val, positions, rp)
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
      if not all([(positions[i] - positions[i+1]) == -1 for i in range(len(positions)-1)]):
        s1 = np.roll(s1, -max(positions))
        positions = [0,1,2]
      a = s1[:positions[0]] if positions[0] != 0 else s1[0]
      a = np.append(a,nocomm_val)
      a = np.append(a, s1[positions[-1]:])
      a = np.append(a, s1[positions[0]+1:positions[-1]])

      return a
    
def sort_simplices(simplices, idx_simplices, points):
  areas = list(map(lambda x: area_polygon(x), simplices))
  sorted_simplices = np.array(list(map(lambda s: sorted(s, key=lambda x : polar_angle_sort(points[x],np.mean(points[s], axis=0))), idx_simplices)))
  return areas, sorted_simplices

def tessellate_points(initial_len, points):
  indices = Delaunay(points)
  dea = indices.simplices
  simplices = points[dea]
  areas, sorted_idx_dea = sort_simplices(simplices, dea, points)
  simplices = points[sorted_idx_dea]

  sorted_areas_idx = np.argsort(areas)
  sorted_areas = list(np.array(areas)[sorted_areas_idx])
  sorted_simplices = list(simplices[sorted_areas_idx])
  sorted_dea = list(dea[sorted_areas_idx])
 

  while len(sorted_simplices) > initial_len:
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
    idx_smaller_neighbor, smaller_area = [(idx[x], sorted_areas[idx[x]]) for x in sorted(range(len(n)), key=lambda k: sorted_areas[idx[k]])][0]
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
    # if it == 7:
    #   fig, ax = plt.subplots(figsize=(10,10))
      
    #   pares_consecutivos = [(simplex[i], simplex[(i + 1) % len(simplex)]) for i in range(len(simplex))]
    #   for par in pares_consecutivos:
    #       x_values = [par[0][0], par[1][0]]
    #       y_values = [par[0][1], par[1][1]]
    #       ax.plot(x_values, y_values, marker='o', color="green")
    #   ax.set_aspect('equal', adjustable='datalim')
    
    #   fig, ax = plt.subplots(figsize=(10,10))

    #   pares_consecutivos = [(merged_simplex[i], merged_simplex[(i + 1) % len(merged_simplex)]) for i in range(len(merged_simplex))]
    #   for par in pares_consecutivos:
    #       x_values = [par[0][0], par[1][0]]
    #       y_values = [par[0][1], par[1][1]]
    #       ax.plot(x_values, y_values, marker='o', color="green")
    #   ax.set_aspect('equal', adjustable='datalim')
    #   plt.show()

    # plot_tessellation({}, points, sorted_dea)
  # print(len(sorted_dea))
  return sorted_dea


def min_dist(points,point):
  return (point, points[np.argmin(np.linalg.norm(points-point, axis=1))])


def join_hull_and_shell(tetra_dict, points, shell):
  points = np.array(points)
  inner_points = points[:,:2]
  dea = Delaunay(inner_points)
  indices = dea.convex_hull

  hull = points[np.unique(indices)]
  closer_points = list(map(lambda x: min_dist(shell,x), hull))

  for old,new in closer_points:
    tetra_dict = update_tetrahedrons_dict(tetra_dict, old, new)
    points[(points == old).all(-1)] = new
  # l = []

  # for h,s in closer_points:
  #   # s.extend(np.array(sorted(lateral_points, key= lambda x: np.linalg.norm(x - p)+ 3*np.abs(x[2]- p[2])))[:2])
  #   dist = np.linalg.norm(h[:2] - s[:2])
  #   if dist < 0.15:
  #     points[(points == h).all(-1)] = s 
  #     tetra_dict = update_tetrahedrons_dict(tetra_dict, h, s)
  #   else:
  #     # horizontal_points = np.array(sorted(shell, key= lambda x: np.linalg.norm(x - h)+ 3*np.abs(x[2]- h[2])))[:2]
  #     l.extend(np.array(sorted(shell, key= lambda x: np.linalg.norm(x - h)+ 3*np.abs(x[2]- h[2])))[:2])
  #     # points = np.append(points, horizontal_points, axis=0)
      
  # if l:
  #   l = np.array(list(sorted(l, key=lambda p: polar_angle_sort(p, np.array([0,0,0])))))
  #   l = np.vstack((l,l[0]))

  #   rm = []
  #   for i in range(len(l)-1):
  #     if np.linalg.norm(l[i][:2] - l[i+1][:2]) < 0.15:
  #       # closer_hull_point = hull[np.argmin(np.linalg.norm(hull - s[i], axis=1))]
  #       # if np.linalg.norm(s[i] - closer_hull_point) > np.linalg.norm(s[i+1] - closer_hull_point):
  #       if np.min(np.linalg.norm(hull - l[i], axis=1)) > np.argmin(np.linalg.norm(hull - l[i+1], axis=1)):
  #         rm.append(i)
  #       else:
  #         rm.append(i+1)

  #   points = np.append(points, np.delete(l, rm, axis=0), axis=0)
  
  return points, tetra_dict

def abc(base_points, apex_pos):
  angles = []
  for i in range(len(base_points)):
    f = (np.degrees(np.arcsin(-(base_points[i,-1] - apex_pos[-1])/np.linalg.norm([base_points[i,0] - apex_pos[0], base_points[i,1] - apex_pos[1], base_points[i,2] - apex_pos[2]]))))
    angles.append(f>50)

  return all(angles)

def between_points(puntos, p):
    b,a,c = puntos[:,:2]
    ab = b - a
    ac = c - a
    ap = p[:2] - a
    cross_abp = np.cross(ab, ap)
    cross_acp = np.cross(ac, ap)

    return (cross_abp >= 0 and cross_acp <= 0) or (cross_abp <= 0 and cross_acp >= 0)

def remove_close_edges(G, max_global_dist):
        init_edges = len(G.edges())
        nodes = np.array(G.nodes())
        edges = np.array(G.edges()) 
        tree_points = KDTree(nodes)
        for segment in edges:
            p1,p2 = np.array(segment)
            observable_points = np.unique(np.concatenate([x[1:] for x in tree_points.query_ball_point([p1,p2], max_global_dist)], dtype= int, casting= "unsafe"))
            valid_points = exclude_points(nodes[observable_points],np.array([p1,p2]))

            observable_segments = []
            for valid_point in valid_points:  
                point_nodes = G.neighbors(tuple(valid_point))
                for n in point_nodes:
                    if not isin(np.array(segment), np.array(n)).any() and isin(nodes[observable_points], np.array(n)).any():
                        observable_segments.append(np.array([valid_point,n]))

            observable_segments = np.unique(np.array(list(map(lambda x: x[np.argsort(x[:,0])], observable_segments))), axis=0)
            min_nbr_current_segment = min(list(map(lambda x: calculate_neighbors_in_node(G,x), [p1,p2])))
            local_segments_to_remove = []
            for s in observable_segments:
                if calculate_segments_dist(s, (p1,p2)) < 0.4:
                    print(calculate_segments_dist(s, (p1,p2)))
                    nbr_node = list(map(lambda x: calculate_neighbors_in_node(G,x), s))
                    if min(nbr_node) > min_nbr_current_segment:
                        local_segments_to_remove.append(tuple(map(tuple,s)))

                    else:
                        try:
                          G.remove_edge(tuple(p1), tuple(p2))
                        except:
                          pass
                        local_segments_to_remove.clear()
                        break

            if len(local_segments_to_remove) >= 1:
                if  len(set(chain(*local_segments_to_remove))) % 2 != 0:
                    G.remove_edge(tuple(p1), tuple(p2))
                else:
                    G.remove_edges_from(local_segments_to_remove) 
        return G

def dict_to_graph(G, dict, lateral_points, max_value):
  max_global_dist = 0
  for v in dict.values():
    for i, p in enumerate(v["base_points"]):
      local_dist = np.linalg.norm(v["apex"] - p)
      max_global_dist = local_dist if local_dist > max_global_dist else max_global_dist
      # G.add_edge(tuple(p), tuple(v["apex"]))
      if len(v["base_points"]) == 3:
         G.add_edge(tuple(p), tuple(v["apex"]))
      else:  
        previous = v["base_points"][i-1] if i > 0 else v["base_points"][-1]
        following = v["base_points"][(i+1)] if i < len(v["base_points"])-1 else v["base_points"][0]
        if between_points(np.array([previous, p, following]), v["apex"]) or isin(lateral_points, v["apex"]):
          G.add_edge(tuple(p), tuple(v["apex"]))
  
  nodes = list(G.nodes())
  to_remove = []
  for node in nodes:
    neighb = list(G.neighbors(node))
    for n in neighb:
      if n[2] > node[2]:
        break
    else:
      to_remove.append([node, neighb])

  for node, neighb in to_remove:
    G.remove_node(node)
    new_node = tuple(np.array([node[0], node[1], max_value]))
    G.add_node(new_node)
    for n in neighb:
      G.add_edge(new_node, n)

  G = remove_close_edges(G, max_global_dist)

  return G

def find_poi(points):

  points_pr = points[:,:2]
  z_coord = np.mean(points[:,-1])
  pares= tuple([tuple(x) for x in points_pr])
  try:
    polygon = Polygon(pares)
  except:
    aux = np.array([points[0]])
    for p in aux:
      if not ((aux[:,None] == p).all(-1).any()):
        aux = np.vstack((aux,p))
    pares = tuple([tuple(x) for x in aux[:,:2]])
    polygon = Polygon(pares)
  
  point = polylabel(polygon, tolerance= 0.05)
  x = np.reshape(point.xy, (2,))
  return np.hstack((x,z_coord))

def aaaa(points, dea, opt, ss):
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
  plt.scatter(*points.T, color = "blue")
  plt.scatter(*np.array(opt)[:,:2].T, color="black")
  plt.scatter(*np.array(ss)[:,:2].T, color="red")
  ax.set_aspect('equal', adjustable='datalim')

  # Mostrar el gráfico
  plt.show()

def add_base(G, simplex, points):
  _, simplex = sort_simplices(points[:,:2][simplex], simplex, points[:,:2])
  for s in simplex:
    simplex_points = points[s]
    for point in [(simplex_points[i], simplex_points[(i + 1) % len(simplex_points)]) for i in range(len(simplex_points))]:
      G.add_edge(tuple(point[0]), tuple(point[1]))
  
  return G

def initial_points(l, pore_area, points):
  dea = Delaunay(points[:,:2])
  indices = dea.convex_hull
  hull = points[np.unique(indices)]

  section_points = np.array(list(sorted(hull, key=lambda x : polar_angle_sort(x,np.mean(hull, axis=0)))))
  section_points = np.append(section_points, [section_points[0]], axis=0)
  section_line = LineString(section_points)
  # Aplicar el algoritmo de Douglas-Peucker para reducir la densidad de puntos
  simplified_line = section_line.simplify(l/10)
  simplified_hull = np.array(simplified_line.coords)

  current_area = 0
  min_val = 0.1
  max_val = 20

  while not np.isclose(current_area, pore_area, atol= 0.2):
    current_val = (min_val + max_val)/2
    opt = f"qa{current_val}"
    t = triangulate({"vertices": simplified_hull[:,:2]}, opt)
    triang_points = np.array(t["vertices"].tolist())
    simplices = np.array(t["triangles"].tolist())
    current_area =  np.mean([area_polygon(triang_points[x]) for x in sort_simplices(triang_points[simplices], simplices, triang_points)[1]])

    if current_area < pore_area:
      min_val = current_val
    else:
      max_val = current_val

  triang_points_3d = np.c_[triang_points, np.zeros(triang_points.shape[0])]
  return triang_points_3d, simplices


points, base_points, top_points, lateral_points = extract_points_from_STL(config.STLFILE)
max_value = np.max(top_points[:,-1])
d = caracteristic_distsance(lateral_points)
L = 5 #mm
pore_area = L**2*np.sqrt(3)/4 #mm^2

tetrahedrons = {}
aux = {}
reached_top = False
iteration = 0

G = nx.Graph()

while True:
# for _ in range(2):  
  aux = {}
  ss = []
  optimal_points = []
  outter_points = []

  if iteration == 0: 
    bot_points, simplices = initial_points(L, pore_area, base_points)
    bot_points_pr = bot_points[:,:2]
    initial_len = len(simplices)
    G = add_base(G, simplices, bot_points)

  else:
    print(f"iteration {iteration}")
    tetrahedrons, bot_points = remove_closer_points(tetrahedrons, bot_points, shell_points)
    bot_points_pr = bot_points[:,:2]
    simplices = tessellate_points(initial_len, bot_points_pr)
    plot_tessellation(aux, bot_points_pr,simplices)

  for i,indice in enumerate(simplices):
      # Obtain the base points from tessellation
      base_points = bot_points[indice]
      found = False
      ss.append(np.mean(base_points,axis=0))
      try:
        optimal_point = find_poi(base_points)
      except:
        optimal_point = np.mean(base_points,axis=0)

      while not found:
        optimal_point[2] += 0.05
        if abc(base_points, optimal_point):
          found = True


      if optimal_point[-1] >= max_value:
          optimal_points.extend(base_points)
      else:
        outter_gons = np.count_nonzero((base_points[:,None] == lateral_points).all(-1).any(-1))
        if outter_gons > 1:
          outter_points.append(optimal_point)

        optimal_points.append(optimal_point)
        tetrahedrons[f"{iteration}_{i}"] = {"base_points": base_points, "apex": optimal_point}
        aux[f"{iteration}_{i}"] = {"base_points": base_points, "apex": optimal_point}

  if len([x for x in tetrahedrons.keys() if x.startswith(f"{iteration}_")]) == 0:
    break
  

  shell_points = z_shell_points(optimal_points, outter_points, lateral_points, d)
  # if outter_points:

  #   plt.scatter(*np.array(optimal_points)[:,:2].T, color="black")
  #   plt.scatter(*np.array(outter_points)[:,:2].T, color="red")


  #   plot_tessellation(aux, bot_points_pr,simplices, outter_points)
  # plt.scatter(*np.array(optimal_points)[:,:2].T, color="black")
  # plot_tessellation(aux, bot_points_pr,simplices)
  joined_points, new_dict = join_hull_and_shell(tetrahedrons, optimal_points, lateral_points)
  plt.scatter(*np.array(joined_points)[:,:2].T, color="blue")
  plt.show()
  # bb, aa = join_hull_and_shell(aux, optimal_points, shell_points)
  # joined_points = np.append(optimal_points, shell_points, axis=0)
  # joined_points = np.append(joined_points, shell_points, axis=0)
  # bb = np.append(bb, shell_points, axis=0)

  bot_points = np.array(joined_points)
  bot_points = np.unique(bot_points, axis=0)
  tetrahedrons = new_dict

  # aux = aa
  iteration += 1
  # plot_tessellation(aux, bot_points_pr,simplices)

  # print_dict(aux)

# for point in np.unique(bot_points, axis=0):
#     old = point
#     new = old.copy()
#     new[2] = max_value
#     tetrahedrons = update_tetrahedrons_dict(tetrahedrons, old, new)

# print_dict(tetrahedrons)
D = dict_to_graph(G, tetrahedrons, lateral_points, max_value)


# S = shell_graph(D, lateral_points, L)
# plot_graph(S)
# G = nx.compose(D,S)
plot_graph(D)

# np.savez(parsed_path(config.TMPPATH) + "/tetrahedrons.npz", tetrahedrons)
pickle.dump(D, open(os.path.join(parsed_path(config.TMPPATH), "G.pickle"),"wb"))
# pickle.dump(tetrahedrons, open(os.path.join(parsed_path(config.TMPPATH), "tetra.pickle"),"wb"))