from setuptools import setup, find_packages

setup(
    name="mesh-gen",
    version="1.0.0",
    description="Generate mesh for 3D printing",
    packages=find_packages(),
    py_modules=["config"],
    install_requires=[
        "networkx",
        "scipy",
        "numpy<2.0",
        "matplotlib",
        "pyvista",
        "shapely",
        "triangle",
        "trimesh",
        "pytz",
        "rtree",
        "pyglet<2"
    ]
)