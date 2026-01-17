import numpy as np
from scipy.spatial.distance import cdist

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

    vecs = ref - points
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
    if isinstance(points, list):
        points = np.array(points)
    if isinstance(point, list):
        point = np.array(point)

    if len(point.shape) >= 2 and point.shape[1] >= 2:
        result = np.any(np.all(points[:, np.newaxis] == point, axis=-1), axis=1)
    else:
        result = (points == point).all(-1).any()
    return result
    

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

def group_segments(segments):
    parent = {}

    def find(node):
        # Find the representative of the set (with path compression).
        if parent[node] != node:
            parent[node] = find(parent[node])
        return parent[node]

    def union(node1, node2):
        # Join two roots
        root1 = find(node1)
        root2 = find(node2)
        if root1 != root2:
            parent[root2] = root1

    # Initialise nodes in Union-Find
    for seg in segments:
        for node in seg:
            if node not in parent:
                parent[node] = node

    # Process segments to join components
    for seg in segments:
        union(seg[0], seg[1])

    # Group nodes by component
    groups = {}
    for node in parent:
        root = find(node)
        if root not in groups:
            groups[root] = []
        groups[root].append(node)

    group_list = list(groups.values())

    return group_list


def generate_segments(points, external_indices, internal_indices_dict):
    external_indices = sorted(external_indices, key= lambda x: polar_angle_sort(points[x], np.mean(points[external_indices], axis= 0)))
    external_segments = [
        (external_indices[i], external_indices[(i + 1) % len(external_indices)])
        for i in range(len(external_indices))
    ]

    internal_segments = []
    if internal_indices_dict:
      for internal_idx in internal_indices_dict.values():
          internal_idx = sorted(internal_idx, key= lambda x: polar_angle_sort(points[x], np.mean(points[internal_idx], axis= 0)))
          segments = [
              (internal_idx[i], internal_idx[(i + 1) % len(internal_idx)])
              for i in range(len(internal_idx))
          ]
          internal_segments.extend(segments)


    return external_segments + internal_segments