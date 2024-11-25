from mesh_generation import MeshGen
from utils import extract_points_from_STL, parse_ouput_folfer, parsed_path
from stl_generation import STLGen
import config
from glob import glob
import os
import shutil

try:
    output_path = parse_ouput_folfer(config.STLFILE, config.OUTPUTPATH)
    mesh, points, base_points, top_points, lateral_points = extract_points_from_STL(config.STLFILE)

    if len(glob(f"{parsed_path(config.TMPPATH)}/*.pickle")) > 0:
        stl = STLGen(parsed_path(config.TMPPATH), 
                        output_path)
        
        stl.generate_stl()
        exit()

    mesh = MeshGen(mesh,
                    points, 
                    base_points, 
                    top_points, 
                    lateral_points, 
                    config.PORERADIUS, 
                    output_path, 
                    config.TMPPATH)

    mesh.generate_mesh()
    mesh.save_graph()
    mesh.save_adjacency_matrix()

    stl = STLGen(output_path, 
                    output_path)

    stl.generate_stl()

except Exception as e:
    print(e)
    shutil.rmtree(output_path)