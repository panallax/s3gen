import numpy as np
from stl import mesh
from scipy.spatial import Delaunay
from scipy.spatial import cKDTree

def sample_points(npoints, point, radius):
    """ Sample points in a sphere.
    
    Args:
        npoints (int): number of points to sample.
        point (np.array): center of the sphere.
        radius (float): radius of the sphere.
        
    Returns:
        np.array: coordinates of the sampled points.
    """
    
    x = np.random.normal(size=(npoints, 3))
    norm = np.linalg.norm(x, axis=1)
    x /= norm[:, np.newaxis]
    x *= radius
    x += point

    hdist = np.linalg.norm(x[:,:2] - point[:2], axis=1) < radius*np.cos(np.pi/4)
    mask = (x[:,2] > point[2]) & (hdist)
    x = x[mask]

    if x.shape[0] < 4:
        x = sample_points(npoints*2, point, radius)

    return x


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
    m = mesh.Mesh.from_file(file)
    points = np.unique(m.points.reshape([-1,3]), axis=0)
    
    return points


def z_shell_points(points, bot_points,d):
  """
  Return the points of the shell of the mesh closer to a given distance d from the bottom points 
  """
  shell = points[np.linalg.norm(points[:,:2], axis=1) > 1.48]
  z = shell[abs(shell[:,2:] - np.mean(bot_points,axis=0)[-1]).argmin()]

  return shell[abs(shell[:,2] - z[-1]) < 0.45*d]


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

def caracteristic_distsance(points):
    kd_tree = cKDTree(points)   
    total_dist = 0.0  
    for point in points:
        dist,_ = kd_tree.query(point, k=2)
        total_dist += dist[1]
    
    return total_dist / len(points)