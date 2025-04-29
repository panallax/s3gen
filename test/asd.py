import numpy as np
import gmsh
import os
import meshio

def create_lattice_structure_with_spheres(graph, filename="reticular_structure", 
                                         cylinder_radius=0.05, sphere_radius=0.08, 
                                         mesh_size=0.1):
    t = time.time()
    gmsh.initialize()
    gmsh.model.add(filename)

    # volumes = [(3, gmsh.model.occ.addSphere(*pos, sphere_radius))
    #                 for pos in graph.nodes()]

    volumes = []
    sph = len(volumes)
    for u, v in graph.edges():
        
        pos_u = np.array(u)
        pos_v = np.array(v)
        dir_vec = pos_v - pos_u
        cylinder_tag = gmsh.model.occ.addCylinder(
            *pos_u, 
            *dir_vec, 
            cylinder_radius
        )
        volumes.append((3, cylinder_tag))

    gmsh.model.occ.synchronize()

    print(f"Created {len(volumes)} volumes ({sph} spheres and {len(volumes) - sph} edges)")

    num_threads = os.cpu_count()

    gmsh.option.setNumber("Geometry.OCCBooleanPreserveNumbering", 0)
    gmsh.option.setNumber("Geometry.OCCBooleanSimplify", 0)
    gmsh.option.setNumber("Geometry.OCCParallel", 1)
    gmsh.option.setNumber('General.NumThreads', num_threads//2)
    gmsh.model.occ.fuse(volumes, volumes)
    gmsh.model.occ.synchronize()
    print("fuse done")

    gmsh.option.setNumber("Mesh.Algorithm3D", 10)  # HXT
    gmsh.option.setNumber("Mesh.MeshSizeMin", mesh_size / 2)
    gmsh.option.setNumber("Mesh.MeshSizeMax", mesh_size)
    #gmsh.option.setNumber("Mesh.MeshSizeFromCurvature", 10)
    #gmsh.option.setNumber("Mesh.MinimumElementsPerTwoPi", 10)

    # gmsh.fltk.run()
    
    gmsh.model.mesh.generate(3)
   
    # print("Saving files...")
    gmsh.write(f"{filename}.msh")


    print(f"Time {time.time() - t}")

    gmsh.fltk.run()
    gmsh.finalize()

    print("Process finished.")

if __name__ == "__main__":

    import pickle
    import logging
    import time
    with open("/home/abernadi/Desktop/mesh-gen/data/output/Scaled_Cylinder_20-03-13-27/G.pickle", "rb") as f:
    # with open("/home/abernadi/Desktop/mesh-gen/data/output/Cylinder_half_20-03-10-05/G.pickle", "rb") as f:
    # with open("/home/abernadi/Desktop/mesh-gen/data/output/Tube_20-03-11-25/G.pickle", "rb") as f:
    # with open("/home/abernadi/Desktop/mesh-gen/data/output/Cylinder_17-03-10-07/G.pickle", "rb") as f:
    # with open("/home/abernadi/exchange/pynite/G_4.pickle", "rb") as f:
        G = pickle.load(f)

    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
    try:
        tiempo_inicio = time.perf_counter()
        create_lattice_structure_with_spheres(
            G, 
            "tetrahedron_structure", 
            cylinder_radius=0.5,
            sphere_radius=0.8,
            mesh_size=0.5
        )
        tiempo_fin = time.perf_counter()
        tiempo_total = tiempo_fin - tiempo_inicio
        logging.info(f"Finished in {tiempo_total:.2f} seconds")

    except Exception as e:
        tiempo_fin = time.perf_counter()
        tiempo_total = tiempo_fin - tiempo_inicio
        logging.error(f"Failed at {tiempo_total:.2f} seconds. Error: {str(e)}")

