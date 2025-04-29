
import pickle
import networkx
import numpy as np
with open("/home/abernadi/Desktop/mesh-gen/data/output/Scaled_Cylinder_20-03-13-27/G.pickle", "rb") as f:
        G = pickle.load(f)

nodes = np.array(G.nodes())  # Lista de nodos
edges = np.array(G.edges())  # Lista de aristas

# Guardar nodos y aristas en un archivo .npz
np.savez_compressed('G_test.npz', nodes=nodes, edges=edges)