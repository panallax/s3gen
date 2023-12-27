import sys
FREECADPATH = "/usr/lib/freecad-python3/lib"
sys.path.append(FREECADPATH)
import FreeCAD

import Part
import MeshPart
import Mesh
# Crear cilindro
radius = 1
height = 2
cylinder = Part.makeCylinder(radius, height)

# Crear malla
mesh = MeshPart.meshFromShape(Shape=cylinder, MaxLength=0.1)

# Exportar malla como STL
print(type(mesh))
mesh.write("./Cylinder.stl")