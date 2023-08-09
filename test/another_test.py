import numpy as np
np.seterr(all="ignore")
from stl import mesh
from sklearn.neighbors import NearestNeighbors
from utils import plot
import matplotlib.pyplot as plt
from scipy.spatial import Delaunay
from scipy.spatial.distance import pdist, squareform

def generate_coords_tensor(n, base_points) -> np.ndarray:

    xmin = np.min(base_points[:,0])
    xmax = np.max(base_points[:,0])
    ymin = np.min(base_points[:,1])
    ymax = np.max(base_points[:,1])
    zmin = np.max(base_points[:,2])

    x = np.linspace(xmin, xmax, n)
    y = np.linspace(ymin, ymax, n)
    z = np.linspace(zmin, zmin + (xmax-xmin), n)
    Z, X, Y = np.meshgrid(z, x, y, indexing='ij')
    
    return np.stack((X, Y, Z), axis=-1)

def check_point(apex_pos, base_points) -> None:
  
    f1 = (np.degrees(np.arccos(-(base_points[0,-1] - apex_pos[-1])/np.linalg.norm([base_points[0,0] - apex_pos[0], base_points[0,1] - apex_pos[1], base_points[0,2] - apex_pos[2]]))) - 45) + \
        (np.degrees(np.arccos(-(base_points[1,-1] - apex_pos[-1])/np.linalg.norm([base_points[1,0] - apex_pos[0], base_points[1,1] - apex_pos[1], base_points[1,2] - apex_pos[2]]))) - 45) + \
        (np.degrees(np.arccos(-(base_points[2,-1] - apex_pos[-1])/np.linalg.norm([base_points[2,0] - apex_pos[0], base_points[2,1] - apex_pos[1], base_points[2,2] - apex_pos[2]]))) - 45) 

    f2 = np.degrees(np.arccos(-(base_points[0,-1] - apex_pos[-1])/np.linalg.norm([base_points[0,0] - apex_pos[0], base_points[0,1] - apex_pos[1], base_points[0,2] - apex_pos[2]])))
    f3 = np.degrees(np.arccos(-(base_points[1,-1] - apex_pos[-1])/np.linalg.norm([base_points[1,0] - apex_pos[0], base_points[1,1] - apex_pos[1], base_points[1,2] - apex_pos[2]])))
    f4 = np.degrees(np.arccos(-(base_points[2,-1] - apex_pos[-1])/np.linalg.norm([base_points[2,0] - apex_pos[0], base_points[2,1] - apex_pos[1], base_points[2,2] - apex_pos[2]])))


    print(f1,f2,f3,f4)

def eval_objective_function(apex_pos, base_points) -> float:

    f1 = (np.degrees(np.arccos(-(base_points[0,-1] - apex_pos[-1])/np.linalg.norm([base_points[0,0] - apex_pos[0], base_points[0,1] - apex_pos[1], base_points[0,2] - apex_pos[2]]))) - 45) 
    f2 = (np.degrees(np.arccos(-(base_points[1,-1] - apex_pos[-1])/np.linalg.norm([base_points[1,0] - apex_pos[0], base_points[1,1] - apex_pos[1], base_points[1,2] - apex_pos[2]]))) - 45) 
    f3 = (np.degrees(np.arccos(-(base_points[2,-1] - apex_pos[-1])/np.linalg.norm([base_points[2,0] - apex_pos[0], base_points[2,1] - apex_pos[1], base_points[2,2] - apex_pos[2]]))) - 45) 

    angles = [f1,f2,f3]
    if np.min(angles) < 0:
        return 100

    return np.sum(angles)

def remove_short_edges(points,cp_dict, tol= 0.2):
  points = np.array(points)
  bot_points_pr = points[:,:2]
  while True:
    print(points.shape)
    x,y = np.where((squareform(pdist(bot_points_pr)) < tol) & (squareform(pdist(bot_points_pr))>0))
    unique_tuples = list({*map(tuple, map(sorted, list(zip(x,y))))})
    points_to_rm = join_paths(unique_tuples)
    print(len(unique_tuples))
    if not points_to_rm:
      break

    # tri = Delaunay(bot_points_pr)
    # plt.triplot(points[:,0], points[:,1], tri.simplices)
    # for i in range(len(points_to_rm)):
    #   plt.plot(bot_points_pr[np.array(points_to_rm[i])][:,0], bot_points_pr[np.array(points_to_rm[i])][:,1])
    # plt.show()

    new_points = np.delete(points, x, axis=0)
    for elem in points_to_rm:
      new_point =  np.mean(points[np.array(elem)], axis=0)
      new_points = np.append(new_points, [new_point], axis= 0)
      cp_dict = update_tetrahedrons_dict(cp_dict, bot_points_pr[elem,:], new_point)

    points = new_points
    bot_points_pr = new_points[:,:2]

  new_points, cp_dict = remove_small_areas(new_points, cp_dict)
  x,y = np.where((squareform(pdist(bot_points_pr)) < tol) & (squareform(pdist(bot_points_pr))>0))
  points_to_rm = list({*map(tuple, map(sorted, list(zip(x,y))))})
  print(points_to_rm)
  if points_to_rm:
    new_points, cp_dict = remove_short_edges(new_points, cp_dict)

  return  new_points, cp_dict

def remove_small_areas(rm_points, cp_dict, tol= 0.05):
  rm_points = np.array(rm_points)
  rm_points_pr = rm_points[:,:2]
  tri2 = Delaunay(rm_points_pr)
  # plt.triplot(rm_points_pr[:,0], rm_points_pr[:,1], tri2.simplices)
  new_points = np.copy(rm_points)
  new_points_pr = new_points[:,:2]

  for a in rm_points_pr[tri2.simplices]:
    area = 0.5*np.abs(np.cross(a[0]-a[1],a[2]-a[1]))
    if area < tol:
      apex = a[np.argmin(np.linalg.norm(a, axis=1))]
      index = np.argwhere(np.all(new_points_pr == apex, axis =1))
      vertex = np.argwhere(np.isclose(tri2.points,apex))[0][0]
      # plt.plot(a[:,0], a[:,1])
      # plt.scatter(apex[0],apex[1],c='black')
      neighbors = get_simplices(tri2,vertex)
      # print(neighbors)
      bari = np.mean(rm_points[neighbors], axis=0)
      new_points[index] = bari
      cp_dict = update_tetrahedrons_dict(cp_dict, apex, bari)
      # plt.scatter(bari[0], bari[1], c ='black')
      # plt.plot(rm_points_pr[neighbors,0], rm_points_pr[neighbors,1], 'or')
      # plt.plot(rm_points_pr[vertex,0], rm_points_pr[vertex,1], 'ob')
  # new_points = np.unique(np.vstack(list(map(lambda sub_dict: sub_dict["apex"], cp_dict.values()))), axis= 0)


  return new_points, cp_dict
  # return new_points, cp_dict


def get_simplices(self, vertex):
    "Find all simplices this `vertex` belongs to"
    visited = set()
    queue = [self.vertex_to_simplex[vertex]]
    while queue:
        simplex = queue.pop()
        # print(self.simplices[simplex])
        for i, s in enumerate(self.neighbors[simplex]):
            if self.simplices[simplex][i] != vertex and s != -1 and s not in visited:
                queue.append(s)
        visited.add(simplex)
    return np.unique(self.simplices[np.array(list(visited))].reshape(-1))

# vertex = 30
# neighbors = get_simplices(dea,vertex)
# print(neighbors)

# points = bot_points_pr
# tri = dea
# plt.triplot(points[:,0], points[:,1], tri.simplices)
# plt.plot(points[neighbors,0], points[neighbors,1], 'or')
# plt.plot(points[vertex,0], points[vertex,1], 'ob')
# plt.show()


def update_tetrahedrons_dict(tetra_dict, points, value):
  if points.ndim > 1:
    return {k:{"base_points": v["base_points"], "apex": value  if (v['apex'][:2] == points).all(1).any() else v["apex"]} for k,v in tetra_dict.items()}
  
  return {k:{"base_points": v["base_points"], "apex": value  if (v['apex'][:2] == points).all().any() else v["apex"]} for k,v in tetra_dict.items()}

def print_dict(tetra_dict):

  fig = plt.figure(figsize=(15,15))
  ax = fig.add_subplot(111, projection="3d")
  for elem in tetra_dict.values():
    ax.scatter(elem["base_points"][:, 0], elem["base_points"][:, 1], elem["base_points"][:,2], facecolors='none', edgecolors='black')
    ax.scatter(elem["apex"][0], elem["apex"][1], elem["apex"][2], facecolors='none', edgecolors='green')
    for i in range(3):
        plt.plot([elem["base_points"][i,0],elem["apex"][0]],[elem["base_points"][i,1],elem["apex"][1]],[elem["base_points"][i,2],elem["apex"][2]], "blue")

  plt.show()


def join_paths(list_of_tuples):
    value_group = {}
    groups = []

    for tuple_ in list_of_tuples:
        values = set(tuple_)
        current_groups = [value_group.get(value) for value in values]
        current_groups = [group for group in current_groups if group is not None]

        if not current_groups:
            new_group = set(values)
            groups.append(new_group)
            for value in new_group:
                value_group[value] = new_group
        else:
            union_group = set().union(*current_groups)
            for group in current_groups:
                if group in groups:
                    groups.remove(group)
            union_group.update(values)
            groups.append(union_group)
            for value in union_group:
                value_group[value] = union_group

    grouped_list = [tuple(group) for group in groups]
    return grouped_list

m = mesh.Mesh.from_file('/home/alex/Desktop/mesh-gen/data/Cilindro.stl')
points = np.unique(m.points.reshape([-1,3]), axis=0)
bot_points = points[np.where(points[:,-1] < np.min(points[:,-1]) + 0.1)]
top_points = points[np.where(points[:,-1] > np.max(points[:,-1]) - 0.1)]


fig = plt.figure(figsize=(15,15))
ax = fig.add_subplot(111, projection="3d")


bot_points = points[np.where(points[:,-1] < np.min(points[:,-1]) + 0.1)]
top_points = points[np.where(points[:,-1] > np.max(points[:,-1]) - 0.1)]


tetrahedrons = {}
reached_top = False
iteration = 0
while not reached_top:
# ax.scatter3D(*bot_points.T)

# print(indices.shape)
# print(indices)
# plt.triplot(bot_points_pr[:,0], bot_points_pr[:,1], indices)
# plt.plot(bot_points_pr[:,0], bot_points_pr[:,1], 'o')
# plt.show()

# for _ in range(2):
  puntos_optimos = []
  bot_points_pr = bot_points[:,:2]
  indices = Delaunay(bot_points_pr).simplices
  for i,indice in enumerate(indices):
      # Obtain the base points from triangulation
      base_points = bot_points[indice]
      # Generate a tensor of coordinates
      tensor_coordenadas = generate_coords_tensor(20, base_points)
      # Evaluate the objective function in the tensor of coordinates
      valores_funcion = np.apply_along_axis(eval_objective_function, axis=3, arr=tensor_coordenadas, base_points=base_points)
      # Asign the value 100 to the NaN values
      valores_funcion[np.isnan(valores_funcion)] = 100
      # Finded the minimum index of the objective function
      indice_minimo = np.argmin(np.abs(valores_funcion))
      # Obtain the coordinates of the minimum index
      indice_minimo_3d = np.unravel_index(indice_minimo, valores_funcion.shape)
      # Obtain the coordinates of the optimal point
      punto_optimo = tensor_coordenadas[indice_minimo_3d]
      if punto_optimo[-1] >= np.max(points[:,-1]):
          reached_top = True
      else:
          # Add the optimal point to the list of optimal points if it is inside the volume
          puntos_optimos.append(punto_optimo)
          tetrahedrons[str(iteration) + str(i)] = {"base_points": base_points, "apex": punto_optimo}

      # print(punto_optimo)
      # check_point(punto_optimo, base_points)

  # final_points, cleaned_dict = remove_small_areas(puntos_optimos, tetrahedrons)
  new_points, new_dict = remove_short_edges(puntos_optimos, tetrahedrons, 0.2)
  # final_points, cleaned_dict = remove_small_areas(new_points, cropped_dict)
  print_dict(new_dict)
  print(np.array(puntos_optimos).shape)
  print(new_points.shape)
  print("altura: ", np.max(np.max(new_points[:,-1])))
  bot_points = np.array(new_points); del new_points
  tetrahedrons = new_dict; del new_dict
  iteration += 1

print_dict(tetrahedrons)


# plot(base_points, [base_points[indices[0][0]], base_points[indices[0][1]], base_points[indices[0][3]]])