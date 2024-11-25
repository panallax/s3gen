import sys
import config
import pickle
import os
sys.path.append(config.FREECADPATH)
import FreeCAD as App
import Part
import MeshPart, Mesh

class STLGen():

    def __init__(self, graph_path, output_path, **kwargs):
        
        self.G = pickle.load(open(os.path.join(graph_path, "G.pickle"), 'rb'))
        self.output_path = output_path

    def __create_cylinder(self,point1, point2, diameter):
        delta = point2.sub(point1)
        cylinder = Part.makeCylinder(diameter / 2.0, delta.Length, point1, delta)  
    
        return cylinder
    
    def __create_sphere(self,center, radius):
        sphere = Part.makeSphere(radius, center)

        return sphere

    def generate_stl(self):
            
        doc = App.newDocument()
        objs = []
        for n in self.G.nodes():
            objs.append(self.__create_sphere(App.Vector(*n), 0.4))

        for e in self.G.edges():
            objs.append(self.__create_cylinder(App.Vector(*e[0]), App.Vector(*e[1]), 0.8))

        
        objsShapes = list(map(lambda obj : Part.Shape(obj), objs))
        final_shape = Part.makeCompound(objsShapes)
        Part.show(final_shape, "final_shape")
        doc.recompute()
        mesh = MeshPart.meshFromShape(final_shape, LinearDeflection=0.01, AngularDeflection=0.523599, Relative=False)
        # doc.saveAs(os.path.join(self.output_path, "mesh.FCStd")) 
        mesh.write(os.path.join(self.output_path, "mesh.stl"))