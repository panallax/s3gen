import numpy as np
from collections import defaultdict
from itertools import combinations, chain
import trimesh
import os
import pickle

class STLGen:
        
    def __init__(self, graph_path, thickness, n_sides, output_path, logger):
        self.logger = logger
        self.thickness = thickness
        self.graph = self.load_graph(graph_path)
        self.points = np.array(self.graph.nodes())
        self.n_sides = n_sides
        self.output_path = output_path

    def load_graph(self, pickle_path):
        """
        Load the graph from a pickle file
        """
        with open(pickle_path + "/G.pickle", 'rb') as f:
            self.logger.info("Loading graph from pickle file: {}".format(pickle_path + "/G.pickle", 'rb'))
            return pickle.load(f)
        
    @staticmethod
    def angle_between_edges(e1,e2, n):
        
        v1 = np.array(e1) - n
        v2 = np.array(e2) - n
        v1 = v1 / np.linalg.norm(v1)
        v2 = v2 / np.linalg.norm(v2)
        sin_val = np.linalg.norm(np.cross(v1, v2))
        cos_val = np.dot(v1, v2)
        
        return np.arctan2(sin_val, cos_val)
    
    @staticmethod
    def compute_basis_vectors(normal):

        normal = np.asarray(normal, dtype=np.float64)
        normal /= np.linalg.norm(normal)
        
        ref = np.array([0., 0., 1.])
        if np.abs(np.dot(normal, ref)) > 0.9:
            ref = np.array([1., 0., 0.])
        
        u = np.cross(normal, ref)
        u /= np.linalg.norm(u)
        v = np.cross(normal, u)
        
        return u, v

    @staticmethod
    def vertex_convex_hulls(vertex_polygons):
        vertex_hulls = {
            
            node_idx: [
                trimesh.convex.convex_hull(np.vstack((polygon_data[0], 
                                        list(chain.from_iterable(polygon_data[1:]))))), 
                polygon_data[1:]]
            
            for node_idx, polygon_data in vertex_polygons.items()
        }
        return vertex_hulls
    
    @staticmethod
    def get_normal_polygon(points):
        v1, v2 = points[1] - points[0], points[2] - points[0]
        normal = np.cross(v1, v2)
        return -normal / np.linalg.norm(normal)

    def remove_faces(self, mesh, vertices):
        
        normals = mesh.face_normals
        polygons_normals = np.array([self.get_normal_polygon(v) for v in vertices])
        diff = np.abs(normals[:, None, :] - polygons_normals[None, :, :]) 
        mask =  ~np.any(np.all(diff <= 1e-6, axis=2), axis=1)
        mesh.update_faces(mask)
        return mesh

    def generate_struts(self, edges_dict):
        self.logger.info("Generating struts...")
        return list(
            map(lambda v: self.remove_faces(
                trimesh.convex.convex_hull(np.vstack(v)), v), 
                edges_dict.values())
        )

    def create_polygon(self, center, normal, n_sides, radius=1.0, phase=0):
    
        center = np.asarray(center, dtype=np.float64)
        u, v = self.compute_basis_vectors(normal)
        phase = np.random.rand()*np.pi
        angles = np.linspace(0, 2*np.pi, n_sides, endpoint=False) + phase
        cos_angles = np.cos(angles)
        sin_angles = np.sin(angles)
        
        vertices = (center +
                radius * (np.outer(cos_angles, u) + 
                            np.outer(sin_angles, v)))
        
        return vertices

    def create_edge_polygons(self):
        self.logger.info("Generating polygons in edges...")

        vertex_polygons = {i: [self.points[i]] for i in range(len(self.points))}
        edges_polygons = defaultdict(list)
        
        for idx, node in enumerate(self.graph.nodes()):
            point = np.array(node)
            neigh = np.array(list(self.graph.neighbors(node)))
            comb = combinations(neigh, 2)
            min_angle = min(self.angle_between_edges(*c, point) for c in comb)
            min_leng = min(np.linalg.norm(point - np.array(n)) for n in neigh)
            distance = self.thickness/np.sin(min_angle/2)
            if distance > min_leng:
                distance = min_leng

            for n in neigh:
                edge_vector = point - n
                edge_length = np.linalg.norm(edge_vector)
                edge_direction = edge_vector / edge_length
                center = point - distance*edge_direction
                polygon = self.create_polygon(center, edge_direction, self.n_sides, self.thickness)
                vertex_polygons[idx].append(polygon)
                
                if (node, n) in edges_polygons:
                    edges_polygons[(node,n)].append(polygon)
                elif (n, node) in edges_polygons:
                    edges_polygons[(n,node)].append(polygon)
                else:
                    edges_polygons[(node,n)].append(polygon)
        
        return vertex_polygons, edges_polygons

    def generate_mesh(self, vertex_hulls, struts, loops= 4):
        self.logger.info("Generating mesh...")
        mesh = trimesh.util.concatenate(vertex_hulls + struts)
        mesh.merge_vertices()
        final_mesh = trimesh.Trimesh(vertices= mesh.vertices, faces= mesh.faces)
        final_mesh.show()
        try:
            final_mesh.subdivide_loop(loops)
        except ValueError as e:
            self.logger.error(f"Error while subdividing the mesh: {e}. Retrying with half of loops.")
            new_loops = max(1, int(loops / 2))
            try:
                final_mesh.subdivide_loop(new_loops)
            except ValueError as e:
                self.logger.error(f"Error while subdividing the mesh again: {e}. No subdivision can be made. Saving the original mesh.")
                return final_mesh
            
        return final_mesh

    def graph_to_mesh(self, loops= 4):
        vertex_polygons, edges_polygons = self.create_edge_polygons()
        self.logger.info("Generating vertices hulls...")
        vertex_hulls = self.vertex_convex_hulls(vertex_polygons)
        faceless_vertex_hulls = [self.remove_faces(m,v) for m,v in vertex_hulls.values()]
        struts = self.generate_struts(edges_polygons)
        mesh = self.generate_mesh(faceless_vertex_hulls, struts, loops)

        mesh.export(os.path.join(self.output_path, "mesh.stl"))
        self.logger.success(f"Mesh saved at {self.output_path}")

if __name__ == "__main__":
    from utils.logger import Logger

    pickle_path = "../tmp"
    output_path = "../tmp"
    logger = Logger("main")
    stl = STLGen(graph_path=pickle_path, thickness=0.4 , n_sides= 4, output_path=output_path, logger= logger)
    stl.graph_to_mesh(4)

