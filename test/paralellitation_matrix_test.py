import numpy as np
import networkx as nx
from scipy.spatial.distance import cdist
from multiprocessing import Pool
def calculate_segments_dist(s1,s2):
  ls1 = np.linspace(s1[0], s1[1], 20)
  ls2 = np.linspace(s2[0], s2[1], 20)

  return np.min(cdist(ls1, ls2))

def calculate_neighbors_in_node(G, node):
  node = tuple(node)
  return (len(list(nx.neighbors(G, node))))

def matrix_colision(i, s):
  row = np.empty(n)
  s1 = np.array(s[i])
  for j in range(n):
    s2 = np.array(s[j])
    row[j] = calculate_segments_dist(s1,s2) if len(np.unique(np.append(s1,s2, axis=0), axis= 0)) == 4 else -1
  return i, row


connections = {} #Fill with connections dict

G = nx.Graph()
for j,value in enumerate(connections.values()):
    tuples_points = list(map(tuple,[value['point']] + list(value.get('connections', {}).values()) + list(value.get('connections_below', {}).values())))
    G.add_nodes_from(list(map(tuple,tuples_points)))
    for i in range(1,len(tuples_points)):
      G.add_edge(tuples_points[0], tuples_points[i])

s = list(G.edges())
print(len(s))
n = len(s)
matrix = np.empty((n, n))

with Pool() as pool:
  result = pool.starmap(matrix_colision, ((i,s) for i in range(n)))

for j,dist in result:
  matrix[j,:] = dist


sg1, sg2 = np.where((matrix ==0) & (matrix <=0.1))
close_segments = set(list(map(lambda x: tuple(sorted(x)),list(zip(sg1,sg2)))))
for s1,s2 in close_segments:
  nodes = np.append(np.array(s[s1]),np.array(s[s2]), axis=0)
  nbr_node = list(map(lambda x: calculate_neighbors_in_node(G,x), nodes))
  try:
    if min(nbr_node[:2]) > min(nbr_node[2:]):
      G.remove_edge(s[s1][0], s[s1][1])
    else:
      G.remove_edge(s[s2][0], s[s2][1])
  except:
    continue