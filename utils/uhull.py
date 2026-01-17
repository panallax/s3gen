import numpy as np
import trimesh
from utils.unodes import polar_angle_sort


def extract_points_from_STL(file):
    """ Extract the points from a STL file.
    
    Args:
        file (str): path to the STL file.
        
    Returns:
        np.array: coordinates of the points.
    """
    mesh = trimesh.load("../" / file)
    translation = mesh.bounds[0]
    mesh.vertices -= translation
    
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

def detect_bolts(points_list, tol=2.0):
    """
     Detect bolts by its coordinates in the plane X-Y.

    Args:
        points_list (numpy array): Nested lists of the different holes points
        tolerance (float): Margin to determine if a point is on an edge.

    Returns:
        bolts_idx (numpy array): Indices of which lists of points are bolts holes.
    """

    mean_points = np.array([np.mean(x[:,:2], axis= 0) for x in points_list])
    x_min, y_min = mean_points.min(axis=0)
    x_max, y_max = mean_points.max(axis=0)

    on_edge_x = (np.abs(mean_points[:, 0] - x_min) < tol) | (np.abs(mean_points[:, 0] - x_max) < tol)
    on_edge_y = (np.abs(mean_points[:, 1] - y_min) < tol) | (np.abs(mean_points[:, 1] - y_max) < tol)
    bolts_idx =[i for i in range(len(points_list)) if  (on_edge_x[i] & on_edge_y[i])]

    return bolts_idx