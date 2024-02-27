import numpy as np
from scipy.spatial.distance import cdist, squareform, pdist 

def angle(ref, points):
    """
    Calculate the angle between the vector defined by the reference point and 
    the set of points and the horizontal plane.

    Arguments:
        ref {np.ndarray} -- Reference point
        points {np.ndarray} -- Array of points

    Returns:
        np.ndarray -- Array of angles
    """

    vecs = points - ref
    return np.degrees(np.arctan2(vecs[:, 2], np.sqrt(vecs[:, 0]**2 + vecs[:, 1]**2)))


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
    

def exclude_points(arr, values_to_remove):
  """
  Remove the rows of arr that are equal to any of the rows of values_to_remove
  
  Arguments:
      arr {np.ndarray} -- Array of points
      values_to_remove {np.ndarray} -- Array of points to remove
    
  Returns:
      np.ndarray -- Array of points without the points of values_to_remove
  
  """
  new_arr = arr[~(arr==values_to_remove[:,None]).all(-1).any(0)]

  return new_arr

def between_points(points, p):
    """
    Check if a point is inside a triangle defined by three points

    Arguments:
        puntos {np.ndarray} -- Array of points
        p {np.ndarray} -- Point to be checked
    
    Returns:
        bool -- True if the point is inside the triangle, False otherwise
    """

    b,a,c = points[:,:2]
    ab = b - a
    ac = c - a
    ap = p[:2] - a
    cross_abp = np.cross(ab, ap)
    cross_acp = np.cross(ac, ap)

    return (cross_abp >= 0 and cross_acp <= 0) or (cross_abp <= 0 and cross_acp >= 0)

def polar_angle_sort(point, ref_point):
    """
    Calculate the polar angle of a point with respect to a reference point

    Arguments:
        point {np.ndarray} -- Point
        ref_point {np.ndarray} -- Reference point

    Returns:
        float -- Polar angle
    """
    x, y = point[0] - ref_point[0], point[1] - ref_point[1]
    return np.arctan2(y, x)

def min_dist(points,point):
    """
    Calculate the nearest point from a set of points to a reference point.

    Arguments:
        points {np.ndarray} -- Array of points
        point {np.ndarray} -- Reference point

    Returns:
        tuple {np.ndarray, np.ndarray} -- Reference point, Nearest point
    """

    return (point, points[np.argmin(np.linalg.norm(points-point, axis=1))])

def calculate_segments_dist(s1,s2):
    """
    Calculate the minimum distance between two segments.

    Arguments:
        s1 {np.ndarray} -- Array of two points of the first segment
        s2 {np.ndarray} -- Array of two points of the second segment

    Returns:
        float -- Minimum distance between the two segments
    """

    ls1 = np.linspace(s1[0], s1[1], 20)
    ls2 = np.linspace(s2[0], s2[1], 20)

    return np.min(cdist(ls1, ls2))


def remove_closer_points(tetra_dict, points, shell_points):
  "Not used"
  
  points = np.unique(points, axis=0)
  shell_points = np.array(shell_points)
  points_pr = points[:,:2]

  dists = squareform(pdist(points_pr))
  closer = np.where((dists <= 1) & (dists>0))
#   groups = join_paths(list(zip(*closer)))
  groups = []
  if len(groups) != 0:
    indx_to_delete = []
    for g in groups:
      g = np.array(g)
      check_shell = (points_pr[g][:,None] == shell_points[:,:2]).all(-1).any(-1)
      if check_shell.any():
        shell_point = points[g][np.nonzero(check_shell)][0]
        indx_to_delete.extend(np.delete(g, np.nonzero(check_shell), axis=0).tolist())
        # bot_points_pr = np.delete(points[g],np.nonzero(check_shell), axis=0)
        for p in np.delete(points[g],np.nonzero(check_shell), axis=0):
            pass
        #   tetra_dict = update_polyhedrons_dict(tetra_dict, p, shell_point)
      # else:
      #   new_point = points[g[np.argmax(points[g][:,2])]]
      #   indx_to_delete.extend(g.tolist())
      #   # bot_points_pr = np.delete(bot_points_pr,bot_points_pr[g] , axis=0)
      #   points = np.vstack((points, new_point))
      #   for pt in points[np.array(g)]:
      #     tetra_dict = update_polyhedrons_dict(tetra_dict, pt, new_point)

    spaced_points = np.delete(points, indx_to_delete, axis=0)

    return tetra_dict, spaced_points
  else:
    return tetra_dict, points
  