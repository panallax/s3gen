import sys
# FREECADPATH = "/usr/lib/freecad-python3/lib"
FREECADPATH = "/lib/freecad-source/build/lib"

sys.path.append(FREECADPATH)
import FreeCAD as App
import Part
import numpy as np
import pickle
import time
import Mesh

def create_cylinder_between_points(point1, point2, diameter):
    delta = point2.sub(point1)
    cylinder = Part.makeCylinder(diameter / 2.0, delta.Length, point1, delta)

    return cylinder

def create_sphere_at_point(center, radius):
    sphere = Part.makeSphere(radius, center)

    return sphere

def batchfuse(objs, nbatch):
    n  = len(objs)
    inds = [i* int(n/nbatch) for i in range(nbatch +1)]

    inds[-1] = max(inds[-1], n)
    base = objs[0].fuse(objs[1:inds[1]])
    print(f' 0 : {inds[1]}')
    for j in range(1, len(inds)-1):
        base = base.fuse(objs[inds[j]:inds[j+1]])
        print(f' {inds[j]} : {inds[j+1]}')

    return base

def main():


    G = pickle.load(open('../data/output/G.pickle', 'rb'))
    doc =  App.newDocument()

    objs = []
    for n in G.nodes():
        objs.append(create_sphere_at_point(App.Vector(*n), 0.015))

    for e in G.edges():
        objs.append(create_cylinder_between_points(App.Vector(*e[0]), App.Vector(*e[1]), 0.01))

    # sortedobjs = sorted(objs, key = lambda obj : obj.CenterOfGravity.z)
    objsShapes = list(map(lambda obj : Part.Shape(obj), objs))
    final_shape = Part.makeCompound(objsShapes)
    Part.show(final_shape, "final_shape")
    # a = Mesh.meshFromShape(final_shape, LinearDeflection=0.01, AngularDeflection=0.01)
    # a.write('test.stl')
    # final_shape.exportStl( 'test.stl',0.05)


    doc.recompute()
    doc.saveAs("fillet_exampleb.FCStd")

if __name__ == "__main__":
    main()
