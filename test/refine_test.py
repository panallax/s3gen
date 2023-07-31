import numpy as np
from stl import mesh
from utils import plot
import random
from sklearn.model_selection import train_test_split
from sklearn.neighbors import NearestNeighbors

m = mesh.Mesh.from_file('/home/alex/Downloads/Cilindro.stl')
points = np.unique(m.points.reshape([-1,3]), axis=0)

nbrs = NearestNeighbors(n_neighbors=4, algorithm="ball_tree").fit(points)
_, indices = nbrs.kneighbors(points)

r = 0
for indice in indices:
    point_0 = points[indice[0]]
    point_1 = points[indice[1]]
    point_2 = points[indice[3]]
    a = np.linalg.norm(point_1 - point_0)
    b = np.linalg.norm(point_2 - point_0)
    c = np.linalg.norm(point_2 - point_1)
    s = (a + b + c)/2
    area = 0.5*np.linalg.norm(np.cross(point_1 - point_0, point_2 - point_0))
    r += area/s

print(r/points.shape[0])

# plot(points, [points[indices[0][0]], points[indices[0][1]], points[indices[0][3]]])



# point_0 = points[0]

# dist = np.sum((points - points[0])**2, axis=1)
# index_1 = sorted([*enumerate(dist)], key=lambda x: x[1])[1][0]
# index_2 = sorted([*enumerate(dist)], key=lambda x: x[1])[4][0]

# point_1 = points[index_1]
# point_2 = points[index_2]

# a = np.linalg.norm(point_1 - point_0)
# b = np.linalg.norm(point_2 - point_0)
# c = np.linalg.norm(point_2 - point_1)
# s = (a + b + c)/2
# area = 0.5*np.linalg.norm(np.cross(point_1 - point_0, point_2 - point_0))
# r = area/s
# print(r)
# plot(points, [point_0, point_1, point_2])

# points,_ = train_test_split(points, test_size=0.2,random_state=1)
ind = np.random.choice(range(points.shape[0]), size=(int(points.shape[0]*0.5),))
points= np.delete(points, ind, axis=0)
nbrs = NearestNeighbors(n_neighbors=4, algorithm="ball_tree").fit(points)
_, indices = nbrs.kneighbors(points)

r = 0
for indice in indices:
    point_0 = points[indice[0]]
    point_1 = points[indice[1]]
    point_2 = points[indice[3]]
    a = np.linalg.norm(point_1 - point_0)
    b = np.linalg.norm(point_2 - point_0)
    c = np.linalg.norm(point_2 - point_1)
    s = (a + b + c)/2
    area = 0.5*np.linalg.norm(np.cross(point_1 - point_0, point_2 - point_0))
    r += area/s

print(r/points.shape[0])
plot(points)
# point_0 = points[np.random.randint(points.shape[0])]
# dist = np.linalg.norm((points - point_0), axis=1)
# index_1 = sorted([*enumerate(dist)], key=lambda x: x[1])[1][0]
# index_2 = sorted([*enumerate(dist)], key=lambda x: x[1])[4][0]
# point_1 = points[index_1]
# point_2 = points[index_2]
# a = np.linalg.norm(point_1 - point_0)
# b = np.linalg.norm(point_2 - point_0)
# c = np.linalg.norm(point_2 - point_1)
# s = (a + b + c)/2
# area = 0.5*np.linalg.norm(np.cross(point_1 - point_0, point_2 - point_0))
# r = area/s
# print(r)
# plot(points, [point_0, point_1, point_2])