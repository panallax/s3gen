import pickle
import os
# sys.path.append(config.FREECADPATH)
# import FreeCAD as App
# import Part
# import MeshPart, Mesh
# import pymesh
import numpy as np
import pygmsh
import gmsh
from collections import defaultdict

class STLGen():

    def __init__(self, sphere_radius, cylinder_radius, graph_path, output_path):
        
        self.sphere_radius = sphere_radius
        self.cylinder_radius = cylinder_radius
        self.G = pickle.load(open(os.path.join(graph_path, "G.pickle"), 'rb'))
        self.polygons = pickle.load(open(os.path.join(graph_path, "tetra.pickle"), 'rb'))
        self.output_path = output_path

    @staticmethod
    def build_tetrahedron(tetra_list, layer, sphere_radius, cylinder_radius, output_path):
        # with pygmsh.occ.Geometry() as geom:
        #     geom.characteristic_length_max = 2
        #     geom.characteristic_length_min = 2
        #     solid_layer = geom.boolean_union(
        #         [
        #             geom.add_ball(node, node_radius)
        #                 for tetra_dict in tetra_list 
        #                 for node in np.vstack((tetra_dict["apex"],tetra_dict["base_points"]))
        #             ]
        #         + 
        #         [
        #             geom.add_cylinder(start, tetra_dict["apex"] - start, cylinder_radius)
        #                 for tetra_dict in tetra_list 
        #                 for start in tetra_dict["base_points"]
        #             ]
        #     )
        #     geom.generate_mesh()
        # return geom, solid_layer
        gmsh.initialize()
        gmsh.model.add(f"layer_{layer}")
        gmsh.option.setNumber("Mesh.CharacteristicLengthMin", 1)
        gmsh.option.setNumber("Mesh.CharacteristicLengthMax", 1)

        entities = []
        for tetra_dict in tetra_list:
            apex = tetra_dict["apex"]
            base_points = tetra_dict["base_points"]

            for node in np.vstack((apex, base_points)):
                sphere = gmsh.model.occ.addSphere(node[0], node[1], node[2], sphere_radius)
                entities.append((3, sphere))  # (dimension, tag)

            for start in base_points:
                dx, dy, dz = apex - start
                cylinder = gmsh.model.occ.addCylinder(
                    start[0], start[1], start[2], dx, dy, dz, cylinder_radius
                )
                entities.append((3, cylinder))  # (dimension, tag)

        gmsh.model.occ.synchronize()
        fused = gmsh.model.occ.fuse(entities, entities)
        gmsh.model.occ.synchronize()

        gmsh.model.occ.removeAllDuplicates()
        gmsh.model.mesh.generate(3)

        tmp_file = os.path.join(output_path, f"tmp_{layer}.stl")
        gmsh.write(tmp_file)
        gmsh.finalize()

        return tmp_file
        
    def process_layer(self, args):
        # try:
        layer, layer_tetra = args
        return self.build_tetrahedron(layer_tetra, layer, self.sphere_radius, self.cylinder_radius, self.output_path)
        # final_path = os.path.join(self.output_path, f"tmp_{layer}.stl")

        # except Exception as e:
        #     return f"Error en capa {layer}: {e}"
        # geom, solids = self.build_tetrahedron(layer_tetra, self.sphere_radius, self.cylinder_radius)
        # tmp_file = f"tmp_{layer}.stl"
        # pygmsh.write(os.path.join(self.output_path, tmp_file))
    
        # with multiprocessing.Pool(processes = multiprocessing.cpu_count()) as pool:
        #     solids = pool.starmap(self.build_tetrahedron, [(t, self.sphere_radius, self.cylinder_radius, geom) for t in layer_tetra])
        # with pygmsh.occ.Geometry() as geom:
        # return [self.build_tetrahedron(t, self.sphere_radius, self.cylinder_radius, geom) for t in layer_tetra]
        # return self.build_tetrahedron(layer_tetra, self.sphere_radius, self.cylinder_radius, geom)
        
        # return tmp_file
    
    def generate_stl(self):
        
        layers = defaultdict(list)
        for key, value in self.polygons.items():
            layers[key.split("_")[0]].append(value)


        for layer, layer_tetra in layers.items():
            final_path = os.path.join(self.output_path, f"layer_{layer}.stl")
            self.process_layer((layer, layer_tetra))
            # args = [(layer, t) for layer,t in layers.items()]
            # with multiprocessing.Pool(processes = multiprocessing.cpu_count() - 1) as pool:
            # results = pool.map(self.process_layer, args)
                # with pygmsh.occ.Geometry() as geom:
                #     geom.characteristic_length_max = 2
                #     geom.characteristic_length_min = 2
                #     layers_solids = self.process_layer(t, geom)
                #     geom.generate_mesh()
                #     tmp_file = f"tmp_{layer}.stl"
                #     pygmsh.write(os.path.join(self.output_path, tmp_file))
    

                # layers_solids.extend(solids)
            
            # geom.boolean_union(solids)

            # mesh = geom.generate_mesh()


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

