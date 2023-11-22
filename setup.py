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
        "scipy >= 1.11.0",
        "numpy",
        "matplotlib",
        "numpy",
        "matplotlib",
    ]
)