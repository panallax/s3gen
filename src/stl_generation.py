import sys
import config
import pickle
import os
# sys.path.append(config.FREECADPATH)
# import FreeCAD as App
# import Part
# import MeshPart, Mesh
# import pymesh
import numpy as np
import trimesh
import pygmsh

G = pickle.load(open( "../tmp/G.pickle", 'rb'))

with pygmsh.occ.Geometry() as geom:
    geom.characteristic_length_max = 0.5
    geom.characteristic_length_min = 0.5
    points = []
    for node in G.nodes():
        points.append(geom.add_ball(node, 0.5))

    for edge in G.edges():
        points.append(geom.add_cylinder(np.array(edge[0]), np.array(edge[1]) - np.array(edge[0]), 0.4))
        
    geom.boolean_union(points)
    mesh = geom.generate_mesh()

pygmsh.write("mesh.msh")
# vertices = np.array(G.nodes())
# B = np.array(G.edges())
# edges = np.array([[np.where((vertices == nodo).all(axis=1))[0][0] for nodo in relacion] for relacion in B])
# wire_network = pymesh.wires.WireNetwork.create_from_data(vertices, edges)
# inflator = pymesh.wires.Inflator(wire_network)
# inflator.set_refinement(2, "loop")
# inflator.inflate(0.5)
# mesh = inflator.mesh
# pymesh.save_mesh("mesh.stl", mesh)
# def create_cylinder_mesh(start, end, radius, segments=32):
#     """Crea un cilindro 3D entre dos puntos con un radio dado."""
#     vector = np.array(end) - np.array(start)
#     length = np.linalg.norm(vector)
#     direction = vector / length if length != 0 else [1, 0, 0]

#     cylinder = trimesh.creation.cylinder(radius, length, sections=segments)
#     cylinder.apply_translation([0,0,length/2])

#     rotation = trimesh.geometry.align_vectors([0, 0, 1], direction)

#     # Trasladar el cilindro al punto inicial
#     translation = np.eye(4)
#     translation[:3, 3] = start  # Aplicar traslación al punto inicial
    
#     # Combinar la rotación y la traslación
#     transform = translation @ rotation
    
#     # Aplicar la transformación al cilindro
#     cylinder.apply_transform(transform)

#     return cylinder

# def graph_to_3d_model(graph):
#     """Convierte un grafo en un modelo 3D con espesores para las barras."""
#     meshes = []
#     for node in graph.nodes:
#         sphere = trimesh.creation.icosphere(radius=0.15)
#         sphere.apply_translation(np.array(node))
#         meshes.append(sphere)

#     for edge in graph.edges:
#         start = edge[0]
#         end = edge[1]
#         thickness = 0.1
#         cylinder = create_cylinder_mesh(start, end, thickness)
#         meshes.append(cylinder)
#     print("ada")

#     return trimesh.boolean.union(meshes, engine="manifold")

# mesh = graph_to_3d_model(G)


# print(mesh)
# trimesh.interfaces.gmsh.to_volume(mesh, "abc.msh", mesher_id=10)
# print("dasdas")
# mesh.show()

# nodes = [  pymesh.generate_icosphere(0.5, v) for v in vertices]
# nodes.extend([ pymesh.generate_cylinder(e[0], e[1], 0.4, 0.4) for e in B])
# print(len(nodes))
# # tree = pymesh.CSGTree({"union": nodes})
# mesh = pymesh.boolean(nodes[0], nodes[1], operation="union")
# for i in nodes[2:]:
#     mesh = pymesh.boolean(mesh, i, operation="union")

# # mesh = tree.mesh
# pymesh.save_mesh("mesh1.stl", mesh)




# class STLGen():

#     def __init__(self, graph_path, output_path, **kwargs):
        
#         self.G = pickle.load(open(os.path.join(graph_path, "G.pickle"), 'rb'))
#         self.output_path = output_path

#     def __create_cylinder(self,point1, point2, diameter):
#         delta = point2.sub(point1)
#         cylinder = Part.makeCylinder(diameter / 2.0, delta.Length, point1, delta)  
    
#         return cylinder
    
#     def __create_sphere(self,center, radius):
#         sphere = Part.makeSphere(radius, center)

#         return sphere

#     def generate_stl(self):
            
#         doc = App.newDocument()
#         objs = []
#         for n in self.G.nodes():
#             objs.append(self.__create_sphere(App.Vector(*n), 0.4))

#         for e in self.G.edges():
#             objs.append(self.__create_cylinder(App.Vector(*e[0]), App.Vector(*e[1]), 0.8))

        
#         objsShapes = list(map(lambda obj : Part.Shape(obj), objs))
#         final_shape = Part.makeCompound(objsShapes)
#         Part.show(final_shape, "final_shape")
#         doc.recompute()
#         mesh = MeshPart.meshFromShape(final_shape, LinearDeflection=0.01, AngularDeflection=0.523599, Relative=False)
#         # doc.saveAs(os.path.join(self.output_path, "mesh.FCStd")) 
#         mesh.write(os.path.join(self.output_path, "mesh.stl"))

