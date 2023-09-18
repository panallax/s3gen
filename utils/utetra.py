import matplotlib.pyplot as plt
import networkx as nx
import numpy as np

def update_tetrahedrons_dict(tetra_dict, points, value):
  
  if points.ndim > 1:
    return {k:{"base_points": v["base_points"], "apex": value  if (v['apex'][:2] == points).all(1).any() else v["apex"]} for k,v in tetra_dict.items()}
  
  return {k:{"base_points": v["base_points"], "apex": value  if (v['apex'][:2] == points).all().any() else v["apex"]} for k,v in tetra_dict.items()}

def print_dict(tetra_dict):

  fig = plt.figure(figsize=(15,15))
  ax = fig.add_subplot(111, projection="3d")
  ax.set_box_aspect((1,1,1))
  for elem in tetra_dict.values():
    ax.scatter(elem["base_points"][:, 0], elem["base_points"][:, 1], elem["base_points"][:,2], facecolors='none', edgecolors='black')
    ax.scatter(elem["apex"][0], elem["apex"][1], elem["apex"][2], facecolors='none', edgecolors='green')
    for i in range(3):
        plt.plot([elem["base_points"][i,0],elem["apex"][0]],[elem["base_points"][i,1],elem["apex"][1]],[elem["base_points"][i,2],elem["apex"][2]], "blue")

  plt.show()

def adjacency_matrix(points_dict):
  G = nx.Graph()
  for i in points_dict.values():
    G.add_nodes_from(list(map(tuple,np.append(i["base_points"],i["apex"][np.newaxis,:], axis= 0))))
    for j in i["base_points"]:
      G.add_edge(tuple(j),tuple(i["apex"]))

  return list(map(np.array,G.nodes())), nx.adjacency_matrix(G).todense()
