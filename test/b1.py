import numpy as np
import matplotlib.pyplot as plt
import config
from utils import exclude_points, extract_points_from_STL, angle
from scipy.spatial import Delaunay, cKDTree


points = extract_points_from_STL(config.STLFILE)
bot_points = points[np.where(points[:,-1] < np.min(points[:,-1]) + 0.1)]
top_points = points[np.where(points[:,-1] > np.max(points[:,-1]) - 0.1)]
lateral = exclude_points(points, bot_points)
lateral = exclude_points(lateral, top_points)
fig = plt.figure(figsize=(15,15))
ax = fig.add_subplot(111, projection="3d")
ax.scatter(*lateral.T)
kd_tree = cKDTree(lateral)
total_dist = 0.0
for point in lateral:
    a = kd_tree.query(point, k=10)[1][1:]
    print(np.where(lateral[a][:,-1] > point[-1]))
    print(lateral[np.where(lateral[a][:,-1] > point[-1])])
    points_above =  lateral[a[np.where(lateral[a][:,-1] > point[-1])]]
    joined = 0
    for i in points_above:
        print(i)

        if angle(i, point, np.array([0,0,1])) > 44 and joined < 2:
            joined +=1
            plt.plot(*np.array([point, i]).T)
                  # print(angle(lateral[a], point, np.array([0,0,1])) > 45)
plt.show()
