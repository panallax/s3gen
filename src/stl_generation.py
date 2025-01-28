import trimesh
import numpy as np
import pickle
import multiprocessing
from concurrent.futures import ProcessPoolExecutor, as_completed

class STLGen:
    def __init__(self, sphere_radius, cylinder_radius, graph_path, output_path):
        self.sphere_radius = sphere_radius
        self.cylinder_radius = cylinder_radius
        self.graph = self.load_graph(graph_path)
        self.output_path = output_path
        
    def load_graph(self, pickle_path):
        """
        Load the graph from a pickle file
        """
        with open(pickle_path + "/G.pickle", 'rb') as f:
            return pickle.load(f)
    
    def get_nodes_and_edges(self):
        """
        Convert the graph from NetworkX to numpy arrays
        """
        nodes = np.array(list(self.graph.nodes()))
        edges = np.array(list(self.graph.edges()))
        
        return nodes, edges

    def create_cylinder_between_points(self, start, end):
        """
        Create a cylinder between two points with correct orientation
        """
   
        vector = np.array(end) - np.array(start)
        length = np.linalg.norm(vector)
        direction = vector / length if length != 0 else [1, 0, 0]

        cylinder = trimesh.creation.cylinder(self.cylinder_radius, 
                                             length,
                                             sections=16)
       
        cylinder.apply_translation([0, 0, length/2])
        rotation = trimesh.geometry.align_vectors([0, 0, 1], direction)
        translation = np.eye(4)
        translation[:3, 3] = start
        transform = translation @ rotation

        cylinder.apply_transform(transform)

        return cylinder

    def process_batch(self, batch_data, batch_type):
        """Process a batch of spheres or cylinders"""
        batch_meshes = []
        
        if batch_type == 'spheres':
            for node in batch_data:
                sphere = trimesh.creation.icosphere(
                    radius=self.sphere_radius,
                    subdivisions=2
                )
                sphere.apply_translation(node)
                batch_meshes.append(sphere)
        else:  
            nodes = batch_data['nodes']
            for edge in batch_data['edges']:
                start = edge[0]
                end = edge[1]
                batch_meshes.append(self.create_cylinder_between_points(start, end))
        
        if batch_meshes:
            try:
                combined = trimesh.util.concatenate(batch_meshes)
                if not combined.is_volume:
                    combined.fix_normals()
                    combined.fill_holes()
                if combined.is_volume:
                    return trimesh.boolean.union(batch_meshes, engine='manifold')
                else:
                    return trimesh.util.concatenate(batch_meshes)
        
            except Exception as e:
                print(e)
                return trimesh.util.concatenate(batch_meshes)
        return None

    def generate_stl(self):
        nodes, edges = self.get_nodes_and_edges()
        batch_size = 100
        num_processes = max(1, multiprocessing.cpu_count() - 1)
        meshes = []

        if self.sphere_radius != 0:
            print(f"Processing {len(nodes)} spheres using {num_processes} processes...")
            node_batches = [nodes[i:i+batch_size] for i in range(0, len(nodes), batch_size)]
        
            with ProcessPoolExecutor(max_workers=num_processes) as executor:
                futures = [executor.submit(self.process_batch, batch, 'spheres') 
                        for batch in node_batches]
                
                for i, future in enumerate(as_completed(futures)):
                    result = future.result()
                    if result is not None:
                        meshes.append(result)
                    print(f"Completed sphere batch {i+1}/{len(node_batches)}")
            
        print(f"Processing {len(edges)} cylinders...")
        edge_batches = [edges[i:i+batch_size] for i in range(0, len(edges), batch_size)]
        
        with ProcessPoolExecutor(max_workers=num_processes) as executor:
            futures = [executor.submit(self.process_batch, 
                                    {'nodes': nodes, 'edges': batch}, 
                                    'cylinders') 
                      for batch in edge_batches]
            
            for i, future in enumerate(as_completed(futures)):
                result = future.result()
                if result is not None:
                    meshes.append(result)
                print(f"Completed cylinder batch {i+1}/{len(edge_batches)}")

        print("Joining all results...")
        self.final_mesh = meshes[0]
        for i, mesh in enumerate(meshes[1:], 1):
            try:
                tmp_mesh = trimesh.boolean.union([self.final_mesh, mesh], engine='manifold')
                if tmp_mesh.is_volume:
                    self.final_mesh = tmp_mesh
                    print(f"Joined {i+1}/{len(meshes)} components")
                else:
                    self.final_mesh = trimesh.util.concatenate([self.final_mesh, mesh])
                    print(f"Concatenated {i+1}/{len(meshes)} components (fallback)")
            except:
                self.final_mesh = trimesh.util.concatenate([self.final_mesh, mesh])
                print(f"Concatenated {i+1}/{len(meshes)} components (fallback)")
        
        print("Cleaning final mesh...")
        self.final_mesh.update_faces(self.final_mesh.unique_faces())
        self.final_mesh.update_faces(self.final_mesh.nondegenerate_faces())
        self.final_mesh.fill_holes()
        self.final_mesh.fix_normals()
        
        self.save_mesh()

    def save_mesh(self):
        """
        Save the mesh in STL format
        """
        print("Saving mesh...")
        self.final_mesh.export(self.output_path + "/mesh.stl")

if __name__ == "__main__":
    pickle_path = "../tmp/G.pickle"
    output_path = "../tmp"
    
    generator = STLGen(
        pickle_path=pickle_path,
        sphere_radius=2,
        cylinder_radius=1
    )
    
    mesh = generator.generate_stl()
    
    generator.save_mesh(mesh, output_path)
    print(f"Mesh saved in: {output_path}")

    mesh.show()