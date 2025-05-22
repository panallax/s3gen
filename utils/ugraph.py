import networkx as nx
import numpy as np
from scipy.spatial import KDTree, Delaunay
from scipy.spatial.distance import cdist
from utils import isin, calculate_segments_dist, exclude_points, angle
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

def adjacency_matrix(G):
  """
  Compute the adjacency matrix of a graph and the nodes of the graph.

  Arguments:
      G {networkx.classes.graph.Graph} -- Graph
  
  Returns:
      list -- List of nodes
      numpy.ndarray -- Adjacency matrix
  """
  
  nodes = list(map(np.array,G.nodes()))
  matrix = nx.adjacency_matrix(G).todense()

  return nodes, matrix

def inner_colisions(G, node, point, D = None):
    "Not used"
    """
    Check if a segment defined by the node and the point collides with the structure or
    is too close to it.

    Arguments:
        G {networkx.classes.graph.Graph} -- Graph
        D {networkx.classes.graph.Graph} -- Graph
        node {np.ndarray} -- Node of the segment
        point {np.ndarray} -- Point of the segment

    Returns:
        bool -- True if the segment collides with the structure, False otherwise
    """
    if D:
        C = nx.compose(G,D)
    else:
        C = G
    
    if tuple(node) not in C:
        return False
    
    norm = np.linalg.norm(node - point)
    s1 = np.linspace(node, point, 20)
    for nbr in C.neighbors(tuple(node)):
        s2 = np.linspace(node, np.array(nbr),20)
        if norm >= np.linalg.norm(node - np.array(nbr)):
            colision = (np.min(cdist(s1,s2), axis=0) < 0.1).all()
            if colision:
                return True 
        else: 
            colision = (np.min(cdist(s2,s1), axis=0) < 0.1).all()
            if colision:
                return True 
        
    return False


def get_observable_segments(G, origin, point,d, D= None):
    """
    The observable segments are the segments that are at least separated by a distance
    of d from the segment defined by the origin and the point.

    Arguments:
        G {networkx.classes.graph.Graph} -- Graph
        D {networkx.classes.graph.Graph} -- Graph
        origin {np.ndarray} -- Origin of the segment
        point {np.ndarray} -- Point of the segment
        d {float} -- Minimum distance

    Returns:
        np.ndarray -- Array of observable segments
    """

    if D:
        C = nx.compose(G,D)
    else:
        C = G

    nodes = np.array(C.nodes())
    tree_points = KDTree(nodes)
    p1,p2 =  origin, point
    mid_point = (p1+p2)/2
    observable_points = np.unique(np.concatenate([x[1:] for x in tree_points.query_ball_point([p1,p2,mid_point], 2*d, workers= -1)], dtype= int, casting= "unsafe"))            

    valid_points = exclude_points(nodes[observable_points], np.array([p1,p2, mid_point]))
    observable_segments = []
    for valid_point in valid_points:
        point_nodes = C.neighbors(tuple(valid_point))
        for n in point_nodes:
            if not isin(np.array([p1,p2]), np.array(n)).any() and isin(nodes[observable_points], np.array(n)).any():
                observable_segments.append(np.array([valid_point,n]))

    observable_segments = np.unique(np.array(list(map(lambda x: x[np.argsort(x[:,0])], observable_segments))), axis=0)

    return observable_segments

def check_connection(G, origin, point, d, D= None):
    "Not used"
    """
    Check if a segment defined by the origin and the point can be added to the graph.
    The segment will be added if it doesn't collide with the structure, it is not too
    close to the structure and if the angle between the segment and the horizontal
    plane is greater than 45 degrees.

    Arguments:
        G {networkx.classes.graph.Graph} -- Graph
        D {networkx.classes.graph.Graph} -- Graph
        origin {np.ndarray} -- Origin of the segment
        point {np.ndarray} -- Point of the segment
        d {float} -- Minimum distance
    
    Returns:
        bool -- True if the segment can be added to the graph, False otherwise
    """
    vecs = point - origin

    angle = np.degrees(np.arctan2(vecs[2], np.sqrt(vecs[ 0]**2 + vecs[1]**2)))
    if angle < 44:
        return False
    
    if len(G.nodes()) < 3:
        return True
    
    colisions = inner_colisions(G,origin, point, D)
    if colisions:
        return False
    
    observable_segments = get_observable_segments(G, origin, point,d , D)
    for s in observable_segments:
        d = calculate_segments_dist(s, (origin, point))
        if d < 0.45:            
            return False

    return True


def shell_graph(D, lateral, d): 
    "Not used"
    """
    Generate a graph from the shell points used to generate the structure. Only the segments
    that meet the angularity criteria will be added to the graph.

    Arguments:
        D {networkx.classes.graph.Graph} -- Graph
        lateral {np.ndarray} -- Array of points
        d {float} -- Minimum distance

    Returns:
        networkx.classes.graph.Graph -- Graph
    """
    nodes = np.array(D.nodes())
    base_points = nodes[nodes[:,2] == np.min(nodes[:,2])]
    lateral_base_points = base_points[np.unique(Delaunay(base_points[:,:2]).convex_hull)]

    lateral = exclude_points(lateral, exclude_points(lateral, nodes))
    lateral = np.vstack((lateral, lateral_base_points))
    lateral = lateral[np.argsort(lateral[:, 2])[::1]]
    kd_tree = KDTree(lateral)

    g = nx.Graph()
    g.add_nodes_from(list(map(tuple, lateral)))
    for point in lateral:
        a = np.array(kd_tree.query_ball_point(point, 2*d))
        points_above =  lateral[a[np.where(lateral[a][:,-1] > point[-1])]]
        for i in points_above:
            if check_connection(g, D, point, i, d):
                g.add_edge(tuple(point), tuple(i))

    return g

def connectivity(G):
    """
    Compute the connectivity of a graph. The connectivity is a list of nodes and its
    neighbors, the angle between the node and its neighbors and the distance between
    the node and its neighbors.

    Arguments:
        G {networkx.classes.graph.Graph} -- Graph

    Returns:
        list -- List of connectivity
    """
    
    conn_list = []
    sorted_nodes = sorted(G.nodes(), key=lambda x: x[2])

    for n in sorted_nodes:
        neigh = list(G.neighbors(n))
        neigh_idx = list(map(lambda x: sorted_nodes.index(x), neigh))
        neigh_angle = angle(np.array(n), np.array(neigh))
        neigh_dist = np.linalg.norm(np.array(n) - np.array(neigh), axis=1)
        conn_list.append([np.array(n), [neigh_idx, neigh_angle, neigh_dist]])
    
    return conn_list

def split_graph(G):
    """
    Split the graph into two subgraphs: the base and the top.
    The base subgraph contains all nodes at the lowest height.
    The top subgraph contains all nodes at the highest height.
    """

    sorted_nodes = sorted(G.nodes(), key=lambda x: x[2])
    base_height = sorted_nodes[0][2]
    top_height = sorted_nodes[-1][2]
    base = G.subgraph(list(filter(lambda x: x[2] == base_height, G.nodes())))
    top = G.subgraph(list(filter(lambda x: x[2] == top_height, G.nodes())))

    return base, top, sorted_nodes

def delaunay_path(G, start_node):
    """
    Given a graph G and a start node, return a path that traverses all edges in the graph.
    The path is generated using a depth-first search traversal of the graph.

    Arguments:
        G : networkx.Graph
            The graph to traverse.

        start_node : tuple
            The node to start the traversal from.

    Returns:
        traversal_path : list
            A list of edges that form a path that traverses all edges in the graph.
    """

    visited_edges = []
    traversal_path = []
    
    def dfs(node):
        for neighbor in G.neighbors(node):
            if (node, neighbor) not in visited_edges and (neighbor, node) not in visited_edges:
                visited_edges.append((node, neighbor))
                traversal_path.append((node, neighbor))
                dfs(neighbor)
    
    dfs(start_node)

    return traversal_path