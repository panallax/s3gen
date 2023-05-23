import numpy as np
from stl import mesh
from scipy.spatial import Delaunay

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

