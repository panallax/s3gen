import numpy as np
from sklearn.neighbors import NearestNeighbors
from scipy.spatial.distance import cdist

def dist(a, b):
    """
    Compute the distance between two points
    """
    return np.sqrt(np.sum((a-b)**2))

def relative_dist(a,b, lamda):
    """
    Compute the relative distance between two points with respect to a parameter
    """
    return dist(a,b)-lamda


def angle(points, ref, plane):
    """
    Compute the angle between a set of points and a reference point and the horizontal plane
    
    Parameters
    ----------
    point (n) : numpy.ndarray (n, 3, m)
        Array of points
    ref (m) : numpy.ndarray (m, 3)
        Reference point
    plane : numpy.ndarray (1, 3)
        Normal vector of the plane

    Returns
    -------
    numpy.ndarray
        Array of angles (n, 1, m)
    
    """

    if len(points.shape) <= 2:
      norm_product = np.linalg.norm(points-ref)
      return np.arcsin(np.divide(np. matmul(points-ref, plane), norm_product))*180/np.pi
    plane_vecs = np.tile(np.array(plane).T, (ref.shape[0],1,1))
    norm_product = np.reshape(np.linalg.norm(points-ref[:,np.newaxis], axis=2), (ref.shape[0], points.shape[1],1))

    return np.reshape(np.arcsin(np.divide(np. matmul(points-ref[:,np.newaxis], plane_vecs), norm_product))*180/np.pi, (ref.shape[0], 1, points.shape[1]))

def knn(X, n_neighbors):
    """
    Compute the k-nearest neighbors of a set of points

    Parameters
    ----------
    X : numpy.ndarray
        Array of points
    n_neighbors : int
        Number of neighbors to compute

    Returns
    -------
    numpy.ndarray
        Array of neighbors
    numpy.ndarray
        Array of distances
    numpy.ndarray
        Array of indices

    """
    nbrs = NearestNeighbors(n_neighbors=n_neighbors, algorithm="ball_tree").fit(X)
    d, indices = nbrs.kneighbors(X)

    return X[indices], d[:,1:], indices[:,1:]


def flat(a):
    """
    Round the values of a tuple to the nearest integer

    Parameters
    ----------
    a : tuple
        Tuple of values

    Returns
    -------
    tuple
        Tuple of rounded values
    """
    return list(map(lambda x: int(np.ceil(x)) if x >= 0 else int(np.floor(x)), a))

def min_max_points(points):
    """
    Compute the minimum and maximum values of a set of points

    Parameters
    ----------
    points : numpy.ndarray
        Array of points

    Returns
    -------
    tuple
        Tuple of tuples with the minimum and maximum values of the points
    """
    return tuple(map(lambda axis: (min(axis), max(axis)), zip(*points)))

def calculate_position(cloud_points, point):
    """
    Calculate the position which a point should be inserted in a cloud of points
    depending on the z coordinate.

    Arguments:
        cloud_points {np.ndarray} -- Array of points
        point {np.ndarray} -- Point to be inserted

    Returns:
        cloud_points {np.ndarray} -- Array of points with the new point inserted
    """
    distances = np.abs(cloud_points[:,2] - point[2])
    # print(f"in position {np.argsort(distances)[0]}")
    cloud_points = np.insert(cloud_points, np.argsort(distances)[0]+1, point, axis=0)

    return cloud_points

def calculate_segments_dist(s1,s2):
    """
    Calculate the distance between two segments.

    Arguments:
        s1 {tuple} -- Segment 1
        s2 {tuple} -- Segment 2

    Returns:
        float -- Distance between the two segments
    """
    ls1 = np.linspace(s1[0], s1[1], 20)
    ls2 = np.linspace(s2[0], s2[1], 20)

    return np.min(cdist(ls1, ls2))

def isin(points, point):
    """
    Check if a point is in a set of points

    Arguments:
        points {np.ndarray} -- Array of points
        point {np.ndarray} -- Point to be checked

    Returns:
        bool -- True if the point is in the set of points, False otherwise
    """
    if len(point) > 3:
        return (points[:, None] == point).all(-1).any(-1)
    else:
        return (points == point).all(-1).any()