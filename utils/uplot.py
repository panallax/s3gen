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
    plt.figure(figsize=(10,10))
    plt.axes().set_aspect('equal')
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

def print_dict(points, poly_dict, plotter="pyvista"):
    """
    Print the dictionary of polyhedrons.

    Arguments:
        tetra_dict {dict} -- Dictionary of polyhedrons
    """
    if plotter == "pyvista":
        import pyvista as pv
        plotter = pv.Plotter()
        
        # Añadir todos los nodos
        plotter.add_points(points, color='gray', point_size=5, render_points_as_spheres=True, opacity=0.2)  

        for poly in poly_dict.values():
            apex = poly["apex"]
            base = poly["base_points"]

            # Añadir ápice
            plotter.add_points(np.array([apex]), color='orange', point_size=6, render_points_as_spheres=True)

            # Añadir líneas a la base
            for p in base:
                line = pv.Line(p, apex)
                plotter.add_mesh(line, color='tab:blue', line_width=2) 
        plotter.add_axes()
        plotter.show()
    
    if plotter == "matplotlib":
        fig = plt.figure(figsize=(15,15))
        ax = fig.add_subplot(111, projection="3d")
        ax.scatter(
            *points.T,
            s=2,
            facecolors='none', edgecolors='gray', alpha=0.5
        )
        for k,elem in poly_dict.items():
            ax.scatter(elem["apex"][0], elem["apex"][1], elem["apex"][2], c='orange', s= 10)
            for i,p in enumerate(elem["base_points"]):
            # if len(elem["base_points"]) == 3:
                plt.plot([elem["base_points"][i,0],elem["apex"][0]],[elem["base_points"][i,1],elem["apex"][1]],[elem["base_points"][i,2],elem["apex"][2]], "tab:blue")
            # else:  
            #   previous = elem["base_points"][i-1] if i > 0 else elem["base_points"][-1]
            #   following = elem["base_points"][(i+1)] if i < len(elem["base_points"])-1 else elem["base_points"][0]
            #   # if between_points(np.array([previous, p, following]), elem["apex"]):
            #   plt.plot([elem["base_points"][i,0],elem["apex"][0]],[elem["base_points"][i,1],elem["apex"][1]],[elem["base_points"][i,2],elem["apex"][2]], "tab:blue")
            
        ax.set_xlabel('X [mm]', fontsize=16)
        ax.set_ylabel('Y [mm]', fontsize=16)
        ax.set_zlabel('Z [mm]', fontsize=16)
        plt.tight_layout()
        ax.set_aspect("equal")
        plt.show()
        # fig.savefig("hole_structure.svg", format="svg", dpi=1200)

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
            ax.plot(x_values, y_values, color="royalblue")

    ax.scatter(*points.T, color="orange", zorder=10)
    ax.set_xlabel("X [mm]")
    ax.set_ylabel("Y [mm]")
    ax.set_aspect('equal', adjustable='datalim')
    plt.tight_layout()
    plt.show()