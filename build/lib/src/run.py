from mesh_generation import MeshGen
from utils import extract_points_from_STL, parse_ouput_folfer, parsed_path
from stl_generation import STLGen
import config
from glob import glob
import shutil

def main():
    try:
        output_path = parse_ouput_folfer(config.STLFILE, config.OUTPUTPATH)
        if len(glob(f"{parsed_path(config.TMPPATH)}/*.pickle")) > 0:
            print("Using precomputed mesh")
            stl = STLGen(config.INITIAL_SPHERE_RADIUS,
                        config.INITIAL_CYLINDER_RADIUS,
                        parsed_path(config.TMPPATH), 
                        output_path)
            
            stl.generate_stl()
            print("Finished!")
            exit(0)

        mesh, points, base_points, top_points, lateral_mesh, inner_mesh = extract_points_from_STL(config.STLFILE)  
        mesh = MeshGen(mesh,
                        points, 
                        base_points, 
                        top_points, 
                        lateral_mesh,
                        inner_mesh, 
                        config.PORERADIUS,
                        config.POREAREA, 
                        output_path,
                        config.TMPPATH)

        mesh.generate_mesh()
        mesh.save_graph()
        mesh.save_adjacency_matrix()

        stl = STLGen(config.INITIAL_SPHERE_RADIUS,
                    config.INITIAL_CYLINDER_RADIUS,
                    output_path, 
                    output_path)

        stl.generate_stl()

    except Exception as e:
        print(e)
        shutil.rmtree(output_path)

if __name__ == "__main__":
    print("Starting...")
    main()
    print("Finished")