from mesh_generation import MeshGen
from utils import extract_points_from_STL, parse_ouput_folfer, parsed_path
from stl_generation import STLGen
from config import config, Logger
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

        # if len(glob(f"{parsed_path(config.paths.TMP_PATH)}/*.pickle")) > 0:
        #     logger.info("Pickle file found in tmp folder. Using precomputed mesh")
        #     stl = STLGen(parsed_path(config.paths.TMP_PATH), 
        #                 config.mesh.SECTION_THICKNESS,
        #                 config.mesh.N_SIDES,
        #                 output_path,
        #                 logger)
            
        #     stl.graph_to_mesh(config.mesh.MESH_SUBDIVISION_LOOPS)
        #     logger.finalize()
        #     exit(0)

        logger.info("Processing file: {}".format(config.paths.STL_FILE))
        stl_mesh, points, base_points, top_points, lateral_mesh, inner_mesh = extract_points_from_STL(config.paths.STL_FILE)  
        mesh = MeshGen(stl_mesh,
                        points, 
                        base_points, 
                        top_points, 
                        lateral_mesh,
                        inner_mesh, 
                        config.mesh.PORE_RADIUS,
                        config.mesh.PORE_AREA,
                        config.mesh.BOLTS,
                        output_path,
                        config.paths.TMP_PATH,
                        logger)

        mesh.generate_mesh()
        # mesh.save_graph()

        # stl = STLGen(output_path, 
        #             config.mesh.SECTION_THICKNESS,
        #             config.mesh.N_SIDES,
        #             output_path,
        #             logger)

        # stl.graph_to_mesh(config.mesh.MESH_SUBDIVISION_LOOPS)
        logger.finalize()

    except Exception as e:
        import traceback
        logger.error(e)
        shutil.rmtree(output_path, ignore_errors= True)

if __name__ == "__main__":
    main()
