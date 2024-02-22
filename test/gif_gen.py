import pickle
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from matplotlib import animation
from stl import mesh
from scipy.spatial import Delaunay
from shapely.geometry import LineString
from triangle import triangulate


def exclude_points(arr, values_to_remove):
  new_arr = arr[~(arr==values_to_remove[:,None]).all(-1).any(0)]
  return new_arr

def polar_angle_sort(point, ref_point):
    x, y = point[0] - ref_point[0], point[1] - ref_point[1]
    return np.arctan2(y, x)

def sort_simplices(simplices, idx_simplices, points):
  areas = list(map(lambda x: area_polygon(x), simplices))
  sorted_simplices = np.array(list(map(lambda s: sorted(s, key=lambda x : polar_angle_sort(points[x],np.mean(points[s], axis=0))), idx_simplices)))
  return areas, sorted_simplices

def area_polygon(points):
    center = np.mean(points, axis=0)
    sorted_points = sorted(points, key=lambda p: polar_angle_sort(p, center))
    # Aplicar la fórmula de Shoelace
    area = 0.5 * abs(sum(x0*y1 - x1*y0 for ((x0, y0), (x1, y1)) in zip(sorted_points, sorted_points[1:] + [sorted_points[0]])))
    return area
def initial_points(l, pore_area, points):
  dea = Delaunay(points[:,:2])
  indices = dea.convex_hull
  hull = points[np.unique(indices)]

  section_points = np.array(list(sorted(hull, key=lambda x : polar_angle_sort(x,np.mean(hull, axis=0)))))
  section_points = np.append(section_points, [section_points[0]], axis=0)
  section_line = LineString(section_points)
  # Aplicar el algoritmo de Douglas-Peucker para reducir la densidad de puntos
  simplified_line = section_line.simplify(l/10)
  simplified_hull = np.array(simplified_line.coords)

  current_area = 0
  min_val = 0.1
  max_val = 20

  while not np.isclose(current_area, pore_area, atol= 0.2):
    current_val = (min_val + max_val)/2
    opt = f"qa{current_val}"
    t = triangulate({"vertices": simplified_hull[:,:2]}, opt)
    triang_points = np.array(t["vertices"].tolist())
    simplices = np.array(t["triangles"].tolist())
    current_area =  np.mean([area_polygon(triang_points[x]) for x in sort_simplices(triang_points[simplices], simplices, triang_points)[1]])

    if current_area < pore_area:
      min_val = current_val
    else:
      max_val = current_val

  triang_points_3d = np.c_[triang_points, np.zeros(triang_points.shape[0])]
  return triang_points_3d, simplices

with open('/home/alex/Desktop/mesh-gen/tmp/G.pickle', 'rb') as handle:
    g = pickle.load(handle)
with open('/home/alex/Desktop/mesh-gen/tmp/tetra.pickle', 'rb') as handle:
    tetra = pickle.load(handle)

m = mesh.Mesh.from_file('/home/alex/Desktop/mesh-gen/data/Cylinder.stl')
points = np.unique(m.points.reshape([-1,3]), axis=0)
bot_points = points[np.where(points[:,-1] < np.min(points[:,-1]) + 0.1)]
top_points = points[np.where(points[:,-1] > np.max(points[:,-1]) - 0.1)]
lateral_poins = exclude_points(points, bot_points)
lateral_poins = exclude_points(lateral_poins, top_points)

for i in range(6):
  fig = plt.figure(figsize=(12,12))
  ax = fig.add_subplot(projection = "3d")
  ax.set_xlim3d([-15.0, 15.0])
  ax.set_xlabel('X [mm]')

  ax.set_ylim3d([-15.0, 15.0])
  ax.set_ylabel('Y [mm]')

  ax.set_zlim3d([0.0, 35.0])
  ax.set_zlabel('Z [mm]')
  ax.scatter(*points.T)
  plt.savefig(f"/home/alex/Desktop/mesh-gen/data/files/{i}.png", dpi=200)

for i in range(6):
  fig = plt.figure(figsize=(12,12))
  ax = fig.add_subplot(projection = "3d")
  ax.set_xlim3d([-15.0, 15.0])
  ax.set_xlabel('X [mm]')

  ax.set_ylim3d([-15.0, 15.0])
  ax.set_ylabel('Y [mm]')

  ax.set_zlim3d([0.0, 35.0])
  ax.set_zlabel('Z [mm]')

  ax.scatter(*bot_points[np.unique(Delaunay(bot_points[:,:2]).convex_hull)].T)
  plt.savefig(f"/home/alex/Desktop/mesh-gen/data/files/{i+5}.png", dpi=200)

L = 5 #mm
pore_area = L**2*np.sqrt(3)/4 #mm^2
bot,_ = initial_points(L, pore_area, bot_points)
for i in range(6):
  fig = plt.figure(figsize=(12,12))
  ax = fig.add_subplot(projection = "3d")
  ax.set_xlim3d([-15.0, 15.0])
  ax.set_xlabel('X [mm]')

  ax.set_ylim3d([-15.0, 15.0])
  ax.set_ylabel('Y [mm]')

  ax.set_zlim3d([0.0, 35.0])
  ax.set_zlabel('Z [mm]')

  ax.scatter(*bot.T)
  plt.savefig(f"/home/alex/Desktop/mesh-gen/data/files/{i+10}.png", dpi=200)

capas = []
for i in range(9):
  capas.append([elem for k,elem in tetra.items() if k.startswith(str(i)+"_")])
    
m = 11
acc = []
for c in capas:
  for s in c:
    acc.append(s)
    fig = plt.figure(figsize=(15,15))
    ax = fig.add_subplot( projection="3d")
    ax.set_xlim3d([-15.0, 15.0])
    ax.set_xlabel('X [mm]')

    ax.set_ylim3d([-15.0, 15.0])
    ax.set_ylabel('Y [mm]')

    ax.set_zlim3d([0.0, 35.0])
    ax.set_zlabel('Z [mm]')
    for n, elem in enumerate(acc):
      # for j in range(n):
        # ax.scatter(elem["base_points"][:, 0], elem["base_points"][:, 1], elem["base_points"][:,2], facecolors='none', edgecolors='black')
        # ax.scatter(elem["apex"][0], elem["apex"][1], elem["apex"][2], facecolors='none', edgecolors='green')
      el = elem
      ax.scatter(*bot.T, color= "blue")
      ax.scatter(*el["base_points"].T, color="blue")
      for i,p in enumerate(el["base_points"]):
        ax.plot([el["base_points"][i,0],el["apex"][0]],[el["base_points"][i,1],el["apex"][1]],[el["base_points"][i,2],el["apex"][2]], "blue")
    plt.savefig(f"/home/alex/Desktop/mesh-gen/data/files/{m+3}.png", dpi=200)
    plt.close()
    m += 1
    # plt.show()

seg_acc = []
for seg in g.edges():
  seg_acc.append(seg)
  fig = plt.figure(figsize=(15,15))
  ax = fig.add_subplot( projection="3d")
  ax.set_xlim3d([-15.0, 15.0])
  ax.set_xlabel('X [mm]')

  ax.set_ylim3d([-15.0, 15.0])
  ax.set_ylabel('Y [mm]')

  ax.set_zlim3d([0.0, 35.0])
  ax.set_zlabel('Z [mm]')
  for n, elem in enumerate(acc):
    # for j in range(n):
      # ax.scatter(elem["base_points"][:, 0], elem["base_points"][:, 1], elem["base_points"][:,2], facecolors='none', edgecolors='black')
      # ax.scatter(elem["apex"][0], elem["apex"][1], elem["apex"][2], facecolors='none', edgecolors='green')
    el = elem
    for i,p in enumerate(el["base_points"]):
      ax.plot([el["base_points"][i,0],el["apex"][0]],[el["base_points"][i,1],el["apex"][1]],[el["base_points"][i,2],el["apex"][2]], "blue")
  
  for s in seg_acc:
    ax.plot(*[[s[0][0],s[1][0]],[s[0][1],s[1][1]],[s[0][2],s[1][2]]], color="red")
  plt.savefig(f"/home/alex/Desktop/mesh-gen/data/files/{m+3}.png", dpi=200)
  plt.close()
  m += 1
  # plt.show()


  