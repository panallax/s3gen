import matplotlib.pyplot as plt
import numpy as np

def plot(points):

    fig = plt.figure(np.random.randint(1000), figsize=(15,15))
    ax = fig.add_subplot(111, projection="3d")
    ax.scatter(*points.T)
    plt.show(block=False)

def plot_knn(indices, X):

    fig = plt.figure(np.random.randint(1000), figsize = (15,15))
    ax = fig.add_subplot(111, projection='3d')
    ax.scatter(X[:, 0], X[:, 1], X[:, 2])
    
    # Unir los vecinos más cercanos de cada punto
    for i in range(X.shape[0]):
        for j in indices[i]:
            ax.plot([X[i, 0], X[j, 0]], [X[i, 1], X[j, 1]], [X[i, 2], X[j, 2]])

    plt.show(block=False)