import argparse
from mesh_generation import MeshGen
from utils import extract_points_from_STL
parser = argparse.ArgumentParser(description="Mesh generation",
                                 formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument("-p", "--path", help="Path for the data", default= "../data/Cilindro.stl")
parser.add_argument("-it", "--iterations", help="Number of iterations")
parser.add_argument("-o", "--output", help="Destination path for the data", default="../data/output")


args = parser.parse_args()
path = vars(args)["path"]
iterations = vars(args)["iterations"]
output = vars(args)["output"]

points = extract_points_from_STL(path)
mesh = MeshGen(points,output, iterations)
mesh.generate_mesh()

if bool(output):
    mesh.save_adjacency_matrix()
    mesh.save_data()
