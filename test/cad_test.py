# import FreeCAD as App
# import Part

def create_cylinder_between_points(doc, point1, point2, diameter):
    cylinder = doc.addObject("Part::Cylinder", "Cylinder")
    cylinder.Radius = diameter / 2.0
    cylinder.Height = (point2 - point1).Length
    cylinder.Placement.Base = point1
    return cylinder

def create_sphere_at_point(doc, center, radius,i):
    sphere = doc.addObject("Part::Sphere", "Sphere"+i)
    sphere.Radius = radius
    sphere.Placement.Base = center
    return sphere

def fillet_edges(obj, radius):
    if obj:
        fillet = obj.newObject("Part::Fillet", "Fillet")
        fillet.Edges = [obj.Shape.Edges[i] for i in range(len(obj.Shape.Edges))]
        fillet.Radius = radius
        return fillet
    else:
        return None

def main():

    import sys
    FREECADPATH = "/usr/lib/freecad-python3/lib"

    sys.path.append(FREECADPATH)
    import FreeCAD as App
    import Part
    import numpy as np
    import pickle
    nodes = pickle.load(open('filename.pickle', 'rb'))
    
    doc = App.newDocument()

    for n in nodes:
        c = Part.makeSphere(0.01, App.Vector(n))

    # Part.show(c)
    # doc.addObject("Part::Cylinder", "cube").Shape = c
    # c1 = Part.makeCylinder(1, 10, App.Vector(0, 0, 0), App.Vector(1, 0, 0))
    # # Part.show(c1)
    # # doc.addObject("Part::Cylinder", "cube1").Shape = c1
    # c2 = Part.makeSphere(2, App.Vector(1, 0, 0))
    # # c3 = Part.makeSphere(2, App.Vector(1, 2, 5))
    # # Part.show(c2)
    # a = c2.multiFuse([c,c1])
    # Part.show(a)
    # a.exportStl("test.stl",0.01)

    # c = doc.addObject("Part::Cylinder", "cylinder")
    # c.Radius = 0.1
    # c.Height = 10
    # c.Placement = App.Placement(App.Vector(-1, 0, 0), App.Rotation(App.Vector(1, 0, 1),90))

    # c2 = doc.addObject("Part::Sphere", "sphere")
    # c2.Radius = 0.1
    # c2.Placement = App.Placement(App.Vector(1, 0, 0), App.Rotation(App.Vector(0, 0, 1), 0))

    # obs = (c,c1,c2)
    # print(obs)
    # doc.addObject("Part::MultiFuse", "MultiFuse").Shapes = doc.findObjects()  
    # doc.Refine = True

    # cylinder1 = create_cylinder_between_points(doc, App.Vector(0, 0, 0), App.Vector(1, 1, 1), 0.2)
    # sphere1 = create_sphere_at_point(doc, App.Vector(0,0,0), 0.3, i="1")
    # sphere1 = create_sphere_at_point(doc, App.Vector(0,0,0), 0.3, i="2")
    # doc.addObject("Part::Fuse", "Fusion")
    # doc.Fusion.Base = App.activeDocument().Sphere1
    # doc.Fusion.Tool = App.activeDocument().Cylinder
    # doc.addObject("Part::Fillet", "Fillet")
    # doc.Fillet.Base = App.activeDocument().Fusion
    # fil = []
    # for i in doc.findObjects():
                             
    #     print(i.Label)
    # print(doc.getObjectsByLabel("Cylinder")[0].Shape.Edges[0].values())

    # for i in range(len(App.activeDocument().Fusion.Shape.Edges)):
    #     print("AQAAa")
    #     print((App.activeDocument().Fusion.Shape.Edges[i]))
    #     fil.append((App.activeDocument().Fusion.Shape.Edges[i], 0.1))
    # doc.Fillet.Edges = fil
    # doc.Fillet.Edges = [(App.activeDocument().Fusion.Shape.Edges[i], 0.1) for i in range(len(App.activeDocument().Fusion.Shape.Edges))]




    # Guardar el documento
    doc.recompute()
    doc.saveAs("fillet_example.FCStd")

if __name__ == "__main__":
    main()
