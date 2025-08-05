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
    points = np.array(points)
    if points.shape[1] == 3:
        points = points[:,:2]
    indices = Delaunay(points).simplices
    plt.triplot(points[:,0], points[:,1], indices)
    plt.plot(points[:,0], points[:,1], 'o')
    plt.show()

def plot_graph(G, engine="pyvista"):
    if engine == "matplotlib":
        import numpy as np
        import matplotlib.pyplot as plt
        from matplotlib import cm
        from matplotlib import gridspec
        # fig = plt.figure(np.random.randint(1000), figsize = (15,15))
        # ax = fig.add_subplot(111, projection='3d')
        # ax.scatter(*np.array(list(G.nodes())).T, c="orange", s=30, edgecolors='k')
        # for edge in G.edges():
        #     ax.plot([edge[0][0], edge[1][0]],[edge[0][1], edge[1][1]],[edge[0][2], edge[1][2]], c= "royalblue")
        # ax.set_xlabel("X [mm]", fontsize=16)
        # ax.set_ylabel("Y [mm]", fontsize=16)
        # ax.set_zlabel("Z [mm]", fontsize=16)
        # plt.tight_layout()
        # ax.set_aspect('equal')
        # plt.show()
        node_list = list(G.nodes)
        degrees = np.array([G.degree[n] for n in G.nodes()])
        # Crear figura 3D
        # fig = plt.figure(figsize=(15, 15))
        # ax = fig.add_subplot(111, projection='3d')
        fig = plt.figure(figsize=(12, 6))
        gs = gridspec.GridSpec(1, 3, width_ratios=[8, 0.3, 1])

        # Normalizar grados para colormap
        norm = plt.Normalize(degrees.min(), degrees.max())
        colors = cm.viridis(norm(degrees))

        # Dibujar nodos
        ax = fig.add_subplot(gs[0], projection='3d')
        for i, n in enumerate(G.nodes()):
            if len(list(G.neighbors(n))) <= 3:
                ax.scatter(
                    n[0], n[1], n[2],
                    c="red", s=30, edgecolors='k'
                )
            else:
                ax.scatter(
                        n[0], n[1], n[2],
                        c=colors[i], s=30, edgecolors='k'
                    )
        # sc = ax.scatter(
        #     node_coords[:, 0], node_coords[:, 1], node_coords[:, 2],
        #     c=colors, s=30, edgecolors='k'
        # )

        # Dibujar aristas
        for u, v in G.edges:
            x = [u[0], v[0]]
            y = [u[1], v[1]]
            z = [u[2], v[2]]
            ax.plot(x, y, z, color='gray', alpha=0.5)

        # Añadir barra de color
        sm = cm.ScalarMappable(cmap='viridis', norm=norm)
        sm.set_array([])  # requerido por matplotlib
        cbar = plt.colorbar(sm, ax=ax, fraction=0.046, pad=0.04)
        cbar.set_label('Node degree', fontsize=16)

        # Subplot 3: histograma de longitudes
        hist_ax = fig.add_subplot(gs[2])
        hist_ax.hist(degrees, bins=20, orientation='horizontal', color='gray', edgecolor='black')
        hist_ax.set_xlabel("Frequency", fontsize=16)
        hist_ax.set_ylabel("Connectivity", fontsize=16)
        hist_ax.grid(True)
        ax.set_aspect('equal')
        plt.subplots_adjust(wspace=0.05)  

        # Opcional: ocultar ejes
        # ax.set_axis_off()
        ax.set_aspect('equal')
        ax.set_xlabel('X [mm]', fontsize=16)
        ax.set_ylabel('Y [mm]', fontsize=16)
        ax.set_zlabel('Z [mm]', fontsize=16)

        plt.tight_layout()
        plt.show()

    elif engine == "pyvista":
        import pyvista as pv
        import numpy as np
        plotter = pv.Plotter(window_size=(1200, 900), lighting='three lights')

        plotter.add_points(
            np.array(G.nodes()), 
            color='orange', 
            point_size=15, 
            render_points_as_spheres=True, 
            specular_power=5
        )
        for edge in G.edges():
            base, apex = edge
            line = pv.Line(base, apex)
            plotter.add_mesh(
                line, 
                color='royalblue', 
                line_width=5, 
                smooth_shading=True
            )
        plotter.add_axes(line_width=5, labels_off=False)
        plotter.set_background('white')
        plotter.show( )

