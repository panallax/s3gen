import numpy as np
from scipy.spatial.distance import pdist, squareform
from scipy.spatial import Delaunay
from utils.upoly import update_polyhedrons_dict

def generate_coords_tensor(n, base_points) -> np.ndarray:

    """Generates a 3D tensor of coordinates from a set of base points.
    
    Args:
        n (int): Number of points in each dimension.
        base_points (np.ndarray): Array of base points.
        
    Returns:
        np.ndarray: 3D tensor of coordinates."""

    # xmin = np.min(base_points[:,0])
    # xmax = np.max(base_points[:,0])
    # ymin = np.min(base_points[:,1])
    # ymax = np.max(base_points[:,1])
    # zmin = np.max(base_points[:,2])

    # x = np.linspace(xmin, xmax, n)
    # y = np.linspace(ymin, ymax, n)
    # z = np.linspace(zmin, zmin + (xmax-xmin), n)
    # Z, X, Y = np.meshgrid(z, x, y, indexing='ij')
    
    # return np.stack((X, Y, Z), axis=-1)

    altura = np.linalg.norm(base_points[0] - base_points[1])
    # Generar coordenadas bariocéntricas aleatorias para el plano base
    r1 = np.sqrt(np.random.uniform(0, 1, n))
    r2 = np.random.uniform(0, 1, n)
    alpha = 1 - r1
    beta = (1 - r2) * r1
    gamma = r2 * r1

    # Generar alturas aleatorias dentro del prisma
    alturas_aleatorias = np.random.uniform(0, altura, n)
    # Calcular las coordenadas cartesianas de los puntos dentro del prisma de manera vectorizada
    puntos_base = alpha[:, np.newaxis] * base_points[0] + beta[:, np.newaxis] * base_points[1] + gamma[:, np.newaxis] * base_points[2] 

    # Combinar el punto en el plano base con la altura en la dirección Z
    puntos_generados = puntos_base + np.column_stack((np.zeros(n), np.zeros(n), alturas_aleatorias))

    return puntos_generados


def eval_objective_function(apex_pos, base_points) -> float:
    "Not used"
    """Evaluates the objective function. The objective function is the sum of the angles between the apex and the base points."""

    f1 = (np.degrees(np.arccos(-(base_points[0,-1] - apex_pos[-1])/np.linalg.norm([base_points[0,0] - apex_pos[0], base_points[0,1] - apex_pos[1], base_points[0,2] - apex_pos[2]]))) - 45) 
    f2 = (np.degrees(np.arccos(-(base_points[1,-1] - apex_pos[-1])/np.linalg.norm([base_points[1,0] - apex_pos[0], base_points[1,1] - apex_pos[1], base_points[1,2] - apex_pos[2]]))) - 45) 
    f3 = (np.degrees(np.arccos(-(base_points[2,-1] - apex_pos[-1])/np.linalg.norm([base_points[2,0] - apex_pos[0], base_points[2,1] - apex_pos[1], base_points[2,2] - apex_pos[2]]))) - 45) 

    angles = [f1,f2,f3]
    if np.min(angles) < 0:
        return 100

    return np.sum(angles)


def remove_short_edges(points,cp_dict, tol= 0.2):
  "Not used"
  """Remove short edges from the triangulation"""
  tol = 0.15
  points = np.array(points)
  bot_points_pr = points[:,:2]
  while True:
    x,y = np.where((squareform(pdist(bot_points_pr)) < tol) & (squareform(pdist(bot_points_pr))>0))
    unique_tuples = list({*map(tuple, map(sorted, list(zip(x,y))))})
    points_to_rm = join_paths(unique_tuples)
    if not points_to_rm:
      break

    # tri = Delaunay(bot_points_pr)
    # plt.triplot(points[:,0], points[:,1], tri.simplices)
    # for i in range(len(points_to_rm)):
    #   plt.plot(bot_points_pr[np.array(points_to_rm[i])][:,0], bot_points_pr[np.array(points_to_rm[i])][:,1])
    # plt.show()

    import matplotlib.pyplot as plt
    from mpl_toolkits.axes_grid1.inset_locator import inset_axes, mark_inset
    pts = []
    new_points = np.delete(points, x, axis=0)
    for elem in points_to_rm:
      new_point =  np.mean(points[np.array(elem)], axis=0)
      pts.append(new_point)
      new_points = np.append(new_points, [new_point], axis= 0)
      cp_dict = update_polyhedrons_dict(cp_dict, bot_points_pr[elem,:], new_point)


    points = new_points
    bot_points_pr = new_points[:,:2]

    # fig, ax = plt.subplots(figsize=(10, 10))
    # ax.set_xlim(-1.7,2.5)
    # ax.set_ylim(-1.7,2.5)
    # ax.set_xlabel("X [mm]")
    # ax.set_ylabel("Y [mm]")
    # ax.scatter(*np.array(pts)[:,:2].T, c = "black", zorder= 10)
    # tri = Delaunay(bot_points_pr)
    # ax.triplot(points[:,0], points[:,1], tri.simplices, linestyle= "dotted", c = "cornflowerblue")
    # for i in range(len(unique_tuples)):
    #   plt.plot(bot_points_pr[np.array(unique_tuples[i])][:,0], bot_points_pr[np.array(unique_tuples[i])][:,1], c= "red")
      
    # points_ = new_points
    # bot_points_pr_ = new_points[:,:2]


    # tri_ = Delaunay(bot_points_pr_)
    # ax.triplot(points_[:,0], points_[:,1], tri_.simplices, c = "green")

    # ax_inset = inset_axes(ax, width="30%", height="30%", loc='upper right')  # Ajusta el tamaño y posición del zoom
    # ax_inset.scatter(*np.array(pts)[:,:2].T, c="black", zorder=10)
    # ax_inset.triplot(points[:,0], points[:,1], tri.simplices, linestyle="dotted", c="cornflowerblue")

    # for j in range(len(unique_tuples)):
    #     ax_inset.plot(bot_points_pr[np.array(unique_tuples[j])][:,0], bot_points_pr[np.array(unique_tuples[j])][:,1], c="red")

    # ax_inset.triplot(points_[:,0], points_[:,1], tri_.simplices, c = "green")
    # # Definir los límites para el zoom en el inset
    # ax_inset.set_xlim(-0.55, -0.15)  # Ajusta estos valores según la región que quieres ampliar
    # ax_inset.set_ylim(1.1,1.4)

    # # Opcional: eliminar ticks del inset
    # ax_inset.set_xticks([])
    # ax_inset.set_yticks([])

    # # Conectar la zona de zoom con el gráfico principal
    # mark_inset(ax, ax_inset, loc1=2, loc2=4, fc="none", ec="0.5")

    # # Mostrar el gráfico
    # plt.show()
    # break

  new_points, cp_dict = remove_small_areas(new_points, cp_dict)
  x,y = np.where((squareform(pdist(bot_points_pr)) < tol) & (squareform(pdist(bot_points_pr))>0))
  points_to_rm = list({*map(tuple, map(sorted, list(zip(x,y))))})

  if points_to_rm:
    new_points, cp_dict = remove_short_edges(new_points, cp_dict)

  return  new_points, cp_dict

def remove_small_areas(rm_points, cp_dict, tol= 0.05):
  "Not used"
  """Remove small areas from the triangulation. The small areas are defined by 
    the area of the triangle formed by the points of the triangulation."""
  
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
      bari = np.mean(rm_points[neighbors], axis=0)
      new_points[index] = bari
      cp_dict = update_polyhedrons_dict(cp_dict, apex, bari)
      # plt.scatter(bari[0], bari[1], c ='black')
      # plt.plot(rm_points_pr[neighbors,0], rm_points_pr[neighbors,1], 'or')
      # plt.plot(rm_points_pr[vertex,0], rm_points_pr[vertex,1], 'ob')
  # new_points = np.unique(np.vstack(list(map(lambda sub_dict: sub_dict["apex"], cp_dict.values()))), axis= 0)


  return new_points, cp_dict

def get_simplices(self, vertex):
    "Not used"
    "Find all simplices this `vertex` belongs to"
    visited = set()
    queue = [self.vertex_to_simplex[vertex]]
    while queue:
        simplex = queue.pop()
        for i, s in enumerate(self.neighbors[simplex]):
            if self.simplices[simplex][i] != vertex and s != -1 and s not in visited:
                queue.append(s)
        visited.add(simplex)
    return np.unique(self.simplices[np.array(list(visited))].reshape(-1))

def join_paths(list_of_tuples):
    """Joins paths in a list of tuples.
    
    Arguments:
        list_of_tuples {list} -- List of tuples
        
        Returns:
        
        list -- List of tuples with joined paths
    """

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

