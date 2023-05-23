import numpy as np

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

    plane_vecs = np.tile(np.array(plane).T, (ref.shape[0],1,1))
    norm_product = np.reshape(np.linalg.norm(points-ref[:,np.newaxis], axis=2), (ref.shape[0], points.shape[1],1))

    return np.reshape(np.arcsin(np.divide(np. matmul(points-ref[:,np.newaxis], plane_vecs), norm_product))*180/np.pi, (ref.shape[0], 1, points.shape[1]))
