FREECADPATH = "/lib/freecad-source/build/lib"
OUTPUTPATH = "data/output"
DATAPAHT = "data"
TMPPATH = "tmp"
STLFILE = "data/Part.stl"
PORERADIUS = None #mm
POREAREA = 80

###### 3D Printing Parameters ######

EXTRUSIONWIDTH = 0.8    # Extrusion width in mm
OUTTER_RADIUS = 0.55    # Outter radius in mm
FILAMENTWIDTH = 1.75    # Filament width in mm
LAYERHEIGHT = 0.5 * EXTRUSIONWIDTH  # Layer height in mm
FEEDRATE = 9000    # Feedrate in mm/min
NO_PLANAR_FEEDRATE = 10  # Feedrate in mm/min for non-planar movements
BEDTEMP = 60    # Bed temperature in Celsius
EXTRUDERTEMP = 200  # Extruder temperature in Celsius 140 PCL 210 PLA
BEDDIMENSIONS = (200, 200) # Bed dimensions in mm

BOTTOMLAYERS = 2    # Number of layers to print at the bottom
TOPLAYERS = 2    # Number of layers to print at the top


###### Mesh Parameters ######

INITIAL_SPHERE_RADIUS = 3
INITIAL_CYLINDER_RADIUS = 2