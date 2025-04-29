# import pickle
# import os
# import numpy as np

# import pygmsh

# class STLGen():

#     def __init__(self, graph_path, output_path):
#         self.G = pickle.load(open(os.path.join(graph_path, "G.pickle"), 'rb'))
#         self.output_path = output_path
    
#     def generate_stl(self):
#         with pygmsh.occ.occmetry() as occm:
#             occm.characteristic_length_max = 1
#             occm.characteristic_length_min = 1
#             spheres = [occm.add_ball(node, 2) for node in self.G.nodes()]
#             cylinders = [occm.add_cylinder(np.array(edge[0]), np.array(edge[1]) - np.array(edge[0]), 1) for edge in self.G.edges()]

#             # occm.boolean_union(spheres + cylinders)
#             # print(13123)
#             # mesh = occm.generate_mesh()

#             group_size = 100
#             groups = [spheres[i:i + group_size] + cylinders[i:i + group_size] 
#                     for i in range(0, len(spheres), group_size)]

#             combined = groups[0]
#             for group in groups[1:]:
#                 print("AAa")
#                 combined = occm.boolean_union([combined] + group)

#             mesh = occm.generate_mesh()
#         mesh.write("mesh.vtk")
# import numpy as np
# import pygmsh
# import gmsh
# from collections import defaultdict
# import multiprocessing
# import pickle 
# import os
# class STLGen():

#     def __init__(self, sphere_radius, cylinder_radius, graph_path, output_path):

#         self.sphere_radius = sphere_radius
#         self.cylinder_radius = cylinder_radius
#         self.G = pickle.load(open(os.path.join(graph_path, "G.pickle"), 'rb'))
#         self.polygons = pickle.load(open(os.path.join(graph_path, "tetra.pickle"), 'rb'))
#         self.output_path = output_path

#     def build_tetrahedron(self, tetra_list, layer, sphere_radius, cylinder_radius, output_path):
#         # with pygmsh.occ.occmetry() as occm:
#         #     occm.characteristic_length_max = 2
#         #     occm.characteristic_length_min = 2
#         #     solid_layer = occm.boolean_union(
#         #         [
#         #             occm.add_ball(node, node_radius)
#         #                 for tetra_dict in tetra_list 
#         #                 for node in np.vstack((tetra_dict["apex"],tetra_dict["base_points"]))
#         #             ]
#         #         + 
#         #         [
#         #             occm.add_cylinder(start, tetra_dict["apex"] - start, cylinder_radius)
#         #                 for tetra_dict in tetra_list 
#         #                 for start in tetra_dict["base_points"]
#         #             ]
#         #     )
#         #     occm.generate_mesh()
#         # return occm, solid_layer
#         gmsh.initialize()
#         gmsh.model.add(f"layer_{layer}")
#         gmsh.option.setNumber("Mesh.CharacteristicLengthMin", 2)
#         gmsh.option.setNumber("Mesh.CharacteristicLengthMax", 2)
#         # gmsh.option.setNumber("Mesh.FirstNodeTag", self.length)
#         # gmsh.option.setNumber("Mesh.FirstElementTag", self.length)
#         entities = []
#         for i, tetra_dict in enumerate(tetra_list):
#             apex = tetra_dict["apex"]
#             base_points = tetra_dict["base_points"]

#             for node in np.vstack((apex, base_points)):
#                 self.count += 1
#                 sphere = gmsh.model.occ.addSphere(node[0], node[1], node[2], sphere_radius, tag=self.count )
#                 entities.append((3, sphere))  # (dimension, tag)

#             for start in base_points:
#                 self.count += 1
#                 dx, dy, dz = apex - start
#                 cylinder = gmsh.model.occ.addCylinder(
#                     start[0], start[1], start[2], dx, dy, dz, cylinder_radius, tag= self.count
#                 )
#                 entities.append((3, cylinder))  # (dimension, tag)

#         gmsh.model.occ.synchronize()
#         fused = gmsh.model.occ.fuse(entities, entities)
#         gmsh.model.occ.synchronize()

#         gmsh.model.occ.removeAllDuplicates()
#         gmsh.model.occ.synchronize()

#         gmsh.model.mesh.generate(3)

#         tmp_file = os.path.join(output_path, f"tmp_{layer}.msh")
#         # vtk_file = os.path.join(output_path, f"tmp_{layer}.vtk")
#         gmsh.write(tmp_file)
#         # gmsh.write(vtk_file)
#         gmsh.finalize()

#         return tmp_file
        
#     def process_layer(self, args):
#         # try:
#         layer, layer_tetra = args
#         return self.build_tetrahedron(layer_tetra, layer, self.sphere_radius, self.cylinder_radius, self.output_path)
#         # final_path = os.path.join(self.output_path, f"tmp_{layer}.stl")

#         # except Exception as e:
#         #     return f"Error en capa {layer}: {e}"
#         # occm, solids = self.build_tetrahedron(layer_tetra, self.sphere_radius, self.cylinder_radius)
#         # tmp_file = f"tmp_{layer}.stl"
#         # pygmsh.write(os.path.join(self.output_path, tmp_file))
    
#         # with multiprocessing.Pool(processes = multiprocessing.cpu_count()) as pool:
#         #     solids = pool.starmap(self.build_tetrahedron, [(t, self.sphere_radius, self.cylinder_radius, occm) for t in layer_tetra])
#         # with pygmsh.occ.occmetry() as occm:
#         # return [self.build_tetrahedron(t, self.sphere_radius, self.cylinder_radius, occm) for t in layer_tetra]
#         # return self.build_tetrahedron(layer_tetra, self.sphere_radius, self.cylinder_radius, occm)
        
#         # return tmp_file

#     def generate_stl(self):
        
#         layers = defaultdict(list)
#         for key, value in self.polygons.items():
#             layers[key.split("_")[0]].append(value)

#         tmp_files = []
#         self.count = 0
#         for layer, layer_tetra in layers.items():
#             # final_path = os.path.join(self.output_path, f"layer_{layer}.stl")
#             tmp_files.append(self.process_layer((layer, layer_tetra)))

#             # args = [(layer, t) for layer,t in layers.items()]
#             # with multiprocessing.Pool(processes = multiprocessing.cpu_count() - 1) as pool:
#             # results = pool.map(self.process_layer, args)
#                 # with pygmsh.occ.occmetry() as occm:
#                 #     occm.characteristic_length_max = 2
#                 #     occm.characteristic_length_min = 2
#                 #     layers_solids = self.process_layer(t, occm)
#                 #     occm.generate_mesh()
#                 #     tmp_file = f"tmp_{layer}.stl"
#                 #     pygmsh.write(os.path.join(self.output_path, tmp_file))
    

#                 # layers_solids.extend(solids)
#         self.merge_and_export(tmp_files)

#     def merge_and_export(self, tmp_files):
#         """Fusiona los STL temporales en una sola malla volumétrica y la exporta"""
#         gmsh.initialize()
#         # gmsh.option.setNumber("General.Verbosity", 3)

#         gmsh.model.add("final_structure")
#         tmp_files = ["/home/abernadi/Desktop/mesh-gen/tmp/tmp_0.msh", 
#         "/home/abernadi/Desktop/mesh-gen/tmp/tmp_1.msh"]
#         for file in tmp_files:
#             print(file)
#             gmsh.merge(file)  # Carga la malla en Gmsh
#             # gmsh.model.occ.removeAllDuplicates()

#         # Sincronizar para asegurar que las entidades estén listas
#         gmsh.model.occ.synchronize()

#         # Obtener todas las entidades 3D (volúmenes)
#         volumes = gmsh.model.getEntities(3)
#         print("Volúmenes cargados:", volumes)
#         if len(volumes) > 1:
#             try:
#                 # Intentar una fusión booleana (fuse)
#                 input_volumes = [(3, vol[1]) for vol in volumes]  # Formato correcto: [(dimensión, tag)]
#                 fused = gmsh.model.occ.fuse([input_volumes[0]], input_volumes[1:])
#                 gmsh.model.occ.synchronize()
#                 print("Fusión booleana exitosa.")
#             except Exception as e:
#                 print(f"Error en la fusión booleana: {e}")
#                 # Si falla la fusión, intentar fragmentación
#                 try:
#                     fused, _ = gmsh.model.occ.fragment(input_volumes, [])
#                     gmsh.model.occ.synchronize()
#                     print("Fragmentación exitosa.")
#                 except Exception as e:
#                     print(f"Error en la fragmentación: {e}")
#                     raise Exception("No se pudo fusionar o fragmentar las mallas.")

#         # Generar la malla volumétrica
#         gmsh.model.mesh.generate(3)
#         gmsh.model.occ.removeAllDuplicates()
#         gmsh.model.occ.synchronize()

#         # Generar malla volumétrica final
#         gmsh.model.mesh.generate(3)

#         # Exportar la malla a STL y MSH (para simulaciones FEM)
#         final_stl = os.path.join(self.output_path, "final_structure.stl")
#         final_msh = os.path.join(self.output_path, "final_structure.msh")
#         gmsh.write(final_stl)
#         gmsh.write(final_msh)

#         print(f"Malla volumétrica exportada como: {final_stl} y {final_msh}")

#         gmsh.finalize()

#         # mesh = occm.generate_mesh()
# if __name__ == "__main__":
#     graph_path = "../tmp"
#     out_path = "../tmp"
#     m = STLGen(1,1,graph_path, out_path)
#     m.generate_stl()
#     # m.merge_and_export([])


# import numpy as np
# import pygmsh
# import gmsh
# from collections import defaultdict
# import pickle 
# import os

# class STLGen():

#     def __init__(self, sphere_radius, cylinder_radius, graph_path, output_path):
#         self.sphere_radius = sphere_radius
#         self.cylinder_radius = cylinder_radius
#         self.G = pickle.load(open(os.path.join(graph_path, "G.pickle"), 'rb'))
#         self.polygons = pickle.load(open(os.path.join(graph_path, "tetra.pickle"), 'rb'))
#         self.output_path = output_path
#         self.count = 0

#     def process_tetrahedron_block(self, block_layers, block_index):
#         """Procesa un bloque de capas en una única instancia de gmsh"""
        
#         # Inicializar gmsh para este bloque
#         gmsh.initialize()
#         gmsh.model.add(f"block_{block_index}")
        
#         # Configurar parámetros de malla y tolerancia
#         gmsh.option.setNumber("Mesh.CharacteristicLengthMin", 2)
#         gmsh.option.setNumber("Mesh.CharacteristicLengthMax", 2)
#         gmsh.option.setNumber("occmetry.Tolerance", 1e-5)
#         gmsh.option.setNumber("occmetry.ToleranceBoolean", 1e-4)

#         gmsh.option.setNumber("Mesh.Optimize", 1)
#         gmsh.option.setNumber("Mesh.OptimizeNetgen", 1)
#         gmsh.option.setNumber("Mesh.Algorithm", 1)
#         gmsh.option.setNumber("occmetry.OCCBooleanGlue", 2)
        
        
#         # Lista para almacenar entidades generadas
#         entities = []
        
#         # Procesar cada capa en el bloque
#         for layer, layer_tetra in block_layers.items():
#             print(f"Procesando capa {layer} en bloque {block_index}...")
            
#             for i, tetra_dict in enumerate(layer_tetra):
#                 apex = tetra_dict["apex"]
#                 base_points = tetra_dict["base_points"]
                
#                 # Crear esferas en los nodos
#                 for node in np.vstack((apex, base_points)):
#                     self.count += 1
#                     sphere = gmsh.model.occ.addSphere(node[0], node[1], node[2], self.sphere_radius, tag= self.count)
#                     entities.append((3, sphere))
                
#                 # Crear cilindros en las aristas
#                 for start in base_points:
#                     self.count += 1
#                     dx, dy, dz = apex - start
#                     cylinder = gmsh.model.occ.addCylinder(
#                         start[0], start[1], start[2], dx, dy, dz, self.cylinder_radius, tag= self.count
#                     )
#                     entities.append((3, cylinder))
        
#         print(f"Total de entidades creadas en bloque {block_index}: {len(entities)}")
        
#         gmsh.model.occ.synchronize()

#         if len(entities) > 1:
#             print(f"Fusionando {len(entities)} entidades en bloque {block_index}...")
#             # gmsh.model.occ.removeAllDuplicates()
#             # gmsh.model.occ.synchronize()

#             fused, _ = gmsh.model.occ.fuse([entities[0]], entities[1:])
#             gmsh.model.occ.synchronize()
#             print("Fusión booleana exitosa.")

        
#         # Eliminar duplicados
#         print(222225225)

#         gmsh.model.occ.removeAllDuplicates()
#         gmsh.model.occ.synchronize()
        
#         # Generar malla
#         print(1112122221221)
#         gmsh.model.mesh.generate(3)
#         print("ADASDASDASD")
#         # Guardar el bloque en formato STEP
#         block_file = os.path.join(self.output_path, f"block_{block_index}.step")
#         gmsh.write(block_file)
        
#         # Limpiar y finalizar
#         gmsh.finalize()
#         print(12312313131313)
#         return block_file

#     def merge_blocks(self, block_files):
#         """Fusiona los bloques procesados en una estructura final"""
        
#         gmsh.initialize()
#         gmsh.model.add("final_structure")
        
#         gmsh.option.setNumber("Mesh.CharacteristicLengthMin", 2)
#         gmsh.option.setNumber("Mesh.CharacteristicLengthMax", 2)
#         gmsh.option.setNumber("occmetry.Tolerance", 1e-5)
#         gmsh.option.setNumber("occmetry.ToleranceBoolean", 1e-4)

#         gmsh.option.setNumber("Mesh.Optimize", 1)
#         gmsh.option.setNumber("Mesh.OptimizeNetgen", 1)
        
#         all_volumes = []
#         print(block_files)
#         # Importar todos los bloques
#         for i, file in enumerate(block_files):
#             print(f"Importando bloque {i} desde {file}...")
#             gmsh.merge(file)
            
#             # Obtener volúmenes del archivo actual
#             volumes = gmsh.model.getEntities(3)
#             print(f"Volúmenes en bloque {i}: {len(volumes)}")
            
#             # Guardar referencias a estos volúmenes
#             all_volumes.extend([(3, vol[1]) for vol in volumes])
        
#         print(f"Total de volúmenes a fusionar: {len(all_volumes)}")
        
#         # Fusionar todos los volúmenes si hay más de uno
#         if len(all_volumes) > 1:
#             print("Fusionando todos los bloques...")
#             fused, _ = gmsh.model.occ.fuse([all_volumes[0]], all_volumes[1:])
#             gmsh.model.occ.synchronize()
#             print("Fusión final exitosa.")

#         # Eliminar duplicados
#         gmsh.model.occ.removeAllDuplicates()
#         gmsh.model.occ.synchronize()
        
#         # Generar malla volumétrica final
#         gmsh.model.mesh.generate(3)
        
#         # Exportar la malla a STL y MSH
#         # final_stl = os.path.join(self.output_path, "final_structure.stl")
#         final_msh = os.path.join(self.output_path, "final_structure.msh")
        
#         # gmsh.write(final_stl)
#         gmsh.write(final_msh)
        
#         print(f"Malla volumétrica exportada como: {final_msh}")
        
#         # Limpiar
#         gmsh.finalize()
        
#         return final_stl, final_msh

#     def generate_stl(self, block_size=5):
#         """Genera la malla STL usando un enfoque híbrido por bloques"""
        
#         # Organizar capas
#         layers = defaultdict(list)
#         for key, value in self.polygons.items():
#             layers[key.split("_")[0]].append(value)
        
#         layer_keys = sorted(layers.keys())
#         print(f"Total de capas a procesar: {len(layer_keys)}")
        
#         # Procesar capas por bloques
#         block_files = []
#         self.count = 0
#         for block_start in range(0, len(layer_keys), block_size):
#             block_index = block_start // block_size
#             block_end = min(block_start + block_size, len(layer_keys))
            
#             print(f"Procesando bloque {block_index} (capas {block_start} a {block_end-1})...")
            
#             # Crear un diccionario con las capas para este bloque
#             block_layers = {}
#             for i in range(block_start, block_end):
#                 layer = layer_keys[i]
#                 block_layers[layer] = layers[layer]
            
#             # Procesar el bloque
#             block_file = self.process_tetrahedron_block(block_layers, block_index)
#             block_files.append(block_file)
        
#         # Fusionar todos los bloques
#         final_stl, final_msh = self.merge_blocks(block_files)
        
#         self.clean_temp_files()
        
#         return final_stl, final_msh

#     def clean_temp_files(self):
#         """Elimina todos los archivos temporales generados"""
        
#         temp_files = [f for f in os.listdir(self.output_path) if f.startswith("block_") and f.endswith(".step")]
        
#         for file in temp_files:
#             file_path = os.path.join(self.output_path, file)
#             if os.path.exists(file_path):
#                 os.remove(file_path)
#                 print(f"Archivo temporal eliminado: {file}")

#     def generate_stl_single_instance(self):
#         gmsh.initialize()
#         gmsh.model.add("complete_structure")
#         gmsh.option.setNumber("Mesh.CharacteristicLengthMin", 2)
#         gmsh.option.setNumber("Mesh.CharacteristicLengthMax", 2)
#         gmsh.option.setNumber("occmetry.Tolerance", 1e-5)
#         gmsh.option.setNumber("occmetry.ToleranceBoolean", 1e-4)

#         gmsh.option.setNumber("Mesh.Optimize", 1)
#         gmsh.option.setNumber("Mesh.OptimizeNetgen", 1)
#         gmsh.option.setNumber("Mesh.Algorithm", 1)
#         gmsh.option.setNumber("occmetry.OCCBooleanGlue", 2)

#         entities = []
#         self.count = 0
        
#         layers = defaultdict(list)
#         for key, value in self.polygons.items():
#             layers[key.split("_")[0]].append(value)
        
#         for layer, layer_tetra in layers.items():
#             print(f"Procesando capa {layer}...")
            
#             for i, tetra_dict in enumerate(layer_tetra):
#                 apex = tetra_dict["apex"]
#                 base_points = tetra_dict["base_points"]
                
#                 # Crear esferas en los nodos
#                 for node in np.vstack((apex, base_points)):
#                     self.count += 1
#                     sphere = gmsh.model.occ.addSphere(node[0], node[1], node[2], self.sphere_radius, tag=self.count)
#                     entities.append((3, sphere))
                
#                 # Crear cilindros en las aristas
#                 for start in base_points:
#                     self.count += 1
#                     dx, dy, dz = apex - start
#                     cylinder = gmsh.model.occ.addCylinder(
#                         start[0], start[1], start[2], dx, dy, dz, self.cylinder_radius, tag=self.count
#                     )
#                     entities.append((3, cylinder))
        
#         print(f"Total de entidades creadas: {len(entities)}")
        
#         # Sincronizar el modelo
#         gmsh.model.occ.synchronize()
        
#         # Fusionar todas las entidades
#         if len(entities) > 1:
#             fused, _ = gmsh.model.occ.fragment([entities[0]], entities[1:])
#             gmsh.model.occ.synchronize()
        
#         # Eliminar duplicados
#         gmsh.model.occ.removeAllDuplicates()
#         gmsh.model.occ.synchronize()
        
#         # Generar malla
#         gmsh.model.mesh.generate(3)
        
#         # Exportar
#         final_stl = os.path.join(self.output_path, "final_structure.stl")
#         final_msh = os.path.join(self.output_path, "final_structure.msh")
        
#         gmsh.write(final_stl)
#         gmsh.write(final_msh)
        
#         print(f"Malla volumétrica exportada como: {final_stl} y {final_msh}")
        
#         gmsh.finalize()

# if __name__ == "__main__":
#     generator = STLGen(
#     sphere_radius=0.5,
#     cylinder_radius=0.25,
#     graph_path="../tmp",
#     output_path="../tmp"
#     )
#     generator.generate_stl_single_instance()
#     # Generar la estructura con bloques de 5 capas cada uno
#     # final_stl, final_msh = generator.generate_stl(block_size=2)


import numpy as np
import networkx as nx
import gmsh
import sys
import os

def create_reticular_structure(graph, filename="reticular_structure", radius=0.05, mesh_size=0.1):
    """
    Crea una estructura reticular 3D sólida en GMSH a partir de un grafo de NetworkX.
    
    Parámetros:
    - graph: Grafo de NetworkX donde los nodos son posiciones en el espacio (numpy arrays)
               y las aristas son tuplas de nodos conectados
    - filename: Nombre del archivo de salida (sin extensión)
    - radius: Radio de las barras cilíndricas
    - mesh_size: Tamaño de los elementos de la malla
    """
    # Inicializar GMSH
    gmsh.initialize(sys.argv)
    gmsh.model.add(filename)
    
    # Crear diccionario para mapear nodos a IDs de puntos en GMSH
    node_to_point_id = {}
    spheres = []

    for i, node in enumerate(graph.nodes()):
        pos = graph.nodes[node]['pos'] if 'pos' in graph.nodes[node] else node
        x, y, z = pos
        point_id = gmsh.model.occ.addPoint(float(x), float(y), float(z), meshSize=mesh_size)
        spheres.append((3, gmsh.model.occ.addSphere(float(x), float(y), float(z), 2*radius)))
        node_to_point_id[node] = point_id
    
    # Crear volúmenes para cada arista (cilindros)
    cylinder_volumes = []
    
    for i, (u, v) in enumerate(graph.edges()):
        # Obtener las posiciones de los nodos
        pos_u = graph.nodes[u]['pos'] if 'pos' in graph.nodes[u] else u
        pos_v = graph.nodes[v]['pos'] if 'pos' in graph.nodes[v] else v
        
        # Puntos iniciales y finales
        p1_id = node_to_point_id[u]
        p2_id = node_to_point_id[v]
        
        # Crear línea entre puntos
        line_id = gmsh.model.occ.addLine(p1_id, p2_id)
        
        # Calcular vector de dirección de la línea
        dir_vec = np.array(pos_v) - np.array(pos_u)
        length = np.linalg.norm(dir_vec)
        
        # Si los puntos están demasiado cerca, omitir esta arista
        if length < 1e-10:
            continue
        
        # Normalizar vector de dirección
        dir_vec = dir_vec / length
        
        # Encontrar vector perpendicular para definir el plano del círculo
        # Elegir cualquier vector perpendicular al vector de dirección
        if abs(dir_vec[0]) < abs(dir_vec[1]):
            perp_vec = np.array([1.0, 0.0, 0.0])
        else:
            perp_vec = np.array([0.0, 1.0, 0.0])
        
        # Hacer que perp_vec sea realmente perpendicular a dir_vec
        perp_vec = perp_vec - np.dot(perp_vec, dir_vec) * dir_vec
        perp_vec = perp_vec / np.linalg.norm(perp_vec)
        
        # Vector perpendicular adicional (producto cruz)
        perp_vec2 = np.cross(dir_vec, perp_vec)
        
        # Crear puntos para el círculo en el inicio
        circle_points1 = []
        num_points = 8  # Número de puntos en el círculo (ajustar según la precisión deseada)
        
        for j in range(num_points):
            angle = 2 * np.pi * j / num_points
            circle_vec = radius * (perp_vec * np.cos(angle) + perp_vec2 * np.sin(angle))
            circle_pos = np.array(pos_u) + circle_vec
            p_id = gmsh.model.occ.addPoint(float(circle_pos[0]), float(circle_pos[1]), 
                                          float(circle_pos[2]), meshSize=mesh_size)
            circle_points1.append(p_id)
        
        # Crear puntos para el círculo en el final
        circle_points2 = []
        for j in range(num_points):
            angle = 2 * np.pi * j / num_points
            circle_vec = radius * (perp_vec * np.cos(angle) + perp_vec2 * np.sin(angle))
            circle_pos = np.array(pos_v) + circle_vec
            p_id = gmsh.model.occ.addPoint(float(circle_pos[0]), float(circle_pos[1]), 
                                          float(circle_pos[2]), meshSize=mesh_size)
            circle_points2.append(p_id)
        
        # Crear arcos de círculo en el inicio
        circle_arcs1 = []
        for j in range(num_points):
            # Punto central del arco (proyección del punto inicial de la línea)
            center_id = gmsh.model.occ.addPoint(float(pos_u[0]), float(pos_u[1]), 
                                              float(pos_u[2]), meshSize=mesh_size)
            
            # Crear arco entre puntos consecutivos del círculo
            next_j = (j + 1) % num_points
            arc_id = gmsh.model.occ.addCircleArc(circle_points1[j], center_id, circle_points1[next_j])
            circle_arcs1.append(arc_id)
        
        # Crear arcos de círculo en el final
        circle_arcs2 = []
        for j in range(num_points):
            # Punto central del arco (proyección del punto final de la línea)
            center_id = gmsh.model.occ.addPoint(float(pos_v[0]), float(pos_v[1]), 
                                              float(pos_v[2]), meshSize=mesh_size)
            
            # Crear arco entre puntos consecutivos del círculo
            next_j = (j + 1) % num_points
            arc_id = gmsh.model.occ.addCircleArc(circle_points2[j], center_id, circle_points2[next_j])
            circle_arcs2.append(arc_id)
        
        # Crear líneas que conectan los círculos
        connecting_lines = []
        for j in range(num_points):
            line_id = gmsh.model.occ.addLine(circle_points1[j], circle_points2[j])
            connecting_lines.append(line_id)
        
        # Crear superficies laterales (cuadriláteros)
        lateral_surfaces = []
        for j in range(num_points):
            next_j = (j + 1) % num_points
            
            # Crear un bucle cerrado de líneas (línea 1, arco 2, línea 2 inversa, arco 1 inverso)
            curve_loop_id = gmsh.model.occ.addCurveLoop([
                connecting_lines[j],
                circle_arcs2[j],
                -connecting_lines[next_j],
                -circle_arcs1[j]
            ])
            
            # Crear superficie a partir del bucle
            surface_id = gmsh.model.occ.addSurfaceFilling(curve_loop_id)
            lateral_surfaces.append(surface_id)
        
        # Crear superficie de círculo inicial
        circle_loop1_id = gmsh.model.occ.addCurveLoop(circle_arcs1)
        surface1_id = gmsh.model.occ.addPlaneSurface([circle_loop1_id])
        
        # Crear superficie de círculo final
        circle_loop2_id = gmsh.model.occ.addCurveLoop(circle_arcs2)
        surface2_id = gmsh.model.occ.addPlaneSurface([circle_loop2_id])
        
        # Crear volumen (cilindro)
        all_surfaces = lateral_surfaces + [surface1_id, surface2_id]
        surface_loop_id = gmsh.model.occ.addSurfaceLoop(all_surfaces)
        volume_id = gmsh.model.occ.addVolume([surface_loop_id])
        cylinder_volumes.append(volume_id)
    
    # Fusionar volúmenes que se intersecten

    gmsh.option.setNumber("Geometry.AutoCoherence", 1)
    cyl_fused = gmsh.model.occ.fuse([(3,cylinder_volumes[0])], [(3,x) for x in cylinder_volumes[1:]])
    print(cyl_fused[0])
    print(spheres)
    # gmsh.model.occ.fuse(cyl_fused[0], spheres)
    # Sincronizar el modelo
    gmsh.model.occ.synchronize()
    
    # Generar la malla 3D
    gmsh.option.setNumber("Mesh.Algorithm3D", 1)  # Delaunay para 3D
    gmsh.option.setNumber("Mesh.CharacteristicLengthMin", mesh_size / 2)
    gmsh.option.setNumber("Mesh.CharacteristicLengthMax", mesh_size)
    
    gmsh.model.mesh.generate(3)
    
    # Guardar el modelo
    gmsh.write(f"{filename}.msh")
    
    # Mostrar la interfaz gráfica si se desea
    if '-nopopup' not in sys.argv:
        gmsh.fltk.run()
    
    gmsh.finalize()
    

# Ejemplo de uso:
if __name__ == "__main__":
    # Crear un grafo de ejemplo (reemplazar con tu propio grafo)
    import pickle
    with open("/home/abernadi/exchange/pynite/G_4.pickle", "rb") as f:
        G = pickle.load(f)
        

    print(len(G.nodes()))
    print(len(G.edges()))
    # Agregar nodos con posiciones
    # Ejemplo: estructura cúbica
    # nodes_pos = [
    #     np.array([0, 0, 0]),
    #     np.array([1, 0, 0]),
    #     np.array([1, 1, 0]),
    #     np.array([0, 1, 0]),
    #     np.array([0, 0, 1]),
    #     np.array([1, 0, 1]),
    #     np.array([1, 1, 1]),
    #     np.array([0, 1, 1])
    # ]
    
    # for i, pos in enumerate(nodes_pos):
    #     G.add_node(i, pos=pos)
    
    # # Agregar aristas (conexiones entre nodos)
    # # Base inferior
    # G.add_edge(0, 1)
    # G.add_edge(1, 2)
    # G.add_edge(2, 3)
    # G.add_edge(3, 0)
    
    # # Base superior
    # G.add_edge(4, 5)
    # G.add_edge(5, 6)
    # G.add_edge(6, 7)
    # G.add_edge(7, 4)
    
    # # Pilares
    # G.add_edge(0, 4)
    # G.add_edge(1, 5)
    # G.add_edge(2, 6)
    # G.add_edge(3, 7)
    
    # Crear la estructura reticular
    create_reticular_structure(G, "cubic_structure", radius=0.05, mesh_size=0.1)