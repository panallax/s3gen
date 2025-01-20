from setuptools import setup, find_packages

setup(
    name="mesh-gen",
    version="1.0.0",
    description="Generate mesh for 3D printing",
    packages=find_packages(),
    install_requires=[
        "networkx",
        "scikit-learn",
        "numpy-stl",
        "scipy",
        "numpy==1.24.3",
        "matplotlib",
        "shapely",
        "triangle",
        "trimesh",
        "pytz"
    ]
)