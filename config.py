FREECADPATH = "/lib/freecad-source/build/lib"
OUTPUTPATH = "data/output"
DATAPAHT = "data"
TMPPATH = "tmp"
STLFILE = "data/Cylinder.stl"
PORERADIUS = 5 #mm


###### 3D Printing Parameters ######

EXTRUSIONWIDTH = 0.4    # Extrusion width in mm
FILAMENTWIDTH = 1.75    # Filament width in mm
LAYERHEIGHT = 0.65 * EXTRUSIONWIDTH  # Layer height in mm
FEEDRATE = 9000    # Feedrate in mm/min
NO_PLANAR_FEEDRATE = 5  # Feedrate in mm/min for non-planar movements
BEDTEMP = 60    # Bed temperature in Celsius
EXTRUDERTEMP = 210  # Extruder temperature in Celsius
BEDDIMENSIONS = (200, 200) # Bed dimensions in mm

BOTTOMLAYERS = 4    # Number of layers to print at the bottom
TOPLAYERS = 4    # Number of layers to print at the top