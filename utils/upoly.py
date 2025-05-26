import numpy as np
from shapely.geometry import Polygon
from shapely.ops import polylabel
from utils import polar_angle_sort, angle, generate_segments, group_segments, detect_bolts
from config import config
import triangle

def update_polyhedrons_dict(tetra_dict, old_point, new_point):
  """
  Updates the tetra_dict positions where the apex value matches old_points with the value of new_point

  Arguments:
      tetra_dict {dict} -- Dictionary of polyhedrons
      old_point {np.ndarray} -- Old point
      new_point {np.ndarray} -- New point

  Returns:
      dict -- Updated dictionary of polyhedrons
  """


  # return {k:{"base_points": v["base_points"], "apex": new_point if (v['apex'] == old_point).all() 
  #                                                               else v["apex"]} 
  #                                                               for k,v in tetra_dict.items()}
  if old_point.ndim > 1:
      return {k:{"base_points": v["base_points"], "apex": new_point  if (v['apex'][:2] == old_point).all(1).any() else v["apex"]} for k,v in tetra_dict.items()}
  if old_point.shape[0] == 2:
    return {k:{"base_points": v["base_points"], "apex": new_point  if (v['apex'][:2] == old_point).all().any() else v["apex"]} for k,v in tetra_dict.items()}
  else:
    return {k:{"base_points": v["base_points"], "apex": new_point  if (v['apex'] == old_point).all() else v["apex"]} for k,v in tetra_dict.items()}

def merge_sorted_simplices(s1, s2):
  """
  Merge two simplices by the common points and the non common indices in the right order.
  The resultat simplice will be sorted by the polar angle of the points.

  Arguments:
      s1 {np.ndarray} -- Array of indices of the first simplex
      s2 {np.ndarray} -- Array of indices of the second simplex

  Returns:
      np.ndarray -- Array of points of the merged simplex
  """

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
    if not all([(positions[i] - positions[i+1]) == -1 for i in range(len(positions)-1)]):
      s1 = np.roll(s1, -max(positions))
      positions = [0,1,2]
    a = s1[:positions[0]] if positions[0] != 0 else s1[0]
    a = np.append(a,nocomm_val)
    a = np.append(a, s1[positions[-1]:])
    a = np.append(a, s1[positions[0]+1:positions[-1]])

    return a
    
def sort_simplices(simplices, idx_simplices, points):
  """
  Sort the simplices by the polar angle of the points and calculate the area of 
  the simplices.

  Arguments:
      simplices {np.ndarray} -- Array of simplices
      idx_simplices {np.ndarray} -- Array of indices of the simplices
      points {np.ndarray} -- Array of points

  Returns:
      list -- List of areas
      list -- List of sorted simplices
  """

  areas = list(map(lambda x: area_polygon(x), simplices))
  sorted_simplices = np.array(list(map(lambda s: sorted(s, key=lambda x : polar_angle_sort(points[x],np.mean(points[s], axis=0))), idx_simplices)))
  return areas, sorted_simplices

def tessellate_points(initial_len, points, outter_points_idx, inner_points_dict, bolts):
  """
  Tessellate a set of points from a intial Delaunay triangulation until the number
  of simplices is equal to the initial one. The tessellation is done by merging 
  the each simplce with the neighbour with the smallest area, starting from the 
  smallest simplex. Once the simplex is merged, the new simplex is inserted in the
  list of simplices in the right position so each iteration takes the smallest
  simplex.

  Arguments:
      initial_len {int} -- Initial number of simplices
      points {np.ndarray} -- Array of points
  
  Returns:
      list -- Simplices list
  """

  if inner_points_dict:
    holes = [np.mean(points[x][:,:2], axis= 0) for x in inner_points_dict.values()]
  else:
    holes = None
  points_pr = points[:,:2]
  segments =  generate_segments(points_pr, outter_points_idx, inner_points_dict if inner_points_dict else None)

  t = triangle.triangulate({"vertices": points_pr, "segments": segments, **({"holes": holes} if holes else {})}, opts = "p")

  dea = t["triangles"]
  simplices = points[dea]

  # import matplotlib.pyplot as plt
  # p = np.array(t["vertices"].tolist())
  # plt.figure(figsize=(20,20))
  # plt.axes().set_aspect('equal')
  # plt.triplot(points_pr[:,0], points_pr[:,1], dea)
  # plt.plot(points_pr[:,0], points_pr[:,1], 'o')
  # plt.show()

  segments_groups = sorted(group_segments(t["segments"]), key= len, reverse= True)
  outter_points = points[segments_groups[0]]
  inner_points =  [points[idx] for idx in segments_groups[1:]]

  "---"
  surface_segments_idx = [int(item) for sublist in segments_groups for item in sublist]
  surface_dea_idx = np.flatnonzero(np.sum(np.isin(dea, surface_segments_idx), axis=1) >= 2)
  surface_dea = dea[surface_dea_idx]

  dea = np.delete(dea, surface_dea_idx, axis= 0)
  simplices = np.delete(simplices, surface_dea_idx, axis= 0)
  initial_len -= len(surface_dea)
  "---"

  areas, sorted_idx_dea = sort_simplices(simplices, dea, points)
  simplices = points[sorted_idx_dea]

  sorted_areas_idx = np.argsort(areas)
  sorted_areas = list(np.array(areas)[sorted_areas_idx])
  sorted_simplices = list(simplices[sorted_areas_idx])
  sorted_dea = list(dea[sorted_areas_idx])

  while len(sorted_simplices) >= initial_len and initial_len > 3:
    simplex = sorted_simplices[0]
    area_simplex = sorted_areas[0]

    idx,n = neighbours(simplex, sorted_simplices)
    idx_smaller_neighbor, smaller_area = [(idx[x], sorted_areas[idx[x]]) for x in sorted(range(len(n)), key=lambda k: sorted_areas[idx[k]])][0]
    merged_dea = merge_sorted_simplices(sorted_dea[0], sorted_dea[idx_smaller_neighbor])
    # merged_dea = np.unique(np.append(sorted_dea[0], sorted_dea[idx_smaller_neighbor]))
    merged_simplex = points[merged_dea]
    merged_area = area_simplex + smaller_area

    for _id in [0,idx_smaller_neighbor-1]: #restamos uno porque cuando quitamos el indice 0 y el otro se adelanta una posición
      del sorted_areas[_id]
      del sorted_simplices[_id]
      del sorted_dea[_id]
    pos = np.argsort([abs(sa - merged_area) for sa in sorted_areas])[0]
    sorted_areas.insert(pos, merged_area)
    sorted_simplices.insert(pos, merged_simplex)
    sorted_dea.insert(pos, merged_dea)

  return sorted_dea + list(surface_dea), points, outter_points, inner_points

def area_polygon(points):
  """
  Calculate the area of a polygon using the Shoelace formula.

  Arguments:
      points {np.ndarray} -- Array of points

  Returns:
      float -- Area of the polygon
  """

  center = np.mean(points, axis=0)
  sorted_points = sorted(points, key=lambda p: polar_angle_sort(p, center))
  # Aplicar la fórmula de Shoelace
  area = 0.5 * np.linalg.norm(sum(np.cross(x1,x2) for (x1,x2) in zip(sorted_points, 
                                                                     np.vstack((sorted_points[1:],[sorted_points[0]])))))
  
  return area

def neighbours(simplex, simplices):
  """
  Find the neighbours of a simplex and its indices.

  Arguments:
      simplex {np.ndarray} -- Array of indices of the simplex
      simplices {np.ndarray} -- Array of simplices

  Returns:
      n_idx -- List of indices of the neighbours   
      n -- List of neighbours
  """
  n = []
  n_idx = []
  simplex_set = set(map(tuple, simplex))

  for idx, splx in enumerate(simplices):
      splx_set = set(map(tuple, splx))
      if len(simplex_set.intersection(splx_set)) >= 2 and simplex_set != splx_set:
          n.append(splx)
          n_idx.append(idx)

  return n_idx, n


def find_POI(points):
  """
  Calculate the Point of Inaccesiblity of a set of points.

  Arguments:
      points {np.ndarray} -- Array of points

  Returns:
      np.ndarray -- Point of Inaccesibility
  """

  points_pr = points[:,:2]
  z_coord = np.mean(points[:,-1])
  points_pr = sorted(points_pr, key= lambda x: polar_angle_sort(x, np.mean(points_pr, axis= 0)))
  pairs = tuple([tuple(x) for x in points_pr])
  try:
    polygon = Polygon(pairs)
  except:
    aux = np.array([points[0]])
    for p in aux:
      if not ((aux[:,None] == p).all(-1).any()):
        aux = np.vstack((aux,p))
    pairs = tuple([tuple(x) for x in aux[:,:2]])
    polygon = Polygon(pairs)
  
  point = polylabel(polygon, tolerance= 0.05)
  x = np.reshape(point.xy, (2,))

  return np.hstack((x,z_coord))


def find_apex(base_points, apex_proj, growth_vect):
  """
  Calculate the apex position of a polygon given the base points and 
  a initial apex position. The apex position will be the point that
  garanties that the angle between the base points and the apex position
  is at least 50 degrees.

  Arguments:
      base_points {np.ndarray} -- Array of points
      apex_pos {np.ndarray} -- Initial apex position

  Returns:
      np.ndarray -- Apex position
  """

  found = False
  delta = 0.1
  max_it = 500
  it = 0
  apex_pos = apex_proj
  while not found:
    found = (angle(apex_pos, base_points) > config.mesh.MIN_STRUT_ANGLE).all()
    if not found:
      if it < max_it:
        apex_pos = apex_pos + growth_vect*delta
      if it == max_it:
        apex_pos = apex_proj
      else:
        apex_pos[2] += 0.05

      delta += 0.05 if it != max_it else 0 
    it += 1
  return apex_pos


def section_props(mesh, z):
  section = mesh.section(np.array([0,0,1]), np.array([0,0,z]))
  dists = np.linalg.norm(section.vertices - section.centroid, axis= 1)
  max_dist = np.max(dists)
  min_dist = np.min(dists) if len(section.entities) > 1 else 0

  return section.centroid, section.length, max_dist, min_dist


def get_growth_vect(mesh, point, z_2):
  center_1, len_1, max_dist, min_dist = section_props(mesh, point[-1] if point[-1] < z_2 else z_2-1e-6)
  center_2, len_2 = section_props(mesh, z_2)[:2]
    
  relative_pos = point - center_1
  k = len_2/len_1
  projection = relative_pos*k + center_2
  growth_vect = (projection - point)
    
  alpha = adjustment_factor(np.linalg.norm(relative_pos), min_dist, max_dist)

  return (growth_vect / np.linalg.norm(growth_vect))*np.array([alpha, alpha, 1])


def calculate_number_of_simplices(mesh, z_1, inital_simplices):
  z_max = mesh.bounds[1][2]
  d_1 = section_props(mesh, z_1)[1]
  d_2= section_props(mesh, config.mesh.PORERADIUS + z_1 if config.mesh.PORERADIUS + z_1 < z_max 
                              else z_max - 1e-6)[1]

  delta = (d_2/d_1)**2
  num_simplices = int(np.round(inital_simplices*delta))

  return num_simplices

def initial_area(L= None, pore_area= None):
  if not pore_area:
    pore_area = L**2*np.sqrt(3)/4 #mm^2
  elif not L:
    L = np.sqrt(pore_area*4/np.sqrt(3))
  return L, pore_area

def adjustment_factor(x, lower_limit, upper_limit, k=7):
  """
  Función tangente hiperbólica ajustada para que tome valores de 0 a 1
  según la distancia al centro de la sección entre el límite inferior y superior.
  
  Arguments:
      x {float} -- Distancia del punto al centro.
      lower_limit {float} -- Límite inferior de la sección.
      upper_limit {float} -- Límite superior de la sección.
      k {float} -- Factor de pendiente para ajustar la transición.
      
  Returns:
      float -- Valor de la función tangente hiperbólica ajustada en el rango [0,1].
  """
  mid_point = (lower_limit + upper_limit) / 2
  normalized_x = (x - mid_point) / (upper_limit - lower_limit)
  
  return 0.5 * (np.tanh(k * normalized_x) + 1)