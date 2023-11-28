import argparse
from mesh_generation import MeshGen
from utils import extract_points_from_STL
parser = argparse.ArgumentParser(description="Mesh generation",
                                 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument("-p", "--path", help="Path for the data", default= "../data/Cilindro.stl")
parser.add_argument("-r", "--radius", help="Pore radius", default= 0.5)
parser.add_argument("-o", "--output", help="Destination path for the data", default="../data/output")


args = parser.parse_args()
path = vars(args)["path"]
output = vars(args)["output"]
radius = float(vars(args)["radius"])

points = extract_points_from_STL(path)
mesh = MeshGen(points, radius, output)
mesh.generate_mesh()

if bool(output):
    mesh.save_graph()
    mesh.save_adjacency_matrix()
