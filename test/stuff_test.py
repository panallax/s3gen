import numpy as np
import matplotlib.pyplot as plt
import trimesh
import triangle
from shapely.geometry import *
import shapely
import trimesh
import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
# def angle(ref, points):
#     """
#     Calculate the angle between the vector defined by the reference point and
#     the set of points and the horizontal plane.

#     Arguments:
#         ref {np.ndarray} -- Reference point
#         points {np.ndarray} -- Array of points

#     Returns:
#         np.ndarray -- Array of angles
#     """

#     vecs = points - ref
#     return np.degrees(np.arctan2(vecs[:, 2], np.sqrt(vecs[:, 0]**2 + vecs[:, 1]**2)))


# def get_growth_vect(mesh, point, z_2):
#   center_1, len_1 = section_props(mesh, point[-1])
#   center_2, len_2 = section_props(mesh, z_2)
#   delta = center_2 - center_1
#   k = len_2/len_1
#   projection = point*k + delta
#   growth_vect = projection - point

#   return growth_vect

# def polar_angle_sort(point, ref_point):
#   """
#   Calculate the polar angle of a point with respect to a reference point

#   Arguments:
#       point {np.ndarray} -- Point
#       ref_point {np.ndarray} -- Reference point

#   Returns:
#       float -- Polar angle
#   """
#   x, y = point[0] - ref_point[0], point[1] - ref_point[1]
#   return np.arctan2(y, x)

# def section_props(mesh, z):
#   section = mesh.section(np.array([0,0,1]), np.array([0,0,z]))

#   return section.centroid, section.length

# def area_polygon(points):
#   """
#   Calculate the area of a polygon using the Shoelace formula.

#   Arguments:
#       points {np.ndarray} -- Array of points

#   Returns:
#       float -- Area of the polygon
#   """

#   center = np.mean(points, axis=0)
#   sorted_points = sorted(points, key=lambda p: polar_angle_sort(p, center))
#   # Aplicar la fórmula de Shoelace
#   area = 0.5 * np.linalg.norm(sum(np.cross(x1,x2) for (x1,x2) in zip(sorted_points, 
#                                                                      np.vstack((sorted_points[1:],[sorted_points[0]])))))
  
#   return area


# def sort_simplices(simplices, idx_simplices, points):
#   """
#   Sort the simplices by the polar angle of the points and calculate the area of 
#   the simplices.

#   Arguments:
#       simplices {np.ndarray} -- Array of simplices
#       idx_simplices {np.ndarray} -- Array of indices of the simplices
#       points {np.ndarray} -- Array of points

#   Returns:
#       list -- List of areas
#       list -- List of sorted simplices
#   """

#   areas = list(map(lambda x: area_polygon(x), simplices))
#   sorted_simplices = np.array(list(map(lambda s: sorted(s, key=lambda x : polar_angle_sort(points[x],np.mean(points[s], axis=0))), idx_simplices)))
#   return areas, sorted_simplices

# def split_sections(pts, hole):

#   norms = np.linalg.norm(pts - np.array(hole), axis= 1)
#   groups = KMeans(2).fit(norms.reshape(-1,1))
#   g1 = np.where(groups.labels_ == 0)[0]
#   g2 = np.where(groups.labels_ == 1)[0]

#   return pts[g1], g1, pts[g2], g2

# def segmentate(points, idx):
#   sort = sorted(idx, key= lambda x: polar_angle_sort(points[x], np.mean(points[idx], axis=0)))
#   return [[sort[i],sort[(i+1) % len(sort)]] for i in range(len(sort))]

# s = trimesh.load("/home/alex/Desktop/mesh-gen/data/Tube.stl")
# c = s.section(np.array([0,0,1]), np.array([0,0,0])).to_planar()[0].polygons_closed

# e = c[0].simplify(0.5).exterior
# i = c[1].simplify(0.5).exterior
# pts = np.unique(np.vstack((e.coords, i.coords)), axis=0)

# L = 5
# hole = [0,0]
# pore_area = L**2*np.sqrt(3)/4 #mm^2

# sections = s.section(plane_normal= np.array([0,0,1]), plane_origin = np.array([0,0,0])).to_planar()[0].polygons_closed
# section1 = sections[0].simplify(L/10).exterior.coords
# section2 = sections[1].simplify(L/10).exterior.coords

# section_points = np.unique(np.vstack((section1, section2)), axis= 0)
# sec_1, sec_1_idx, sec_2, sec_2_idx = split_sections(section_points, hole)
# # print(sec_1, sec_1_idx, sec_2, sec_2_idx)
# segments = np.vstack((segmentate(section_points, sec_2_idx ),segmentate(section_points, sec_1_idx)))
# current_area = 0
# min_val = 0.1
# max_val = 20

# while not np.isclose(current_area, pore_area, atol = 0.2):
#   current_val = (min_val + max_val)/2
#   opt = f"pqa{current_val}"
#   t = triangle.triangulate({"vertices": section_points, "segments": segments, "holes": [hole]}, opt)
#   triang_points = np.array(t["vertices"].tolist())
#   simplices = np.array(t["triangles"].tolist())
#   current_area =  np.mean([area_polygon(triang_points[x]) for x in sort_simplices(triang_points[simplices], simplices, triang_points)[1]])
#   if current_area < pore_area:
#       min_val = current_val
#   else:
#       max_val = current_val

# triang_points_3d = np.c_[triang_points, np.zeros(triang_points.shape[0])]

# plt.triplot(triang_points[:,0], triang_points[:,1], simplices)
# plt.plot(triang_points[:,0], triang_points[:,1], 'o')
# plt.show()

from utils import extract_points_from_STL, check_connection
import config
import numpy as np
import matplotlib.pyplot as plt
import networkx as nx

# def caracteristic_distsance(points):
#     kd_tree = cKDTree(points)
#     total_dist = 0.0
#     for point in points:
#         dist,_ = kd_tree.query(point, k=2)
#         total_dist += dist[1]  # Ignorar la distancia a sí mismo

#     return total_dist / len(points)
# mesh, points, base_points, top_points, lateral = extract_points_from_STL(config.STLFILE)

# kd_tree = KDTree(lateral)
# d = caracteristic_distsance(lateral)
# g = nx.Graph()
# g.add_nodes_from(list(map(tuple, lateral)))
# for point in lateral:
#     a = np.array(kd_tree.query_ball_point(point, 2*d))
#     points_above =  lateral[a[np.where(lateral[a][:,-1] > point[-1])]]
#     for i in points_above:
#         if check_connection(g, point, i, d):
#             g.add_edge(tuple(point), tuple(i))


# fig = plt.figure(figsize=(15,15))
# ax = fig.add_subplot( projection="3d")
# ax.scatter(*np.array(list(g.nodes())).T, c="tab:orange", s=5)
# for e in g.edges():
#   ax.plot(*[[e[0][0],e[1][0]],[e[0][1],e[1][1]],[e[0][2],e[1][2]]], color="tab:blue")

# ax.set_xlabel("X [mm]", fontsize=16)
# ax.set_ylabel("Y [mm]", fontsize=16)
# ax.set_zlabel("Z [mm]", fontsize=16)
# plt.tight_layout()
# plt.show()
# fig.savefig("shell.svg", format="svg", dpi=1200)



# import numpy as np
# np.seterr(all="ignore")
# from utils import in_volume, extract_points_from_STL, \
#                   exclude_points, generate_coords_tensor, eval_objective_function,\
#                   remove_short_edges, print_dict, adjacency_matrix, caracteristic_distsance, \
#                   plot_Dealunay, update_polyhedrons_dict, min_dist
# from scipy.spatial import Delaunay, ConvexHull
# from scipy.spatial import cKDTree



# bot_points_1 = np.load("points1.npy")
# bot_points_2 = np.load("points2.npy")

# def triang(bot_points):

#     optimal_points = []
#     bot_points_pr = bot_points[:,:2]
#     indices = Delaunay(bot_points_pr).simplices
#     print(len(indices))
#     # plot_Dealunay(bot_points_pr)
#     for i,indice in enumerate(indices):
#         # Obtain the base points from triangulation
#         base_points = bot_points[indice]
#         # Generate a tensor of coordinates
#         # tensor_coords = generate_coords_tensor(20, base_points)
#         tensor_coords = generate_coords_tensor(1000, base_points)

#         # Evaluate the objective function in the tensor of coordinates
#         # function_values = np.apply_along_axis(eval_objective_function, axis=3, arr=tensor_coords, base_points=base_points)
#         function_values = np.apply_along_axis(eval_objective_function, axis=1, arr=tensor_coords, base_points=base_points)
#         # Asign the value 100 to the NaN values
#         function_values[np.isnan(function_values)] = 100
#         # Finded the minimum index of the objective function
#         minimum_index = np.argmin(np.abs(function_values))
#         # Obtain the coordinates of the minimum index
#         minimum_index_3d = np.unravel_index(minimum_index, function_values.shape)
#         # Obtain the coordinates of the optimal point
#         optimal_point = tensor_coords[minimum_index_3d]
#         optimal_points.append(optimal_point)
#     return np.array(optimal_points)

# def are(points):
#     p = np.array(points)
#     tri = Delaunay(p[:,:2])
#     return [0.5*np.linalg.norm(np.cross(a[0]-a[1],a[2]-a[1])) for a in points[tri.simplices]]

# opt1 = triang(bot_points_1)
# opt2 = triang(bot_points_2)
# ar1 = are(bot_points_1)
# ar2 = are(bot_points_2)

# tri1 = Delaunay(bot_points_1)
# tri2 = Delaunay(bot_points_2)
# import matplotlib 
# matplotlib.rcParams.update({'font.size': 16})
# matplotlib.rcParams['mathtext.fontset'] = 'custom'
# matplotlib.rcParams['mathtext.rm'] = 'Bitstream Vera Sans'
# matplotlib.rcParams['mathtext.it'] = 'Bitstream Vera Sans:italic'
# matplotlib.rcParams['mathtext.bf'] = 'Bitstream Vera Sans:bold'
# fig, ax = plt.subplots(1,2,figsize=(15,10))
# # ax = fig.add_subplot(1, 1, 1, projection='3d')
# ax[0].hist(opt1[:,2], bins=20, histtype='bar', color = "blue", alpha = 0.5)
# ax[0].axvline(opt1[:,2].mean(), color='c', linestyle='dashed', linewidth=1)
# ax[0].hist(opt2[:,2], bins=20, histtype='bar', color = "orange", alpha = 0.8)
# ax[0].axvline(opt2[:,2].mean(), color='r', linestyle='dashed', linewidth=1)
# ax[0].set_title("Heights distribution")
# ax[0].set_xlabel("Z [$mm$]")

# ax[1].hist(ar1, bins=20, histtype='bar', color = "blue", alpha = 0.5)
# ax[1].axvline(np.mean(ar1), color='c', linestyle='dashed', linewidth=1)
# ax[1].hist(ar2, bins=20, histtype='bar', color = "orange", alpha = 0.8)
# ax[1].axvline(np.mean(ar2), color='r', linestyle='dashed', linewidth=1)
# ax[1].set_title("Areas distribution")
# ax[1].set_xlabel("Area [$mm^2$]")
# plt.tight_layout()
# plt.show()
# ax.scatter(opt1[:,0], opt1[:,1], opt1[:,2], c = "blue")
# ax.scatter(opt2[:,0], opt2[:,1], opt2[:,2], c = "red")
# plt.show()
# p = np.array(optimal_points)
# tri = Delaunay(p)
# tri2 = Delaunay(bot_points[:,:2])
# fig = plt.figure(figsize=(10,10))
# ax = fig.add_subplot(1, 1, 1, projection='3d')

# The triangles in parameter space determine which x, y, z points are
# connected by an edge  
#ax.plot_trisurf(x, y, z, triangles=tri.triangles, cmap=plt.cm.Spectral)
# ax.plot_trisurf(p[:,0], p[:,1], p[:,2], triangles=tri.simplices, cmap=plt.cm.Spectral)

# ax.triplot(bot_points[:,:2][:,0], bot_points[:,:2][:,1], tri2.simplices, c="royalblue")
# ax.scatter(bot_points[:,:2][:,0], bot_points[:,:2][:,1], c= "orange")
# ax.set_xlabel('X [mm]')
# ax.set_ylabel('Y [mm]')
# ax.set_zlabel('Z [mm]')
# plt.tight_layout()
# plt.show()
# fig.savefig("3d_apexes.svg", format="svg", dpi=1200)
