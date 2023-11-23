import numpy as np
from stl import mesh
from scipy.spatial import Delaunay
from scipy.spatial import cKDTree
from collections import Counter
from scipy.stats.qmc import PoissonDisk
from utils import flat, knn, min_max_points
import networkx as nx

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

def determinate_quadrant(point, origin):
    """Determinate the quadrant of a point with respect to an origin.

    Args:
        origin (np.array): origin point.
        point (np.array): point to determinate the quadrant.
    
    Returns:
        int: quadrant of the point respect to the origin.
    """

    diff = point - origin
    if len(diff) == 2:
      x,y = diff
    else:
      x, y, _ = diff
    if x > 0:
      return 1 if y > 0 else 4
    else:
      return 2 if y > 0 else 3
    
def generate_point_in_quadrant(center, r, n, quadrant, seed=1):
    """Generate n points in a given quadrant of a spherical casquete with center in center and radius r.

    Args:
        center (np.array): center of the sphere.
        r (float): radius of the sphere.
        n (int): number of points to generate.
        quadrant (int): quadrant of the sphere to generate the points.
        seed (int, optional): seed of the random generator. Defaults to 1.

    Returns:
        np.array: coordinates of the generated points.
    """
    "https://www.bogotobogo.com/Algorithms/uniform_distribution_sphere.php"
    np.random.seed(seed)

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


def fill_volume(shell_points, r=0.2):
    """
    Fill the volume of a mesh with points using a Poisson Disk Sampling algorithm.
    Points are separated by a distance of r. Points distanced less than 0.1 due to
    the filling process are removed.

    Arguments:
        shell_points {np.ndarray} -- Array of points of the shell of the mesh
        r {float} -- Radius of the Poisson Disk Sampling algorithm (default: {0.2})

    Returns:
        np.ndarray -- Array of points of the mesh filled
    """
    min_max = min_max_points(shell_points)

    x_min, x_max = flat(min_max[0])
    y_min, y_max = flat(min_max[1])
    z_min, z_max = flat(min_max[2])

    n = 1000
    all_points = np.zeros([(x_max-x_min)*(y_max-y_min)*(z_max-z_min)*n,3])
    for k in range(z_min, z_max):
        for j in range(y_min,y_max):
            for i in range(x_min, x_max):
                vect = np.array([i,j,k])
                engine = PoissonDisk(d=3, radius=r, seed=1)
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

def calculate_neighbors_in_node(G, node):
  """
    Calculate the number of neighbors of a node in a graph

    Arguments:
        G {networkx.classes.graph.Graph} -- Graph
        node {tuple} -- Node of the graph
    
    Returns:
        int -- Number of neighbors of the node
    """
  node = tuple(node)
  return (len(list(nx.neighbors(G, node))))

def decompose_structure(self, shell_points, r):
    """
    Decompose the structure in three parts: shell, bottom and top.
    The shell is the points of the mesh in the shell of the mesh.
    The bottom is the points of the mesh in the bottom of the mesh.
    The top is the points of the mesh in the top of the mesh.

    Arguments:
        shell_points {np.ndarray} -- Array of points of the shell of the mesh
        r {float} -- Radius of the Poisson Disk Sampling algorithm (default: {0.2})

    Returns:
        np.ndarray -- Array of points of the shell of the mesh
        np.ndarray -- Array of points of the bottom of the mesh
        np.ndarray -- Array of points of the top of the mesh
    """
    
    bot_points = self.points[np.where(shell_points[:,-1] < np.min(self.points[:,-1]) + 0.1)]
    top_points = self.points[np.where(self.points[:,-1] > np.max(self.points[:,-1]) - 0.1)]
    points = fill_volume(shell_points, r)[np.argsort(shell_points[:, 2])[::1]]
    return points, bot_points, top_points
