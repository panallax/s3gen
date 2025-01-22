import numpy as np
from scipy.spatial import Delaunay, cKDTree
import trimesh
from utils.unodes import polar_angle_sort

def in_volume(p, hull):
    """ Test if the points in p are in the volume.

    Args:
        p (np.array): coordintes of the points to test.
        hull (np.array | scipy.spatial.Dealunay): points of the volume's surface.

    Returns:
        list: boolean list if each point is in the volume or not.
    """

    if not isinstance(hull,Delaunay):
        hull = Delaunay(hull)

    return hull.find_simplex(p) >= 0
    

def extract_points_from_STL(file):
    """ Extract the points from a STL file.
    
    Args:
        file (str): path to the STL file.
        
    Returns:
        np.array: coordinates of the points.
    """
    mesh = trimesh.load("../" + file)
    points = mesh.vertices
    z_min,z_max = mesh.bounds[:,2]
    bot_points = mesh.section(np.array([0,0,1]), np.array([0,0,z_min])).vertices
    top_points = points[points[:,2] >= z_max - 1e-6]

    lateral_faces = [i for i, normal in enumerate(mesh.face_normals) if abs(normal[2]) < 0.5]
    lateral_mesh = mesh.submesh([lateral_faces], append=True)
    connected_components = lateral_mesh.split(only_watertight= False)
    if len(connected_components) != 1:
      connected_components.sort(key=lambda x: x.area, reverse=True)
      lateral_mesh = connected_components[0]
      inner_mesh = connected_components[1:]

      return mesh.subdivide(), points, bot_points, top_points, lateral_mesh, inner_mesh

    return mesh.subdivide(), points, bot_points, top_points, lateral_mesh, None


def caracteristic_distsance(points):
    """ Calculate the caracteristic distance of the surface points.

    Args:
        points (np.array): coordinates of the points.

    Returns:
        float: caracteristic distance.
    """
    "Not Used"
    kd_tree = cKDTree(points)   
    total_dist = 0.0  
    for point in points:
        dist,_ = kd_tree.query(point, k=2)
        total_dist += dist[1]
    
    return total_dist / len(points)



def z_shell_points(points, outter_points, lateral_points, d, L = 5):
  """ Not used"""

  if outter_points:
    z = np.mean(np.array(outter_points)[:,2])
  else:
    z = np.mean(np.array(points)[:,2])
     
  section_points = lateral_points[(lateral_points[:,2] >= z - d) & (lateral_points[:,2] <= z + d)]
  section_line = []
#   s = np.array(list(sorted(section_points, key=lambda p: polar_angle_sort(p, np.array([0,0,0])))))
#   s = np.append(s, [s[0]], axis=0)
#   section_line = LineString(s).simplify(L/10).coords

  return np.array(section_line)

def detect_holes(mesh, z):

  path_3D = mesh.section(np.array([0,0,1]), np.array([0,0,z]))
  path_2D, transform = path_3D.to_planar()
  path_2D.rezero()
  section = path_2D.polygons_closed

  holes = []
  points = []
  segments = []
  offset = 0
  for i,pts in enumerate(section):
    pts = np.unique(pts.simplify(0.8).exterior.coords, axis= 0)
    n = len(pts)
    if i != 0:
      holes.append(np.mean(pts, axis=0))
    pts = sorted(pts, key= lambda x: polar_angle_sort(x, np.mean(pts, axis=0)))
    points.extend(pts)

    segments.extend([[offset + i, offset + (i + 1) % n] for i in range(n)])
    offset += n

  points = np.array(points)
  segments = np.array(segments)
  transform[np.abs(transform) < 1e-10] = 0

  return points, segments, holes, transform