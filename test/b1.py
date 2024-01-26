import numpy as np
import config
from utils import exclude_points, angle, isin, calculate_segments_dist
from scipy.spatial import Delaunay, KDTree
import networkx as nx


def inner_colisions(G, node, point):
    if tuple(node) not in G:
        return False
    
    s1 = np.linspace(node, point, 20)
    for nbr in G.neighbors(tuple(node)):
        s2 = np.linspace(node, np.array(nbr),20)
        if (np.min(cdist(s1,s2), axis=0) < 0.1).all():
            return True
    return False


def get_observable_segments(G, origin, point,d):
    nodes = np.array(G.nodes())
    tree_points = KDTree(nodes)
    p1,p2 =  origin, point
    mid_point = (p1+p2)/2
    observable_points = np.unique(np.concatenate([x[1:] for x in tree_points.query_ball_point([p1,p2,mid_point], 2*d, workers= -1)], dtype= int, casting= "unsafe"))            

    valid_points = exclude_points(nodes[observable_points],[p1,p2, mid_point])
    observable_segments = []
    for valid_point in valid_points:
        point_nodes = G.neighbors(tuple(valid_point))
        for n in point_nodes:
            if not isin(np.array([p1,p2]), np.array(n)).any() and isin(nodes[observable_points], np.array(n)).any():
                observable_segments.append(np.array([valid_point,n]))

    observable_segments = np.unique(np.array(list(map(lambda x: x[np.argsort(x[:,0])], observable_segments))), axis=0)

    return observable_segments

def check_connection(G, origin, point, d):

    if angle(origin, point, np.array([0,0,-1])) < 44:
        return False
    
    if len(G.nodes()) < 3:
        return True
    
    colisions = inner_colisions(G, origin, point)
    if colisions:
        return False
    
    observable_segments = get_observable_segments(G, origin, point,d)
    for s in observable_segments:
        d = calculate_segments_dist(s, (origin, point))
        if d < 0.1:
            return False
        
    return True


def shell_graph(points, d):
    bot_points = points[np.where(points[:,-1] < np.min(points[:,-1]) + 0.1)]
    top_points = points[np.where(points[:,-1] > np.max(points[:,-1]) - 0.1)]
    lateral = exclude_points(points, bot_points)
    lateral = exclude_points(lateral, top_points)
    lateral = lateral[np.argsort(lateral[:, 2])[::1]]
    kd_tree = KDTree(lateral)

    G = nx.DiGraph()
    for point in lateral:
        # print("point", point)
        a = np.array(kd_tree.query_ball_point(point, 2*d))
        points_above =  lateral[a[np.where(lateral[a][:,-1] > point[-1])]]
        for i in points_above:
            if check_connection(G, point, i, d):
                G.add_edge(tuple(point), tuple(i))

    return G