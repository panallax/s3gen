import numpy as np
from stl import mesh
from scipy.spatial import Delaunay, cKDTree


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
    m = mesh.Mesh.from_file("../" + file)
    points = np.unique(m.points.reshape([-1,3]), axis=0)
    bot_points = points[points[:,2] == m.z.min()]
    top_points = points[points[:,2] == m.z.max()]
    lateral_points = points[(points[:,2] != m.z.min()) & (points[:,2] != m.z.max())]
    
    return points, bot_points, top_points, lateral_points


def caracteristic_distsance(points):
    """ Calculate the caracteristic distance of the surface points.

    Args:
        points (np.array): coordinates of the points.

    Returns:
        float: caracteristic distance.
    """
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