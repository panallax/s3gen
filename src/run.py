from mesh_generation import MeshGen
from utils import extract_points_from_STL, parse_ouput_folfer, parsed_path
from utils.logger import Logger
from stl_generation import STLGen
from config import config
from glob import glob
import shutil


logger = Logger("main")

def main():
    try:

        logger.info("Starting...")
        config.validate(logger)

        output_path = parse_ouput_folfer(config.paths.STL_FILE, config.paths.OUTPUT_PATH)

        logger.log_file(output_path)
        logger.info("Ouput folder: {}".format(output_path))

        if len(glob(f"{parsed_path(config.paths.TMP_PATH)}/*.pickle")) > 0:
            logger.info("Pickle file found in tmp folder. Using precomputed mesh")
            stl = STLGen(config.mesh.INITIAL_SPHERE_RADIUS,
                        config.mesh.INITIAL_CYLINDER_RADIUS,
                        parsed_path(config.paths.TMP_PATH), 
                        output_path,
                        logger)
            
            stl.generate_stl()
            logger.finalize()
            exit(0)

        logger.info("Processing file: {}".format(config.STLFILE))
        stl_mesh, points, base_points, top_points, lateral_mesh, inner_mesh = extract_points_from_STL(config.paths.STLFILE)  
        mesh = MeshGen(stl_mesh,
                        points, 
                        base_points, 
                        top_points, 
                        lateral_mesh,
                        inner_mesh, 
                        config.mesh.PORERADIUS,
                        config.mesh.POREAREA, 
                        output_path,
                        config.paths.TMPPATH,
                        logger)

        mesh.generate_mesh()
        mesh.save_graph()
        mesh.save_adjacency_matrix()

        stl = STLGen(config.mesh.INITIAL_SPHERE_RADIUS,
                    config.mesh.INITIAL_CYLINDER_RADIUS,
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
