import matplotlib.pyplot as plt
import numpy as np
from scipy.spatial import Delaunay
from utils.unodes import between_points


def plot_Dealunay(points):
    """
    Plot the Delaunay triangulation of a set of points.

    Arguments:
        points {np.ndarray} -- Array of points
    """

    points = np.array(points)
    if points.shape[1] == 3:
        points = points[:,:2]
    indices = Delaunay(points).simplices
    plt.triplot(points[:,0], points[:,1], indices)
    plt.plot(points[:,0], points[:,1], 'o')
    plt.show()

def plot_graph(G):
    """
    Plot a graph.

    Arguments:
        G {nx.Graph} -- Graph
    """

    fig = plt.figure(np.random.randint(1000), figsize = (15,15))
    ax = fig.add_subplot(111, projection='3d')
    ax.scatter(*np.array(list(G.nodes())).T)
    for edge in G.edges():
        ax.plot([edge[0][0], edge[1][0]],[edge[0][1], edge[1][1]],[edge[0][2], edge[1][2]])
    ax.set_xlabel("x")
    ax.set_ylabel("y")
    ax.set_zlabel("z")
    plt.show()

def print_dict(poly_dict):
  """
  Print the dictionary of polyhedrons.

  Arguments:
      tetra_dict {dict} -- Dictionary of polyhedrons
  """

  fig = plt.figure(figsize=(15,15))
  ax = fig.add_subplot(111, projection="3d")
  for k,elem in poly_dict.items():
    ax.scatter(elem["base_points"][:, 0], elem["base_points"][:, 1], elem["base_points"][:,2], facecolors='none', edgecolors='black')
    ax.scatter(elem["apex"][0], elem["apex"][1], elem["apex"][2], facecolors='none', edgecolors='green')
    for i,p in enumerate(elem["base_points"]):

      if len(elem["base_points"]) == 3:
        plt.plot([elem["base_points"][i,0],elem["apex"][0]],[elem["base_points"][i,1],elem["apex"][1]],[elem["base_points"][i,2],elem["apex"][2]], "blue")
      else:  
        previous = elem["base_points"][i-1] if i > 0 else elem["base_points"][-1]
        following = elem["base_points"][(i+1)] if i < len(elem["base_points"])-1 else elem["base_points"][0]
        if between_points(np.array([previous, p, following]), elem["apex"]):
          plt.plot([elem["base_points"][i,0],elem["apex"][0]],[elem["base_points"][i,1],elem["apex"][1]],[elem["base_points"][i,2],elem["apex"][2]], "blue")
     
  ax.set_xlabel('X')
  ax.set_ylabel('Y')
  ax.set_zlabel('Z')
  plt.show()


def plot_tessellation(points, dea):
  """
  Plot the tessellation of a set of points. 

  Arguments:
      points {np.ndarray} -- Array of points
      dea {np.ndarray} -- Array of simplices
  """
  _, ax = plt.subplots(figsize=(10,10))
  for d in dea:
    points_simplex = points[d]
    consecutive_pairs = [(points_simplex[i], points_simplex[(i + 1) % len(points_simplex)]) for i in range(len(points_simplex))]
    for par in consecutive_pairs:
      x_values = [par[0][0], par[1][0]]
      y_values = [par[0][1], par[1][1]]
      ax.plot(x_values, y_values, marker='o', color="green")

  ax.set_aspect('equal', adjustable='datalim')
  plt.show()