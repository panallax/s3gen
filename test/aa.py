import tetgen
import pyvista as pv
import numpy as np

def create_lattice_structure_with_tetgen(graph, filename="reticular_structure",
                                         cylinder_radius=0.05, sphere_radius=0.08, 
                                         mesh_size=0.1):
    vols = []
    
    # Generar cilindros entre los nodos de las aristas
    for u, v in graph.edges():
        pos_u = np.array(u)
        pos_v = np.array(v)
        direction = pos_v - pos_u
        center = direction/2
        height = np.linalg.norm(direction)
        # Se genera un cilindro entre los puntos u y v
        cylinder = pv.Cylinder(
            center.tolist(), direction.tolist(),
            cylinder_radius, height).triangulate()

        vols.append(cylinder)
    
    print("Cylinders created")
    to_fuse = vols[0]

    for i in range(1, len(vols)):
        print(f"Fusion {i}/{len(vols)}")
        to_fuse = to_fuse.boolean_union(vols[i]).triangulate()
        # to_fuse = to_fuse.triangulate()
    print("start meshing")
    tet = tetgen.TetGen(to_fuse)
    tet.tetrahedralize(order=1, mindihedral=20, minratio=1.5)
    grid = tet.grid
    grid.plot(show_edges=True)



if __name__ == "__main__":

    import pickle
    
    with open("/home/abernadi/Desktop/mesh-gen/data/output/Scaled_Cylinder_20-03-13-27/G.pickle", "rb") as f:

        G = pickle.load(f)

    create_lattice_structure_with_tetgen(
        G, 
        "tetrahedron_structure", 
        cylinder_radius=0.5,
        sphere_radius=0.8,
        mesh_size=0.5
    )

