G21    ;set units to millimeters
G90    ;use absolute coordinates
G92 E0    ;reset extruder position
G28    ;home all axes
M83    ;use relative distances for extrusion
M190 S60    ;set bed temperature to 60 and wait
M109 S210    ;set extruder temperature to 200 and wait
G0 X5 Y5 Z0.26
G1 F600
G1 Y150 E7.576
G1 Y5 E7.576
G0 X100.000 Y100.000 Z0.260 F9000    ;move to origin
G92 X0 Y0 Z0    ;set current position as origin
; start base printing
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.000    ;go down to the initial point
G1 X-5.835 Y0.988 Z0.000 E0.230
G1 X-3.118 Y4.337 Z0.000 E0.225
G1 X-7.331 Y6.802 Z0.000 E0.255
G1 X-5.835 Y0.988 Z0.000 E0.314
G1 X-3.342 Y-2.531 Z0.000 E0.225
G1 X-6.617 Y-7.498 Z0.000 E0.311
G1 X-9.010 Y-4.339 Z0.000 E0.207
G1 X-3.342 Y-2.531 Z0.000 E0.311
G1 X1.654 Y-4.420 Z0.000 E0.279
G1 X0.747 Y-9.972 Z0.000 E0.294
G1 X-3.185 Y-9.479 Z0.000 E0.207
G1 X-1.788 Y-5.972 Z0.000 E0.197
G1 X0.747 Y-9.972 Z0.000 E0.247
G1 X4.562 Y-8.899 Z0.000 E0.207
G1 X1.654 Y-4.420 Z0.000 E0.279
G1 X-1.788 Y-5.972 Z0.000 E0.197
G1 X-3.342 Y-2.531 Z0.000 E0.197
G1 X0.929 Y1.609 Z0.000 E0.311
G1 X1.654 Y-4.420 Z0.000 E0.317
G1 X7.660 Y-6.428 Z0.000 E0.331
G1 X5.315 Y-0.532 Z0.000 E0.332
G1 X9.950 Y0.996 Z0.000 E0.255
G1 X9.556 Y-2.948 Z0.000 E0.207
G1 X5.315 Y-0.532 Z0.000 E0.255
G1 X8.782 Y4.783 Z0.000 E0.332
G1 X9.950 Y0.996 Z0.000 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.000    ;go down to the initial point
G1 X0.929 Y1.609 Z0.000 E0.443
G1 X-5.835 Y0.988 Z0.000 E0.355
G1 X-9.010 Y-4.339 Z0.000 E0.324
G1 X-9.988 Y-0.498 Z0.000 E0.207
G1 X-9.397 Y3.420 Z0.000 E0.207
G1 X-5.835 Y0.988 Z0.000 E0.225
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.000    ;go down to the initial point
G1 X-7.331 Y6.802 Z0.000 E0.207
G1 X-4.113 Y9.115 Z0.000 E0.207
G1 X-3.118 Y4.337 Z0.000 E0.255
G1 X-0.249 Y9.997 Z0.000 E0.332
G1 X-4.113 Y9.115 Z0.000 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.000    ;go down to the initial point
G1 X0.929 Y1.609 Z0.000 E0.443
G1 X5.315 Y-0.532 Z0.000 E0.255
G1 X1.654 Y-4.420 Z0.000 E0.279
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.000    ;go down to the initial point
G1 X6.235 Y7.818 Z0.000 E0.427
G1 X3.653 Y9.309 Z0.000 E0.156
G1 X0.929 Y1.609 Z0.000 E0.427
G1 X-3.118 Y4.337 Z0.000 E0.255
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.000    ;go down to the initial point
G1 X-0.249 Y9.997 Z0.000 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.000    ;go down to the initial point
G1 X8.782 Y4.783 Z0.000 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.000    ;go down to the initial point
G1 X7.660 Y-6.428 Z0.000 E0.207
G1 X4.562 Y-8.899 Z0.000 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.000    ;go down to the initial point
G1 X-6.617 Y-7.498 Z0.000 E0.265
G1 X-3.185 Y-9.479 Z0.000 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.260    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.260    ;go down to the initial point
G1 X-5.835 Y0.988 Z0.260 E0.230
G1 X-3.118 Y4.337 Z0.260 E0.225
G1 X-7.331 Y6.802 Z0.260 E0.255
G1 X-5.835 Y0.988 Z0.260 E0.314
G1 X-3.342 Y-2.531 Z0.260 E0.225
G1 X-6.617 Y-7.498 Z0.260 E0.311
G1 X-9.010 Y-4.339 Z0.260 E0.207
G1 X-3.342 Y-2.531 Z0.260 E0.311
G1 X1.654 Y-4.420 Z0.260 E0.279
G1 X0.747 Y-9.972 Z0.260 E0.294
G1 X-3.185 Y-9.479 Z0.260 E0.207
G1 X-1.788 Y-5.972 Z0.260 E0.197
G1 X0.747 Y-9.972 Z0.260 E0.247
G1 X4.562 Y-8.899 Z0.260 E0.207
G1 X1.654 Y-4.420 Z0.260 E0.279
G1 X-1.788 Y-5.972 Z0.260 E0.197
G1 X-3.342 Y-2.531 Z0.260 E0.197
G1 X0.929 Y1.609 Z0.260 E0.311
G1 X1.654 Y-4.420 Z0.260 E0.317
G1 X7.660 Y-6.428 Z0.260 E0.331
G1 X5.315 Y-0.532 Z0.260 E0.332
G1 X9.950 Y0.996 Z0.260 E0.255
G1 X9.556 Y-2.948 Z0.260 E0.207
G1 X5.315 Y-0.532 Z0.260 E0.255
G1 X8.782 Y4.783 Z0.260 E0.332
G1 X9.950 Y0.996 Z0.260 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.260    ;go down to the initial point
G1 X0.929 Y1.609 Z0.260 E0.443
G1 X-5.835 Y0.988 Z0.260 E0.355
G1 X-9.010 Y-4.339 Z0.260 E0.324
G1 X-9.988 Y-0.498 Z0.260 E0.207
G1 X-9.397 Y3.420 Z0.260 E0.207
G1 X-5.835 Y0.988 Z0.260 E0.225
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.260    ;go down to the initial point
G1 X-7.331 Y6.802 Z0.260 E0.207
G1 X-4.113 Y9.115 Z0.260 E0.207
G1 X-3.118 Y4.337 Z0.260 E0.255
G1 X-0.249 Y9.997 Z0.260 E0.332
G1 X-4.113 Y9.115 Z0.260 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.260    ;go down to the initial point
G1 X0.929 Y1.609 Z0.260 E0.443
G1 X5.315 Y-0.532 Z0.260 E0.255
G1 X1.654 Y-4.420 Z0.260 E0.279
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.260    ;go down to the initial point
G1 X6.235 Y7.818 Z0.260 E0.427
G1 X3.653 Y9.309 Z0.260 E0.156
G1 X0.929 Y1.609 Z0.260 E0.427
G1 X-3.118 Y4.337 Z0.260 E0.255
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.260    ;go down to the initial point
G1 X-0.249 Y9.997 Z0.260 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.260    ;go down to the initial point
G1 X8.782 Y4.783 Z0.260 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.260    ;go down to the initial point
G1 X7.660 Y-6.428 Z0.260 E0.207
G1 X4.562 Y-8.899 Z0.260 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.260    ;go down to the initial point
G1 X-6.617 Y-7.498 Z0.260 E0.265
G1 X-3.185 Y-9.479 Z0.260 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.520    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.520    ;go down to the initial point
G1 X-5.835 Y0.988 Z0.520 E0.230
G1 X-3.118 Y4.337 Z0.520 E0.225
G1 X-7.331 Y6.802 Z0.520 E0.255
G1 X-5.835 Y0.988 Z0.520 E0.314
G1 X-3.342 Y-2.531 Z0.520 E0.225
G1 X-6.617 Y-7.498 Z0.520 E0.311
G1 X-9.010 Y-4.339 Z0.520 E0.207
G1 X-3.342 Y-2.531 Z0.520 E0.311
G1 X1.654 Y-4.420 Z0.520 E0.279
G1 X0.747 Y-9.972 Z0.520 E0.294
G1 X-3.185 Y-9.479 Z0.520 E0.207
G1 X-1.788 Y-5.972 Z0.520 E0.197
G1 X0.747 Y-9.972 Z0.520 E0.247
G1 X4.562 Y-8.899 Z0.520 E0.207
G1 X1.654 Y-4.420 Z0.520 E0.279
G1 X-1.788 Y-5.972 Z0.520 E0.197
G1 X-3.342 Y-2.531 Z0.520 E0.197
G1 X0.929 Y1.609 Z0.520 E0.311
G1 X1.654 Y-4.420 Z0.520 E0.317
G1 X7.660 Y-6.428 Z0.520 E0.331
G1 X5.315 Y-0.532 Z0.520 E0.332
G1 X9.950 Y0.996 Z0.520 E0.255
G1 X9.556 Y-2.948 Z0.520 E0.207
G1 X5.315 Y-0.532 Z0.520 E0.255
G1 X8.782 Y4.783 Z0.520 E0.332
G1 X9.950 Y0.996 Z0.520 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.520    ;go down to the initial point
G1 X0.929 Y1.609 Z0.520 E0.443
G1 X-5.835 Y0.988 Z0.520 E0.355
G1 X-9.010 Y-4.339 Z0.520 E0.324
G1 X-9.988 Y-0.498 Z0.520 E0.207
G1 X-9.397 Y3.420 Z0.520 E0.207
G1 X-5.835 Y0.988 Z0.520 E0.225
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.520    ;go down to the initial point
G1 X-7.331 Y6.802 Z0.520 E0.207
G1 X-4.113 Y9.115 Z0.520 E0.207
G1 X-3.118 Y4.337 Z0.520 E0.255
G1 X-0.249 Y9.997 Z0.520 E0.332
G1 X-4.113 Y9.115 Z0.520 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.520    ;go down to the initial point
G1 X0.929 Y1.609 Z0.520 E0.443
G1 X5.315 Y-0.532 Z0.520 E0.255
G1 X1.654 Y-4.420 Z0.520 E0.279
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.520    ;go down to the initial point
G1 X6.235 Y7.818 Z0.520 E0.427
G1 X3.653 Y9.309 Z0.520 E0.156
G1 X0.929 Y1.609 Z0.520 E0.427
G1 X-3.118 Y4.337 Z0.520 E0.255
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.520    ;go down to the initial point
G1 X-0.249 Y9.997 Z0.520 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.520    ;go down to the initial point
G1 X8.782 Y4.783 Z0.520 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.520    ;go down to the initial point
G1 X7.660 Y-6.428 Z0.520 E0.207
G1 X4.562 Y-8.899 Z0.520 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.520    ;go down to the initial point
G1 X-6.617 Y-7.498 Z0.520 E0.265
G1 X-3.185 Y-9.479 Z0.520 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.835 Y0.988 Z0.780 E0.230
G1 X-3.118 Y4.337 Z0.780 E0.225
G1 X-7.331 Y6.802 Z0.780 E0.255
G1 X-5.835 Y0.988 Z0.780 E0.314
G1 X-3.342 Y-2.531 Z0.780 E0.225
G1 X-6.617 Y-7.498 Z0.780 E0.311
G1 X-9.010 Y-4.339 Z0.780 E0.207
G1 X-3.342 Y-2.531 Z0.780 E0.311
G1 X1.654 Y-4.420 Z0.780 E0.279
G1 X0.747 Y-9.972 Z0.780 E0.294
G1 X-3.185 Y-9.479 Z0.780 E0.207
G1 X-1.788 Y-5.972 Z0.780 E0.197
G1 X0.747 Y-9.972 Z0.780 E0.247
G1 X4.562 Y-8.899 Z0.780 E0.207
G1 X1.654 Y-4.420 Z0.780 E0.279
G1 X-1.788 Y-5.972 Z0.780 E0.197
G1 X-3.342 Y-2.531 Z0.780 E0.197
G1 X0.929 Y1.609 Z0.780 E0.311
G1 X1.654 Y-4.420 Z0.780 E0.317
G1 X7.660 Y-6.428 Z0.780 E0.331
G1 X5.315 Y-0.532 Z0.780 E0.332
G1 X9.950 Y0.996 Z0.780 E0.255
G1 X9.556 Y-2.948 Z0.780 E0.207
G1 X5.315 Y-0.532 Z0.780 E0.255
G1 X8.782 Y4.783 Z0.780 E0.332
G1 X9.950 Y0.996 Z0.780 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X0.929 Y1.609 Z0.780 E0.443
G1 X-5.835 Y0.988 Z0.780 E0.355
G1 X-9.010 Y-4.339 Z0.780 E0.324
G1 X-9.988 Y-0.498 Z0.780 E0.207
G1 X-9.397 Y3.420 Z0.780 E0.207
G1 X-5.835 Y0.988 Z0.780 E0.225
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-7.331 Y6.802 Z0.780 E0.207
G1 X-4.113 Y9.115 Z0.780 E0.207
G1 X-3.118 Y4.337 Z0.780 E0.255
G1 X-0.249 Y9.997 Z0.780 E0.332
G1 X-4.113 Y9.115 Z0.780 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X0.929 Y1.609 Z0.780 E0.443
G1 X5.315 Y-0.532 Z0.780 E0.255
G1 X1.654 Y-4.420 Z0.780 E0.279
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X6.235 Y7.818 Z0.780 E0.427
G1 X3.653 Y9.309 Z0.780 E0.156
G1 X0.929 Y1.609 Z0.780 E0.427
G1 X-3.118 Y4.337 Z0.780 E0.255
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-0.249 Y9.997 Z0.780 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X8.782 Y4.783 Z0.780 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X7.660 Y-6.428 Z0.780 E0.207
G1 X4.562 Y-8.899 Z0.780 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-6.617 Y-7.498 Z0.780 E0.265
G1 X-3.185 Y-9.479 Z0.780 E0.207
G1 F5.000
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.185 Y-9.479    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.923 Y-9.813 Z3.140 E0.178
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.747 Y-9.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.923 Y-9.813 Z3.140 E0.216
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.923 Y-9.813 Z3.140 E0.259
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.185 Y-9.479    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-4.165 Y-9.091 Z3.140 E0.173
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.617 Y-7.498    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-4.165 Y-9.091 Z3.140 E0.224
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-4.165 Y-9.091 Z3.140 E0.262
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-9.930 Y1.178 Z3.140 E0.186
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-9.930 Y1.178 Z3.140 E0.204
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-9.930 Y1.178 Z3.140 E0.270
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.245 Y-4.521 Z3.500 E0.200
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.245 Y-4.521 Z3.500 E0.237
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.245 Y-4.521 Z3.500 E0.237
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.331 Y6.802    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.862 Y8.102 Z3.819 E0.224
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.113 Y9.115    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.862 Y8.102 Z3.819 E0.226
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.862 Y8.102 Z3.819 E0.315
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.950 Y0.996    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.974 Y-0.721 Z3.819 E0.219
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.974 Y-0.721 Z3.819 E0.232
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.974 Y-0.721 Z3.819 E0.315
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-8.906 Y4.549 Z3.819 E0.210
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.331 Y6.802    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-8.906 Y4.549 Z3.819 E0.246
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-8.906 Y4.549 Z3.819 E0.316
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.191 Y3.982 Z4.250 E0.248
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.191 Y3.982 Z4.250 E0.274
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.331 Y6.802    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.191 Y3.982 Z4.250 E0.289
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X0.067 Y-6.504 Z4.250 E0.244
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X0.067 Y-6.504 Z4.250 E0.261
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.747 Y-9.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X0.067 Y-6.504 Z4.250 E0.289
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X2.745 Y-0.959 Z4.350 E0.265
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X2.745 Y-0.959 Z4.350 E0.280
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X2.745 Y-0.959 Z4.350 E0.296
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-0.317 Y-1.902 Z4.450 E0.283
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-0.317 Y-1.902 Z4.450 E0.286
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-0.317 Y-1.902 Z4.450 E0.303
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-9.930 Y-1.178 Z4.499 E0.238
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.010 Y-4.339    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-9.930 Y-1.178 Z4.499 E0.291
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-9.930 Y-1.178 Z4.499 E0.337
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.950 Y0.996    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.820 Y1.891 Z4.499 E0.240
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.820 Y1.891 Z4.499 E0.285
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.820 Y1.891 Z4.499 E0.356
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.562 Y-8.899    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X2.751 Y-9.614 Z4.499 E0.256
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.747 Y-9.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X2.751 Y-9.614 Z4.499 E0.258
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X2.751 Y-9.614 Z4.499 E0.364
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.113 Y9.115    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-2.689 Y9.632 Z4.499 E0.248
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-2.689 Y9.632 Z4.499 E0.268
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-2.689 Y9.632 Z4.499 E0.364
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.105 Y-4.135 Z4.499 E0.244
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.660 Y-6.428    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.105 Y-4.135 Z4.499 E0.274
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.105 Y-4.135 Z4.499 E0.360
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-3.561 Y-5.196 Z4.600 E0.261
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-3.561 Y-5.196 Z4.600 E0.278
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.617 Y-7.498    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-3.561 Y-5.196 Z4.600 E0.313
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-2.826 Y2.584 Z4.650 E0.260
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-2.826 Y2.584 Z4.650 E0.301
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-2.826 Y2.584 Z4.650 E0.316
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X4.717 Y-3.641 Z4.850 E0.302
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X4.717 Y-3.641 Z4.850 E0.303
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.660 Y-6.428    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X4.717 Y-3.641 Z4.850 E0.330
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.743 Y-1.738 Z5.000 E0.293
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.743 Y-1.738 Z5.000 E0.298
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.010 Y-4.339    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.743 Y-1.738 Z5.000 E0.340
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.010 Y-4.339    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-8.082 Y-5.888 Z5.178 E0.287
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.617 Y-7.498    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-8.082 Y-5.888 Z5.178 E0.293
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-8.082 Y-5.888 Z5.178 E0.407
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.562 Y-8.899    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X5.915 Y-8.063 Z5.178 E0.283
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.660 Y-6.428    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X5.915 Y-8.063 Z5.178 E0.298
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X5.915 Y-8.063 Z5.178 E0.399
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-3.086 Y-0.235 Z5.300 E0.302
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-3.086 Y-0.235 Z5.300 E0.318
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-3.086 Y-0.235 Z5.300 E0.360
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X4.770 Y1.482 Z6.200 E0.342
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X4.770 Y1.482 Z6.200 E0.381
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X4.770 Y1.482 Z6.200 E0.423
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.126 Y4.866 Z6.250 E0.344
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.126 Y4.866 Z6.250 E0.384
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.126 Y4.866 Z6.250 E0.425
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X5.262 Y8.503 Z7.896 E0.417
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X5.262 Y8.503 Z7.896 E0.423
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X5.262 Y8.503 Z7.896 E0.593
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X1.600 Y9.871 Z7.896 E0.424
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X1.600 Y9.871 Z7.896 E0.427
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X1.600 Y9.871 Z7.896 E0.598
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X7.637 Y6.456 Z7.896 E0.425
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X7.637 Y6.456 Z7.896 E0.426
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X7.637 Y6.456 Z7.896 E0.598
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X-3.635 Y3.227 Z30.000 E1.251
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.086 Y-0.235    ;move above the initial point
G0 Z6.080    ;go down to the initial point
G1 X-3.635 Y3.227 Z30.000 E1.303
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.826 Y2.584    ;move above the initial point
G0 Z5.430    ;go down to the initial point
G1 X-3.635 Y3.227 Z30.000 E1.326
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-3.635 Y3.227 Z30.000 E1.348
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.317 Y-1.902    ;move above the initial point
G0 Z5.230    ;go down to the initial point
G1 X0.223 Y-0.606 Z30.000 E1.337
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.826 Y2.584    ;move above the initial point
G0 Z5.430    ;go down to the initial point
G1 X0.223 Y-0.606 Z30.000 E1.344
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.745 Y-0.959    ;move above the initial point
G0 Z5.130    ;go down to the initial point
G1 X0.223 Y-0.606 Z30.000 E1.347
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.086 Y-0.235    ;move above the initial point
G0 Z6.080    ;go down to the initial point
G1 X-1.334 Y-1.990 Z30.000 E1.297
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.317 Y-1.902    ;move above the initial point
G0 Z5.230    ;go down to the initial point
G1 X-1.334 Y-1.990 Z30.000 E1.336
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.826 Y2.584    ;move above the initial point
G0 Z5.430    ;go down to the initial point
G1 X-1.334 Y-1.990 Z30.000 E1.348
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.245 Y-4.521    ;move above the initial point
G0 Z4.280    ;go down to the initial point
G1 X-1.334 Y-1.990 Z30.000 E1.391
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y-5.888    ;move above the initial point
G0 Z5.958    ;go down to the initial point
G1 X-5.651 Y-4.235 Z30.000 E1.306
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.743 Y-1.738    ;move above the initial point
G0 Z5.780    ;go down to the initial point
G1 X-5.651 Y-4.235 Z30.000 E1.313
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380    ;go down to the initial point
G1 X-5.651 Y-4.235 Z30.000 E1.332
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X-4.221 Y5.495 Z30.000 E1.252
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-4.221 Y5.495 Z30.000 E1.349
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X-4.221 Y5.495 Z30.000 E1.377
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X-1.151 Y2.850 Z30.000 E1.245
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.826 Y2.584    ;move above the initial point
G0 Z5.430    ;go down to the initial point
G1 X-1.151 Y2.850 Z30.000 E1.327
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.745 Y-0.959    ;move above the initial point
G0 Z5.130    ;go down to the initial point
G1 X-1.151 Y2.850 Z30.000 E1.370
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980    ;go down to the initial point
G1 X3.458 Y-1.932 Z30.000 E1.258
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630    ;go down to the initial point
G1 X3.458 Y-1.932 Z30.000 E1.319
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.745 Y-0.959    ;move above the initial point
G0 Z5.130    ;go down to the initial point
G1 X3.458 Y-1.932 Z30.000 E1.342
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.317 Y-1.902    ;move above the initial point
G0 Z5.230    ;go down to the initial point
G1 X3.458 Y-1.932 Z30.000 E1.349
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980    ;go down to the initial point
G1 X2.856 Y1.157 Z30.000 E1.248
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X2.856 Y1.157 Z30.000 E1.273
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.745 Y-0.959    ;move above the initial point
G0 Z5.130    ;go down to the initial point
G1 X2.856 Y1.157 Z30.000 E1.345
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.086 Y-0.235    ;move above the initial point
G0 Z6.080    ;go down to the initial point
G1 X-2.427 Y-4.463 Z30.000 E1.310
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380    ;go down to the initial point
G1 X-2.427 Y-4.463 Z30.000 E1.329
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-2.427 Y-4.463 Z30.000 E1.356
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630    ;go down to the initial point
G1 X1.318 Y-4.005 Z30.000 E1.326
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.317 Y-1.902    ;move above the initial point
G0 Z5.230    ;go down to the initial point
G1 X1.318 Y-4.005 Z30.000 E1.342
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X1.318 Y-4.005 Z30.000 E1.353
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380    ;go down to the initial point
G1 X-2.280 Y-7.333 Z30.000 E1.333
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-2.280 Y-7.333 Z30.000 E1.352
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.923 Y-9.813    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X-2.280 Y-7.333 Z30.000 E1.409
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.165 Y-9.091    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X-2.280 Y-7.333 Z30.000 E1.410
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.915 Y-8.063    ;move above the initial point
G0 Z5.958    ;go down to the initial point
G1 X3.764 Y-5.956 Z30.000 E1.306
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630    ;go down to the initial point
G1 X3.764 Y-5.956 Z30.000 E1.320
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X3.764 Y-5.956 Z30.000 E1.359
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.743 Y-1.738    ;move above the initial point
G0 Z5.780    ;go down to the initial point
G1 X-7.024 Y1.094 Z30.000 E1.316
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-7.024 Y1.094 Z30.000 E1.357
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y1.178    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X-7.024 Y1.094 Z30.000 E1.411
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.086 Y-0.235    ;move above the initial point
G0 Z6.080    ;go down to the initial point
G1 X-4.456 Y-1.418 Z30.000 E1.294
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.743 Y-1.738    ;move above the initial point
G0 Z5.780    ;go down to the initial point
G1 X-4.456 Y-1.418 Z30.000 E1.308
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380    ;go down to the initial point
G1 X-4.456 Y-1.418 Z30.000 E1.342
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-4.456 Y-1.418 Z30.000 E1.375
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980    ;go down to the initial point
G1 X6.338 Y-0.900 Z30.000 E1.252
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630    ;go down to the initial point
G1 X6.338 Y-0.900 Z30.000 E1.324
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X6.338 Y-0.900 Z30.000 E1.381
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X2.942 Y4.851 Z30.000 E1.177
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X2.942 Y4.851 Z30.000 E1.259
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980    ;go down to the initial point
G1 X2.942 Y4.851 Z30.000 E1.259
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.915 Y-8.063    ;move above the initial point
G0 Z5.958    ;go down to the initial point
G1 X3.653 Y-9.309 Z30.000 E1.304
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.751 Y-9.614    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X3.653 Y-9.309 Z30.000 E1.333
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X3.653 Y-9.309 Z30.000 E1.366
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.751 Y-9.614    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X-0.249 Y-9.997 Z30.000 E1.342
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-0.249 Y-9.997 Z30.000 E1.358
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.923 Y-9.813    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X-0.249 Y-9.997 Z30.000 E1.406
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.105 Y-4.135    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X9.556 Y-2.948 Z30.000 E1.334
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630    ;go down to the initial point
G1 X9.556 Y-2.948 Z30.000 E1.339
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X9.556 Y-2.948 Z30.000 E1.373
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y-5.888    ;move above the initial point
G0 Z5.958    ;go down to the initial point
G1 X-5.837 Y-8.119 Z30.000 E1.307
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380    ;go down to the initial point
G1 X-5.837 Y-8.119 Z30.000 E1.341
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.165 Y-9.091    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X-5.837 Y-8.119 Z30.000 E1.407
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.000 E1.270
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.689 Y9.632    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.000 E1.335
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.000 E1.372
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.637 Y6.456    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X6.982 Y7.159 Z30.000 E1.156
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X6.982 Y7.159 Z30.000 E1.160
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980    ;go down to the initial point
G1 X6.982 Y7.159 Z30.000 E1.284
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.915 Y-8.063    ;move above the initial point
G0 Z5.958    ;go down to the initial point
G1 X7.660 Y-6.428 Z30.000 E1.303
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630    ;go down to the initial point
G1 X7.660 Y-6.428 Z30.000 E1.331
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.105 Y-4.135    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X7.660 Y-6.428 Z30.000 E1.340
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.600 Y9.871    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X-1.243 Y9.922 Z30.000 E1.164
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X-1.243 Y9.922 Z30.000 E1.269
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.689 Y9.632    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X-1.243 Y9.922 Z30.000 E1.335
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.600 Y9.871    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X2.708 Y9.626 Z30.000 E1.156
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X2.708 Y9.626 Z30.000 E1.164
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X2.708 Y9.626 Z30.000 E1.281
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-8.533 Y5.214 Z30.000 E1.358
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.906 Y4.549    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X-8.533 Y5.214 Z30.000 E1.368
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X-8.533 Y5.214 Z30.000 E1.383
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y1.178    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X-8.533 Y5.214 Z30.000 E1.421
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y-5.888    ;move above the initial point
G0 Z5.958    ;go down to the initial point
G1 X-9.691 Y-2.468 Z30.000 E1.312
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.743 Y-1.738    ;move above the initial point
G0 Z5.780    ;go down to the initial point
G1 X-9.691 Y-2.468 Z30.000 E1.323
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y-1.178    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X-9.691 Y-2.468 Z30.000 E1.334
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y1.178    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X-9.691 Y-2.468 Z30.000 E1.416
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.637 Y6.456    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X9.556 Y2.948 Z30.000 E1.174
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980    ;go down to the initial point
G1 X9.556 Y2.948 Z30.000 E1.271
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.820 Y1.891    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X9.556 Y2.948 Z30.000 E1.334
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X9.556 Y2.948 Z30.000 E1.381
; start top printing
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y2.948    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X9.556 Y-2.948 Z30.000 E0.308
G1 X6.338 Y-0.900 Z30.000 E0.199
G1 X9.556 Y2.948 Z30.000 E0.262
G1 X2.942 Y4.851 Z30.000 E0.360
G1 X-1.151 Y2.850 Z30.000 E0.238
G1 X-4.221 Y5.495 Z30.000 E0.212
G1 X-1.243 Y9.922 Z30.000 E0.279
G1 X-4.113 Y9.115 Z30.000 E0.156
G1 X-4.221 Y5.495 Z30.000 E0.189
G1 X-8.533 Y5.214 Z30.000 E0.226
G1 X-4.113 Y9.115 Z30.000 E0.308
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-8.533 Y5.214    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X-7.024 Y1.094 Z30.000 E0.229
G1 X-4.456 Y-1.418 Z30.000 E0.188
G1 X-9.691 Y-2.468 Z30.000 E0.279
G1 X-7.024 Y1.094 Z30.000 E0.232
G1 X-3.635 Y3.227 Z30.000 E0.209
G1 X-1.151 Y2.850 Z30.000 E0.131
G1 X-1.243 Y9.922 Z30.000 E0.370
G1 X2.942 Y4.851 Z30.000 E0.344
G1 X6.982 Y7.159 Z30.000 E0.243
G1 X9.556 Y2.948 Z30.000 E0.258
G1 X2.856 Y1.157 Z30.000 E0.362
G1 X0.223 Y-0.606 Z30.000 E0.166
G1 X-1.151 Y2.850 Z30.000 E0.194
G1 X2.856 Y1.157 Z30.000 E0.227
G1 X2.942 Y4.851 Z30.000 E0.193
G1 X2.708 Y9.626 Z30.000 E0.250
G1 X-1.243 Y9.922 Z30.000 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.708 Y9.626    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X6.982 Y7.159 Z30.000 E0.258
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X6.338 Y-0.900 Z30.000 E0.211
G1 X7.660 Y-6.428 Z30.000 E0.297
G1 X3.653 Y-9.309 Z30.000 E0.258
G1 X-0.249 Y-9.997 Z30.000 E0.207
G1 X3.764 Y-5.956 Z30.000 E0.298
G1 X3.653 Y-9.309 Z30.000 E0.175
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X7.660 Y-6.428 Z30.000 E0.205
G1 X9.556 Y-2.948 Z30.000 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X6.338 Y-0.900 Z30.000 E0.296
G1 X3.458 Y-1.932 Z30.000 E0.160
G1 X3.764 Y-5.956 Z30.000 E0.211
G1 X1.318 Y-4.005 Z30.000 E0.163
G1 X3.458 Y-1.932 Z30.000 E0.156
G1 X0.223 Y-0.606 Z30.000 E0.183
G1 X1.318 Y-4.005 Z30.000 E0.187
G1 X-2.280 Y-7.333 Z30.000 E0.256
G1 X-0.249 Y-9.997 Z30.000 E0.175
G1 X-5.837 Y-8.119 Z30.000 E0.308
G1 X-5.651 Y-4.235 Z30.000 E0.203
G1 X-2.427 Y-4.463 Z30.000 E0.169
G1 X-4.456 Y-1.418 Z30.000 E0.191
G1 X-1.151 Y2.850 Z30.000 E0.282
G1 X-1.334 Y-1.990 Z30.000 E0.253
G1 X0.223 Y-0.606 Z30.000 E0.109
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.334 Y-1.990    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X1.318 Y-4.005 Z30.000 E0.174
G1 X-2.427 Y-4.463 Z30.000 E0.197
G1 X-2.280 Y-7.333 Z30.000 E0.150
G1 X-5.837 Y-8.119 Z30.000 E0.190
G1 X-9.691 Y-2.468 Z30.000 E0.357
G1 X-8.533 Y5.214 Z30.000 E0.406
G1 X-3.635 Y3.227 Z30.000 E0.276
G1 X-4.456 Y-1.418 Z30.000 E0.246
G1 X-5.651 Y-4.235 Z30.000 E0.160
G1 X-9.691 Y-2.468 Z30.000 E0.230
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-5.651 Y-4.235    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X-2.280 Y-7.333 Z30.000 E0.239
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X-1.334 Y-1.990 Z30.000 E0.166
G1 X-2.427 Y-4.463 Z30.000 E0.141
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-3.635 Y3.227    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X-4.221 Y5.495 Z30.000 E0.122
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X1.318 Y-4.005    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X-0.249 Y-9.997 Z30.000 E0.324
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.458 Y-1.932    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X2.856 Y1.157 Z30.000 E0.164
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y2.948    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y2.948    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X9.556 Y-2.948 Z30.260 E0.308
G1 X6.338 Y-0.900 Z30.260 E0.199
G1 X9.556 Y2.948 Z30.260 E0.262
G1 X2.942 Y4.851 Z30.260 E0.360
G1 X-1.151 Y2.850 Z30.260 E0.238
G1 X-4.221 Y5.495 Z30.260 E0.212
G1 X-1.243 Y9.922 Z30.260 E0.279
G1 X-4.113 Y9.115 Z30.260 E0.156
G1 X-4.221 Y5.495 Z30.260 E0.189
G1 X-8.533 Y5.214 Z30.260 E0.226
G1 X-4.113 Y9.115 Z30.260 E0.308
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-8.533 Y5.214    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X-7.024 Y1.094 Z30.260 E0.229
G1 X-4.456 Y-1.418 Z30.260 E0.188
G1 X-9.691 Y-2.468 Z30.260 E0.279
G1 X-7.024 Y1.094 Z30.260 E0.232
G1 X-3.635 Y3.227 Z30.260 E0.209
G1 X-1.151 Y2.850 Z30.260 E0.131
G1 X-1.243 Y9.922 Z30.260 E0.370
G1 X2.942 Y4.851 Z30.260 E0.344
G1 X6.982 Y7.159 Z30.260 E0.243
G1 X9.556 Y2.948 Z30.260 E0.258
G1 X2.856 Y1.157 Z30.260 E0.362
G1 X0.223 Y-0.606 Z30.260 E0.166
G1 X-1.151 Y2.850 Z30.260 E0.194
G1 X2.856 Y1.157 Z30.260 E0.227
G1 X2.942 Y4.851 Z30.260 E0.193
G1 X2.708 Y9.626 Z30.260 E0.250
G1 X-1.243 Y9.922 Z30.260 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.708 Y9.626    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X6.982 Y7.159 Z30.260 E0.258
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X6.338 Y-0.900 Z30.260 E0.211
G1 X7.660 Y-6.428 Z30.260 E0.297
G1 X3.653 Y-9.309 Z30.260 E0.258
G1 X-0.249 Y-9.997 Z30.260 E0.207
G1 X3.764 Y-5.956 Z30.260 E0.298
G1 X3.653 Y-9.309 Z30.260 E0.175
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X7.660 Y-6.428 Z30.260 E0.205
G1 X9.556 Y-2.948 Z30.260 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X6.338 Y-0.900 Z30.260 E0.296
G1 X3.458 Y-1.932 Z30.260 E0.160
G1 X3.764 Y-5.956 Z30.260 E0.211
G1 X1.318 Y-4.005 Z30.260 E0.163
G1 X3.458 Y-1.932 Z30.260 E0.156
G1 X0.223 Y-0.606 Z30.260 E0.183
G1 X1.318 Y-4.005 Z30.260 E0.187
G1 X-2.280 Y-7.333 Z30.260 E0.256
G1 X-0.249 Y-9.997 Z30.260 E0.175
G1 X-5.837 Y-8.119 Z30.260 E0.308
G1 X-5.651 Y-4.235 Z30.260 E0.203
G1 X-2.427 Y-4.463 Z30.260 E0.169
G1 X-4.456 Y-1.418 Z30.260 E0.191
G1 X-1.151 Y2.850 Z30.260 E0.282
G1 X-1.334 Y-1.990 Z30.260 E0.253
G1 X0.223 Y-0.606 Z30.260 E0.109
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.334 Y-1.990    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X1.318 Y-4.005 Z30.260 E0.174
G1 X-2.427 Y-4.463 Z30.260 E0.197
G1 X-2.280 Y-7.333 Z30.260 E0.150
G1 X-5.837 Y-8.119 Z30.260 E0.190
G1 X-9.691 Y-2.468 Z30.260 E0.357
G1 X-8.533 Y5.214 Z30.260 E0.406
G1 X-3.635 Y3.227 Z30.260 E0.276
G1 X-4.456 Y-1.418 Z30.260 E0.246
G1 X-5.651 Y-4.235 Z30.260 E0.160
G1 X-9.691 Y-2.468 Z30.260 E0.230
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-5.651 Y-4.235    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X-2.280 Y-7.333 Z30.260 E0.239
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X-1.334 Y-1.990 Z30.260 E0.166
G1 X-2.427 Y-4.463 Z30.260 E0.141
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-3.635 Y3.227    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X-4.221 Y5.495 Z30.260 E0.122
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X1.318 Y-4.005    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X-0.249 Y-9.997 Z30.260 E0.324
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.458 Y-1.932    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X2.856 Y1.157 Z30.260 E0.164
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y2.948    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y2.948    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X9.556 Y-2.948 Z30.520 E0.308
G1 X6.338 Y-0.900 Z30.520 E0.199
G1 X9.556 Y2.948 Z30.520 E0.262
G1 X2.942 Y4.851 Z30.520 E0.360
G1 X-1.151 Y2.850 Z30.520 E0.238
G1 X-4.221 Y5.495 Z30.520 E0.212
G1 X-1.243 Y9.922 Z30.520 E0.279
G1 X-4.113 Y9.115 Z30.520 E0.156
G1 X-4.221 Y5.495 Z30.520 E0.189
G1 X-8.533 Y5.214 Z30.520 E0.226
G1 X-4.113 Y9.115 Z30.520 E0.308
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-8.533 Y5.214    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X-7.024 Y1.094 Z30.520 E0.229
G1 X-4.456 Y-1.418 Z30.520 E0.188
G1 X-9.691 Y-2.468 Z30.520 E0.279
G1 X-7.024 Y1.094 Z30.520 E0.232
G1 X-3.635 Y3.227 Z30.520 E0.209
G1 X-1.151 Y2.850 Z30.520 E0.131
G1 X-1.243 Y9.922 Z30.520 E0.370
G1 X2.942 Y4.851 Z30.520 E0.344
G1 X6.982 Y7.159 Z30.520 E0.243
G1 X9.556 Y2.948 Z30.520 E0.258
G1 X2.856 Y1.157 Z30.520 E0.362
G1 X0.223 Y-0.606 Z30.520 E0.166
G1 X-1.151 Y2.850 Z30.520 E0.194
G1 X2.856 Y1.157 Z30.520 E0.227
G1 X2.942 Y4.851 Z30.520 E0.193
G1 X2.708 Y9.626 Z30.520 E0.250
G1 X-1.243 Y9.922 Z30.520 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.708 Y9.626    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X6.982 Y7.159 Z30.520 E0.258
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X6.338 Y-0.900 Z30.520 E0.211
G1 X7.660 Y-6.428 Z30.520 E0.297
G1 X3.653 Y-9.309 Z30.520 E0.258
G1 X-0.249 Y-9.997 Z30.520 E0.207
G1 X3.764 Y-5.956 Z30.520 E0.298
G1 X3.653 Y-9.309 Z30.520 E0.175
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X7.660 Y-6.428 Z30.520 E0.205
G1 X9.556 Y-2.948 Z30.520 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X6.338 Y-0.900 Z30.520 E0.296
G1 X3.458 Y-1.932 Z30.520 E0.160
G1 X3.764 Y-5.956 Z30.520 E0.211
G1 X1.318 Y-4.005 Z30.520 E0.163
G1 X3.458 Y-1.932 Z30.520 E0.156
G1 X0.223 Y-0.606 Z30.520 E0.183
G1 X1.318 Y-4.005 Z30.520 E0.187
G1 X-2.280 Y-7.333 Z30.520 E0.256
G1 X-0.249 Y-9.997 Z30.520 E0.175
G1 X-5.837 Y-8.119 Z30.520 E0.308
G1 X-5.651 Y-4.235 Z30.520 E0.203
G1 X-2.427 Y-4.463 Z30.520 E0.169
G1 X-4.456 Y-1.418 Z30.520 E0.191
G1 X-1.151 Y2.850 Z30.520 E0.282
G1 X-1.334 Y-1.990 Z30.520 E0.253
G1 X0.223 Y-0.606 Z30.520 E0.109
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.334 Y-1.990    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X1.318 Y-4.005 Z30.520 E0.174
G1 X-2.427 Y-4.463 Z30.520 E0.197
G1 X-2.280 Y-7.333 Z30.520 E0.150
G1 X-5.837 Y-8.119 Z30.520 E0.190
G1 X-9.691 Y-2.468 Z30.520 E0.357
G1 X-8.533 Y5.214 Z30.520 E0.406
G1 X-3.635 Y3.227 Z30.520 E0.276
G1 X-4.456 Y-1.418 Z30.520 E0.246
G1 X-5.651 Y-4.235 Z30.520 E0.160
G1 X-9.691 Y-2.468 Z30.520 E0.230
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-5.651 Y-4.235    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X-2.280 Y-7.333 Z30.520 E0.239
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X-1.334 Y-1.990 Z30.520 E0.166
G1 X-2.427 Y-4.463 Z30.520 E0.141
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-3.635 Y3.227    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X-4.221 Y5.495 Z30.520 E0.122
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X1.318 Y-4.005    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X-0.249 Y-9.997 Z30.520 E0.324
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.458 Y-1.932    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X2.856 Y1.157 Z30.520 E0.164
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y2.948    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y2.948    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X9.556 Y-2.948 Z30.780 E0.308
G1 X6.338 Y-0.900 Z30.780 E0.199
G1 X9.556 Y2.948 Z30.780 E0.262
G1 X2.942 Y4.851 Z30.780 E0.360
G1 X-1.151 Y2.850 Z30.780 E0.238
G1 X-4.221 Y5.495 Z30.780 E0.212
G1 X-1.243 Y9.922 Z30.780 E0.279
G1 X-4.113 Y9.115 Z30.780 E0.156
G1 X-4.221 Y5.495 Z30.780 E0.189
G1 X-8.533 Y5.214 Z30.780 E0.226
G1 X-4.113 Y9.115 Z30.780 E0.308
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-8.533 Y5.214    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X-7.024 Y1.094 Z30.780 E0.229
G1 X-4.456 Y-1.418 Z30.780 E0.188
G1 X-9.691 Y-2.468 Z30.780 E0.279
G1 X-7.024 Y1.094 Z30.780 E0.232
G1 X-3.635 Y3.227 Z30.780 E0.209
G1 X-1.151 Y2.850 Z30.780 E0.131
G1 X-1.243 Y9.922 Z30.780 E0.370
G1 X2.942 Y4.851 Z30.780 E0.344
G1 X6.982 Y7.159 Z30.780 E0.243
G1 X9.556 Y2.948 Z30.780 E0.258
G1 X2.856 Y1.157 Z30.780 E0.362
G1 X0.223 Y-0.606 Z30.780 E0.166
G1 X-1.151 Y2.850 Z30.780 E0.194
G1 X2.856 Y1.157 Z30.780 E0.227
G1 X2.942 Y4.851 Z30.780 E0.193
G1 X2.708 Y9.626 Z30.780 E0.250
G1 X-1.243 Y9.922 Z30.780 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.708 Y9.626    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X6.982 Y7.159 Z30.780 E0.258
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X6.338 Y-0.900 Z30.780 E0.211
G1 X7.660 Y-6.428 Z30.780 E0.297
G1 X3.653 Y-9.309 Z30.780 E0.258
G1 X-0.249 Y-9.997 Z30.780 E0.207
G1 X3.764 Y-5.956 Z30.780 E0.298
G1 X3.653 Y-9.309 Z30.780 E0.175
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X7.660 Y-6.428 Z30.780 E0.205
G1 X9.556 Y-2.948 Z30.780 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X6.338 Y-0.900 Z30.780 E0.296
G1 X3.458 Y-1.932 Z30.780 E0.160
G1 X3.764 Y-5.956 Z30.780 E0.211
G1 X1.318 Y-4.005 Z30.780 E0.163
G1 X3.458 Y-1.932 Z30.780 E0.156
G1 X0.223 Y-0.606 Z30.780 E0.183
G1 X1.318 Y-4.005 Z30.780 E0.187
G1 X-2.280 Y-7.333 Z30.780 E0.256
G1 X-0.249 Y-9.997 Z30.780 E0.175
G1 X-5.837 Y-8.119 Z30.780 E0.308
G1 X-5.651 Y-4.235 Z30.780 E0.203
G1 X-2.427 Y-4.463 Z30.780 E0.169
G1 X-4.456 Y-1.418 Z30.780 E0.191
G1 X-1.151 Y2.850 Z30.780 E0.282
G1 X-1.334 Y-1.990 Z30.780 E0.253
G1 X0.223 Y-0.606 Z30.780 E0.109
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.334 Y-1.990    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X1.318 Y-4.005 Z30.780 E0.174
G1 X-2.427 Y-4.463 Z30.780 E0.197
G1 X-2.280 Y-7.333 Z30.780 E0.150
G1 X-5.837 Y-8.119 Z30.780 E0.190
G1 X-9.691 Y-2.468 Z30.780 E0.357
G1 X-8.533 Y5.214 Z30.780 E0.406
G1 X-3.635 Y3.227 Z30.780 E0.276
G1 X-4.456 Y-1.418 Z30.780 E0.246
G1 X-5.651 Y-4.235 Z30.780 E0.160
G1 X-9.691 Y-2.468 Z30.780 E0.230
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-5.651 Y-4.235    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X-2.280 Y-7.333 Z30.780 E0.239
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X-1.334 Y-1.990 Z30.780 E0.166
G1 X-2.427 Y-4.463 Z30.780 E0.141
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-3.635 Y3.227    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X-4.221 Y5.495 Z30.780 E0.122
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X1.318 Y-4.005    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X-0.249 Y-9.997 Z30.780 E0.324
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.458 Y-1.932    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X2.856 Y1.157 Z30.780 E0.164
G1 E-1 F600
G91 
G1 Z10 E-5  ;raise the extruder 1 cm
G0 X-100.0    ;move to the initial point
M104 S0    ;turn off the extruder
M140 S0    ;turn off the bed
M84    ;disable motors
