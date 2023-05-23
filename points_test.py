
from scipy.spatial import ConvexHull
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
from stl import mesh


def in_hull(p, hull):
    """
    Test if points in `p` are in `hull`

    `p` should be a `NxK` coordinates of `N` points in `K` dimensions
    `hull` is either a scipy.spatial.Delaunay object or the `MxK` array of the 
    coordinates of `M` points in `K`dimensions for which Delaunay triangulation
    will be computed
    """
    from scipy.spatial import Delaunay
    if not isinstance(hull,Delaunay):
        hull = Delaunay(hull)

    return hull.find_simplex(p)>=0

def sample_spherical(npoints, point, ndim=3):
    vec = np.random.randn(npoints, ndim)
    vec /= np.linalg.norm(vec, axis=0)
    vec += point

    return vec


m = mesh.Mesh.from_file('/home/alex/Downloads/cat_ring_flowalistik_5.5.STL')
points = np.unique(m.points.reshape([-1,3]), axis=0)
colors= ["g","r","b","y"]
# # points = np.array([[1, 0, 0], [1, 1, 0], [0, 1, 0], [0,0,1], [0,0,0]])
# # point = np.array([0.25,0.5,0.5])
# # print(in_hull(point,points))
# nube_puntos = points

# # Calcular el Convex Hull
# hull = ConvexHull(nube_puntos)

# # Graficar el Convex Hull
# fig = plt.figure()
# ax = fig.add_subplot(111, projection='3d')
# for s in hull.simplices:
#     s = np.append(s, s[0])
#     ax.plot(nube_puntos[s, 0], nube_puntos[s, 1], nube_puntos[s, 2], 'b-')
# ax.set_xlabel('X')
# ax.set_ylabel('Y')
# ax.set_zlabel('Z')


# ax.scatter(*points.T, c="r")
# ax.scatter(*point.T, c="black")

# plt.show()





# Generar una nube de puntos aleatorios
nube_puntos = points
# point = np.array([[0.5,0.5,0.5],[1,1,1],[3,3,3]])

fig = plt.figure(figsize=(20,20))
ax = fig.add_subplot(111, projection='3d')

for i in nube_puntos:
    es_p = sample_spherical(10,i)
    # print("===============")
    # print(es_p)
    inhull = es_p[in_hull(es_p, nube_puntos)]
    # print("---------")
    # print(inhull)
    ax.scatter(*inhull.T)
    # ax.scatter(*es_p.T, c=c)
    # ax.scatter(*nube_puntos[i].T, )

# Calcular la envolvente convexa
hull = ConvexHull(nube_puntos)


# Obtener los vértices de la envolvente convexa
vertices = nube_puntos[hull.vertices, :]

# Obtener las caras de la envolvente convexa
caras = np.column_stack(hull.simplices)

# Obtener la superficie más externa
superficie_externa = (vertices, caras)
# Definir la figura y los ejes


# Añadir los puntos de la nube
# ax.scatter(nube_puntos[:, 0], nube_puntos[:, 1], nube_puntos[:, 2], color='blue')

# Añadir la envolvente convexa
for simplex in hull.simplices:
    simplex = np.append(simplex, simplex[0])
    ax.plot(nube_puntos[simplex, 0], nube_puntos[simplex, 1], nube_puntos[simplex, 2], color='black')



# Mostrar la figura
plt.show()