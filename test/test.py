from sklearn.neighbors import NearestNeighbors
import numpy as np
import matplotlib.pyplot as plt
import networkx as nx
from utils.unodes import angle 
from utils.uhull import in_volume   
from stl import mesh


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
    return list(map(lambda x: np.ceil(x) if x >= 0 else np.floor(x), a))


if __name__ == "__main__":

    m = mesh.Mesh.from_file('/home/alex/Desktop/mesh-gen/data/Cilindro.stl')
    points = np.unique(m.points.reshape([-1,3]), axis=0)
    print(points.shape)
    min_max = min_max_points(points)

    x_min, x_max = flat(min_max[0])
    y_min, y_max = flat(min_max[1])
    z_min, z_max = flat(min_max[2])

    pc = np.array([[np.random.uniform(x_min, x_max), np.random.uniform(y_min, y_max), np.random.uniform(z_min, z_max)] for _ in range(1000)])
    pc = pc[in_volume(pc, points)] 
    all_points = np.concatenate((points, pc), axis=0)
    print(pc.shape)
    print(all_points.shape)
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.scatter(all_points[:,0], all_points[:,1], all_points[:,2], c='b', marker='o')
    plt.show()
    # side_length = 2
    # n_samples = 100

    # x = np.random.uniform(low=-side_length/2, high=side_length/2, size=(n_samples,))
    # y = np.random.uniform(low=-side_length/2, high=side_length/2, size=(n_samples,))
    # z = np.random.uniform(low=-side_length/2, high=side_length/2, size=(n_samples,))
    # points = np.stack((x,y,z), axis=-1)
    
    pnts, dists, indices =  knn(all_points,20)

    ref = pnts[:,0,:]
    points = pnts[:,1:,:]
    plane = np.array([[0,0,1]])
    angles = angle(points,ref,plane)

    G = nx.Graph()
    G.add_nodes_from(np.arange(len(indices)))

    fig = plt.figure(figsize = (15,15))
    ax = fig.add_subplot(111, projection='3d')

    for i,v in enumerate(pnts):
    
        current_point = v[0,:]

        indx_pos = np.where(v[:,-1] > current_point[-1]) #Nos quedamos solo con puntos por encima del de referencia
        filtered_points = v[indx_pos]
        filtered_angles = angles[i][0][np.array(indx_pos) - 1][0] 

        indx_angles = np.where(np.absolute(filtered_angles) > (45- 0.1))

        filtered_angles = (filtered_angles[indx_angles] - 45)/360
        filtered_points = filtered_points[indx_angles]
        filtered_dist = (dists[i][np.array(indx_pos) - 1][0][indx_angles] - np.mean(dists))/np.max(dists)
        filtered_indices = indices[i][np.array(indx_pos) - 1][0][indx_angles]

        score_array = np.absolute(filtered_angles + filtered_dist)
        print(score_array)
        
        for pos,idx in enumerate(filtered_indices):
            node_connections = len(nx.to_dict_of_dicts(G)[idx])
            if node_connections > 0 and node_connections <= 6:
                score_array[pos] /= (7-node_connections)
        
        print(score_array)
        # print(filtered_indices)
        # print(np.argsort(score_array))


        for timer,j in enumerate(np.argsort(score_array)):
            if timer == 5:
                break
            G.add_edge(i,filtered_indices[j])
            plt.plot([current_point[0], filtered_points[j,0]],[current_point[1], filtered_points[j,1]],[current_point[2], filtered_points[j,2]])
        
        # print(filtered_points)
        # print(filtered_angles)
        # print(filtered_dist)
        # print(indices[i][np.array(indx_pos) - 1][0][indx_angles])
        # print(np.absolute(filtered_angles + filtered_dist))
        print("----")

    ax.scatter(*pnts.T)
    plt.show()
