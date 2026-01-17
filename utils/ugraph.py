import networkx as nx
import numpy as np
from scipy.spatial import KDTree
from utils import isin, calculate_segments_dist, exclude_points
from itertools import chain
from config import config


def remove_close_edges(G, max_global_dist):
    """
    Remove edges from a graph that are too close to each other. To do so, the 
    function calculates the distance between the edges and its closest edges. One
    segment will be considered potentially removable if the distance that separates
    it from the segment in less than the maximum global distance. And will be removed
    if the distance between the segments is less than 0.4. The segment to be reomved
    will be the one with less neighborst.

    Arguments:
        G {networkx.classes.graph.Graph} -- Graph
        max_global_dist {float} -- Maximum global distance
    
    Returns:
        networkx.classes.graph.Graph -- Graph without the close edges
    """

    nodes = np.array(G.nodes())
    edges = G.edges()
    tree_points = KDTree(nodes)
    for segment in edges:
        if segment not in G.edges():
            continue
        p1,p2 = np.array(segment)
        observable_points = np.unique(np.concatenate([x[1:] for x in tree_points.query_ball_point([p1,p2], max_global_dist)], dtype= int, casting= "unsafe"))
        valid_points = exclude_points(nodes[observable_points],np.array([p1,p2]))

        observable_segments = []
        for valid_point in valid_points:  
            point_nodes = G.neighbors(tuple(valid_point))
            for n in point_nodes:
                if not isin(np.array(segment), np.array(n)).any() and isin(nodes[observable_points], np.array(n)).any():
                    observable_segments.append(np.array([valid_point,n]))

        observable_segments = np.unique(np.array(list(map(lambda x: x[np.argsort(x[:,0])], observable_segments))), axis=0)
        min_nbr_current_segment = min(list(map(lambda x: calculate_neighbors_in_node(G,x), [p1,p2])))
        local_segments_to_remove = []
        for s in observable_segments:
            if calculate_segments_dist(s, (p1,p2)) < config.printing.EXTRUSION_WIDTH:
                nbr_node = list(map(lambda x: calculate_neighbors_in_node(G,x), s))
                if min(nbr_node) > min_nbr_current_segment:
                    local_segments_to_remove.append(tuple(map(tuple,s)))

                else:
                    try:
                        G.remove_edge(tuple(p1), tuple(p2))
                    except:
                        pass
                    local_segments_to_remove.clear()
                    break
        if len(local_segments_to_remove) >= 1:
            if len(set(chain(*local_segments_to_remove))) % 2 != 0:
                try:
                    G.remove_edge(tuple(p1), tuple(p2))
                except:
                    pass
            else:
                G.remove_edges_from(local_segments_to_remove) 

    return G

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