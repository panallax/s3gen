from mesh_generation import MeshGen
from utils import extract_points_from_STL, parse_ouput_folfer, parsed_path, Logger
from stl_generation import STLGen
import config
from glob import glob
import shutil


logger = Logger("main")
logger.show_logs_in_console = config.SHOW_LOGS_IN_CONSOLE

def main():
    try:

        logger.info("Starting...")
        output_path = parse_ouput_folfer(config.STLFILE, config.OUTPUTPATH)

        logger.log_file(output_path)
        logger.info("Ouput folder: {}".format(output_path))

        if len(glob(f"{parsed_path(config.TMPPATH)}/*.pickle")) > 0:
            logger.info("Pickle file found in tmp folder. Using precomputed mesh")
            stl = STLGen(config.INITIAL_SPHERE_RADIUS,
                        config.INITIAL_CYLINDER_RADIUS,
                        parsed_path(config.TMPPATH), 
                        output_path,
                        logger)
            
            stl.generate_stl()
            logger.finalize()
            exit(0)

        logger.info("Processing file: {}".format(config.STLFILE))
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
                        config.TMPPATH,
                        logger)

        mesh.generate_mesh()
        mesh.save_graph()
        mesh.save_adjacency_matrix()

        stl = STLGen(config.INITIAL_SPHERE_RADIUS,
                    config.INITIAL_CYLINDER_RADIUS,
                    output_path, 
                    output_path,
                    logger)

        stl.generate_stl()
        logger.finalize()

    except Exception as e:
        logger.error(e)
        shutil.rmtree(output_path)

if __name__ == "__main__":
    main()
