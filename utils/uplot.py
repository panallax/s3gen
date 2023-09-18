import matplotlib.pyplot as plt
import numpy as np
from scipy.spatial import Delaunay

def plot(cloud_points, points=[]) -> None:
    """
    Plot a point cloud in 3D. If points are given, plot them too.

    Parameters
    ----------
    cloud_points : numpy.ndarray
        Point cloud to plot
    points : list
        List of points to plot

    Returns
    -------
    None
    """

    fig = plt.figure(np.random.randint(1000), figsize=(15,15))
    ax = fig.add_subplot(111, projection="3d")
    ax.scatter3D(*cloud_points.T)
    if points:
        for point in points:
            ax.scatter3D(*point.T)
    plt.show()

def plot_knn(indices, X) -> None:
    fig = plt.figure(np.random.randint(1000), figsize = (15,15))
    ax = fig.add_subplot(111, projection='3d')
    ax.scatter(X[:, 0], X[:, 1], X[:, 2])
    
    # Unir los vecinos más cercanos de cada punto
    for i in range(X.shape[0]):
        for j in indices[i]:
            ax.plot([X[i, 0], X[j, 0]], [X[i, 1], X[j, 1]], [X[i, 2], X[j, 2]])

    plt.show(block=False)

def plot_Dealunay(points):
    indices = Delaunay(points).simplices
    plt.triplot(points[:,0], points[:,1], indices)
    plt.plot(points[:,0], points[:,1], 'o')
    plt.show()