import numpy as np
from scipy.spatial import Delaunay
from shapely.geometry import Polygon
from shapely.ops import polylabel
from utils import polar_angle_sort

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

def tessellate_points(initial_len, points):
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
    simplex = sorted_simplices[0]
    area_simplex = sorted_areas[0]
    idx,n = neighbours(simplex, sorted_simplices)
    idx_smaller_neighbor, smaller_area = [(idx[x], sorted_areas[idx[x]]) for x in sorted(range(len(n)), key=lambda k: sorted_areas[idx[k]])][0]
    merged_dea = merge_sorted_simplices(sorted_dea[0], sorted_dea[idx_smaller_neighbor])
    merged_simplex = points[merged_dea]
    merged_area = area_simplex + smaller_area

    for id in [0,idx_smaller_neighbor-1]: #restamos uno porque cuando quitamos el indice 0 y el otro se adelanta una posición
      del sorted_areas[id]
      del sorted_simplices[id]
      del sorted_dea[id]
    pos = np.argsort([abs(sa - merged_area) for sa in sorted_areas])[0]
    sorted_areas.insert(pos, merged_area)
    sorted_simplices.insert(pos, merged_simplex)
    sorted_dea.insert(pos, merged_dea)

  return sorted_dea

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
  area = 0.5 * abs(sum(x0*y1 - x1*y0 for ((x0, y0), (x1, y1)) in zip(sorted_points, sorted_points[1:] + [sorted_points[0]])))
  
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
  for pr in [(simplex[i], simplex[(i + 1) % len(simplex)]) for i in range(len(simplex))]:
    for idx, splx in enumerate(simplices):
      if np.count_nonzero((splx[:, None] == pr).all(-1).any(-1)) >= 2 and not (splx[:,None] == simplex).all(-1).diagonal().all():
        n.append(splx)
        n_idx.append(idx)

  return n_idx,n


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


def find_apex(base_points, apex_pos):
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
  while not found:
    angles = []
    for i in range(len(base_points)):
      f = (np.degrees(np.arcsin(-(base_points[i,-1] - apex_pos[-1])/np.linalg.norm([base_points[i,0] - apex_pos[0], base_points[i,1] - apex_pos[1], base_points[i,2] - apex_pos[2]]))))
      angles.append(f>50)

    found = all(angles)
    if not found:
      apex_pos[2] += 0.05
  
  return apex_pos


