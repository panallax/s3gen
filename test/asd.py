import pymesh
import pickle
import numpy as np
import networkx as nx
import matplotlib.pyplot as plt

with open("/home/alex/Downloads/one_layer/G.pickle", "rb") as f:
  G = pickle.load(f)

node = list(G)[0]
neig = [x for x in list(G.neighbors(node)) if x[2] > node[2]]

n = pymesh.generate_icosphere(0.55, node)

for i in neig:
  print(i)
  m = pymesh.generate_cylinder(node, i, 0.55,0.55)
  v = pymesh.boolean(n, m, operation="intersection").vertices
  fig = plt.figure()
  ax = fig.add_subplot(111, projection='3d')
  ax.scatter(v[:, 0], v[:, 1], v[:, 2])
  print(node, max(v, key=lambda x: x[2]))
  plt.show()