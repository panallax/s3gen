import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
import matplotlib.pyplot as plt

PI = np.pi
nSample = 2000
phi_min = PI / 4  # 45 degrees

def generate_points_on_spherical_cap(n, phi_min):
    """Generate n points uniformly on a spherical cap defined by phi_min < phi < pi."""
    theta = np.random.uniform(0, 2 * PI, n)
    # Uniform sampling in the cap
    u = np.random.uniform(np.cos(phi_min), 1, n)  # cos(phi) in (cos(phi_min), -1)
    phi = np.arccos(u)

    x = np.cos(theta) * np.sin(phi)
    y = np.sin(theta) * np.sin(phi)
    z = np.cos(phi)

    return x, y, z, theta

def plot_cap_and_colored_quadrants(x, y, z, theta):
    """Plot points on a spherical cap with colors for each quadrant."""
    fig = plt.figure(figsize=(8, 6))
    ax = fig.add_subplot(111, projection='3d')
    ax.set_axis_off()

    # Clasificación por cuadrantes
    colors = []
    for t in theta:
        if 0 <= t < PI/2:
            colors.append('red')
        elif PI/2 <= t < PI:
            colors.append('orange')
        elif PI <= t < 3*PI/2:
            colors.append('green')
        else:
            colors.append('blue')

    ax.scatter(x, y, z, c=colors, s=2, alpha=0.8)
    ax.scatter(0, 0, 0, color='black', s=50)  # Centro de la esfera
    ax.plot
    # Superficie completa de la esfera (transparente para referencia)
    u = np.linspace(0, 2 * PI, 60)
    v = np.linspace(0, PI, 30)
    xs = np.outer(np.cos(u), np.sin(v))
    ys = np.outer(np.sin(u), np.sin(v))
    zs = np.outer(np.ones_like(u), np.cos(v))
    ax.plot_surface(xs, ys, zs, color='lightgray', alpha=0.15, linewidth=0)

    ax.set_box_aspect([1, 1, 1])
    plt.tight_layout()
    plt.show()

def main():
    x, y, z, theta = generate_points_on_spherical_cap(nSample, phi_min)
    plot_cap_and_colored_quadrants(x, y, z, theta)

if __name__ == "__main__":
    main()

# PI = np.pi
# nSample = 5000

# def irand(min_val, max_val):
#     """Generate a random number uniformly in (min, max)."""
#     return np.random.uniform(min_val, max_val)

# def generate_points_on_sphere(n):
#     """Generate n points uniformly on the surface of a unit sphere."""
#     x, y, z = [], [], []

#     for _ in range(n):
#         theta = 2 * PI * irand(0, 1)
#         phi = np.arccos(2 * irand(0, 1) - 1)
#         x.append(np.cos(theta) * np.sin(phi))
#         y.append(np.sin(theta) * np.sin(phi))
#         z.append(np.cos(phi))

#     return np.array(x), np.array(y), np.array(z)

# def plot_sphere_and_points(x, y, z):
#     """Plot the unit sphere and the sampled points."""
#     fig = plt.figure(figsize=(8, 6))
#     ax = fig.add_subplot(111, projection='3d')

#     # Plot sampled points
#     ax.scatter(x, y, z, color='blue', s=1, label='Sampled points')

#     # Create mesh for sphere surface
#     u = np.linspace(0, 2 * PI, 60)
#     v = np.linspace(0, PI, 30)
#     xs = np.outer(np.cos(u), np.sin(v))
#     ys = np.outer(np.sin(u), np.sin(v))
#     zs = np.outer(np.ones_like(u), np.cos(v))
    
#     ax.plot_surface(xs, ys, zs, color='lightgray', alpha=0.3, linewidth=0)


#     ax.set_xlabel('x')
#     ax.set_ylabel('y')
#     ax.set_zlabel('z')
#     ax.set_box_aspect([1,1,1])  # Equal aspect ratio
#     ax.set_axis_off()
#     plt.tight_layout()
#     plt.show()

# def main():
#     x, y, z = generate_points_on_sphere(nSample)
#     plot_sphere_and_points(x, y, z)

############# INCORRECT METHOD ####################

# import numpy as np
# import matplotlib.pyplot as plt

# PI = np.pi
# nSample = 5000

# def generate_points_wrong_method(n):
#     """Generate points using uniform theta and phi (incorrect sampling)."""
#     theta = np.random.uniform(0, 2 * PI, n)
#     phi = np.random.uniform(0, PI, n)

#     x = np.cos(theta) * np.sin(phi)
#     y = np.sin(theta) * np.sin(phi)
#     z = np.cos(phi)
#     return x, y, z

# def plot_sphere_and_points(x, y, z):
#     """Plot the unit sphere and the sampled points."""
#     fig = plt.figure(figsize=(8, 6))
#     ax = fig.add_subplot(111, projection='3d')
#     ax.set_axis_off()  # ← ocultar ejes

#     # Puntos
#     ax.scatter(x, y, z, color='blue', s=1, alpha=0.6, label='Puntos no uniformes')

#     # Superficie de la esfera
#     u = np.linspace(0, 2 * PI, 60)
#     v = np.linspace(0, PI, 30)
#     xs = np.outer(np.cos(u), np.sin(v))
#     ys = np.outer(np.sin(u), np.sin(v))
#     zs = np.outer(np.ones_like(u), np.cos(v))

#     ax.plot_surface(xs, ys, zs, color='lightgray', alpha=0.3, linewidth=0)

#     ax.set_box_aspect([1, 1, 1])
#     plt.tight_layout()
#     plt.show()

# def main():
#     x, y, z = generate_points_wrong_method(nSample)
#     plot_sphere_and_points(x, y, z)

# if __name__ == "__main__":
#     main()
