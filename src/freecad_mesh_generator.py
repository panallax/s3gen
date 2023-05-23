import sys
FREECADPATH = "/usr/lib/freecad-python3/lib"

class FreeCADMeshGenerator():

    def __init__(self, fc_path, **kwargs):
        
        if fc_path:
            sys.path.append(fc_path)
            import FreeCAD, Part, MeshPart

        else:
            try:
                sys.path.append(FREECADPATH)
                import FreeCAD, Part, MeshPart
            except:
                print("FreeCAD path not found")
        
    def generate_cylinder(self, radius, height= 1, iso= True):

        App.newDocument()
        App.setActiveDocument("cylinder")
        App.ActiveDocument = App.getDocument("cylinder")
        
        if iso:
            cylinder = Part.makeCylinder(radius, radius/0.4)
        else:
            cylinder = Part.makeCylinder(radius, height)

        msh = FreeCAD.ActiveDocument.addObject("Mesh::Feature", "Mesh")
        msh.Mesh = MeshPart.meshFromShape(Shape=cylinder.Shape, MaxLength=1)


        return msh