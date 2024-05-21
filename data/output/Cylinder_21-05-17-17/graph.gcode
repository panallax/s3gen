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
G1 X-1.923 Y-9.813 Z3.920 E0.178
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.747 Y-9.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.923 Y-9.813 Z3.920 E0.216
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.923 Y-9.813 Z3.920 E0.259
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.185 Y-9.479    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-4.165 Y-9.091 Z3.920 E0.173
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.617 Y-7.498    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-4.165 Y-9.091 Z3.920 E0.224
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-4.165 Y-9.091 Z3.920 E0.262
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-9.930 Y1.178 Z3.920 E0.186
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-9.930 Y1.178 Z3.920 E0.204
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-9.930 Y1.178 Z3.920 E0.270
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.245 Y-4.521 Z4.280 E0.200
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.245 Y-4.521 Z4.280 E0.237
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.245 Y-4.521 Z4.280 E0.237
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.331 Y6.802    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.862 Y8.102 Z4.599 E0.224
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.113 Y9.115    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.862 Y8.102 Z4.599 E0.226
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.862 Y8.102 Z4.599 E0.315
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.950 Y0.996    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.974 Y-0.721 Z4.599 E0.219
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.974 Y-0.721 Z4.599 E0.232
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.974 Y-0.721 Z4.599 E0.315
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-8.906 Y4.549 Z4.599 E0.210
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.331 Y6.802    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-8.906 Y4.549 Z4.599 E0.246
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-8.906 Y4.549 Z4.599 E0.316
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.191 Y3.982 Z5.030 E0.248
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.191 Y3.982 Z5.030 E0.274
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.331 Y6.802    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.191 Y3.982 Z5.030 E0.289
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X0.067 Y-6.504 Z5.030 E0.244
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X0.067 Y-6.504 Z5.030 E0.261
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.747 Y-9.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X0.067 Y-6.504 Z5.030 E0.289
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X2.745 Y-0.959 Z5.130 E0.265
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X2.745 Y-0.959 Z5.130 E0.280
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X2.745 Y-0.959 Z5.130 E0.296
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-0.317 Y-1.902 Z5.230 E0.283
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-0.317 Y-1.902 Z5.230 E0.286
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-0.317 Y-1.902 Z5.230 E0.303
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-9.930 Y-1.178 Z5.279 E0.238
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.010 Y-4.339    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-9.930 Y-1.178 Z5.279 E0.291
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-9.930 Y-1.178 Z5.279 E0.337
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.950 Y0.996    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.820 Y1.891 Z5.279 E0.240
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.820 Y1.891 Z5.279 E0.285
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.820 Y1.891 Z5.279 E0.356
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.562 Y-8.899    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X2.751 Y-9.614 Z5.279 E0.256
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.747 Y-9.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X2.751 Y-9.614 Z5.279 E0.258
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X2.751 Y-9.614 Z5.279 E0.364
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.113 Y9.115    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-2.689 Y9.632 Z5.279 E0.248
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-2.689 Y9.632 Z5.279 E0.268
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-2.689 Y9.632 Z5.279 E0.364
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.105 Y-4.135 Z5.279 E0.244
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.660 Y-6.428    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.105 Y-4.135 Z5.279 E0.274
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X9.105 Y-4.135 Z5.279 E0.360
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-3.561 Y-5.196 Z5.380 E0.261
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-3.561 Y-5.196 Z5.380 E0.278
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.617 Y-7.498    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-3.561 Y-5.196 Z5.380 E0.313
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-2.826 Y2.584 Z5.430 E0.260
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-2.826 Y2.584 Z5.430 E0.301
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-2.826 Y2.584 Z5.430 E0.316
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X4.717 Y-3.641 Z5.630 E0.302
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X4.717 Y-3.641 Z5.630 E0.303
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.660 Y-6.428    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X4.717 Y-3.641 Z5.630 E0.330
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.743 Y-1.738 Z5.780 E0.293
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.743 Y-1.738 Z5.780 E0.298
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.010 Y-4.339    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-5.743 Y-1.738 Z5.780 E0.340
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.010 Y-4.339    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-8.082 Y-5.888 Z5.958 E0.287
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.617 Y-7.498    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-8.082 Y-5.888 Z5.958 E0.293
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-8.082 Y-5.888 Z5.958 E0.407
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.562 Y-8.899    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X5.915 Y-8.063 Z5.958 E0.283
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.660 Y-6.428    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X5.915 Y-8.063 Z5.958 E0.298
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X5.915 Y-8.063 Z5.958 E0.399
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-3.086 Y-0.235 Z6.080 E0.302
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-3.086 Y-0.235 Z6.080 E0.318
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-3.086 Y-0.235 Z6.080 E0.360
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X4.770 Y1.482 Z6.980 E0.342
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X4.770 Y1.482 Z6.980 E0.381
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X4.770 Y1.482 Z6.980 E0.423
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.126 Y4.866 Z7.030 E0.344
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.126 Y4.866 Z7.030 E0.384
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X-1.126 Y4.866 Z7.030 E0.425
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380    ;go down to the initial point
G1 X-2.280 Y-7.333 Z8.362 E0.203
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-2.280 Y-7.333 Z8.362 E0.217
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.923 Y-9.813    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X-2.280 Y-7.333 Z8.362 E0.266
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.165 Y-9.091    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X-2.280 Y-7.333 Z8.362 E0.268
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X5.262 Y8.503 Z8.676 E0.417
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X5.262 Y8.503 Z8.676 E0.423
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X5.262 Y8.503 Z8.676 E0.593
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X1.600 Y9.871 Z8.676 E0.424
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X1.600 Y9.871 Z8.676 E0.427
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X1.600 Y9.871 Z8.676 E0.598
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X7.637 Y6.456 Z8.676 E0.425
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X7.637 Y6.456 Z8.676 E0.426
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780    ;go down to the initial point
G1 X7.637 Y6.456 Z8.676 E0.598
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.751 Y-9.614    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X0.033 Y-10.000 Z8.676 E0.228
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X0.033 Y-10.000 Z8.676 E0.264
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.923 Y-9.813    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X0.033 Y-10.000 Z8.676 E0.269
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.751 Y-9.614    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X3.499 Y-9.368 Z9.356 E0.217
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.915 Y-8.063    ;move above the initial point
G0 Z5.958    ;go down to the initial point
G1 X3.499 Y-9.368 Z9.356 E0.228
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X3.499 Y-9.368 Z9.356 E0.325
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y-5.888    ;move above the initial point
G0 Z5.958    ;go down to the initial point
G1 X-6.176 Y-7.865 Z9.356 E0.228
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380    ;go down to the initial point
G1 X-6.176 Y-7.865 Z9.356 E0.285
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.165 Y-9.091    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X-6.176 Y-7.865 Z9.356 E0.310
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.915 Y-8.063    ;move above the initial point
G0 Z5.958    ;go down to the initial point
G1 X7.885 Y-6.151 Z9.356 E0.228
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.105 Y-4.135    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X7.885 Y-6.151 Z9.356 E0.246
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630    ;go down to the initial point
G1 X7.885 Y-6.151 Z9.356 E0.287
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.906 Y4.549    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X-8.308 Y5.566 Z9.356 E0.256
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-8.308 Y5.566 Z9.356 E0.291
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X-8.308 Y5.566 Z9.356 E0.309
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y1.178    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X-8.308 Y5.566 Z9.356 E0.375
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.743 Y-1.738    ;move above the initial point
G0 Z5.780    ;go down to the initial point
G1 X-5.651 Y-4.235 Z9.506 E0.234
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y-5.888    ;move above the initial point
G0 Z5.958    ;go down to the initial point
G1 X-5.651 Y-4.235 Z9.506 E0.241
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380    ;go down to the initial point
G1 X-5.651 Y-4.235 Z9.506 E0.247
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.743 Y-1.738    ;move above the initial point
G0 Z5.780    ;go down to the initial point
G1 X-7.024 Y1.094 Z9.510 E0.254
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-7.024 Y1.094 Z9.510 E0.294
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y1.178    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X-7.024 Y1.094 Z9.510 E0.329
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630    ;go down to the initial point
G1 X3.764 Y-5.956 Z9.589 E0.245
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.915 Y-8.063    ;move above the initial point
G0 Z5.958    ;go down to the initial point
G1 X3.764 Y-5.956 Z9.589 E0.246
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X3.764 Y-5.956 Z9.589 E0.308
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.317 Y-1.902    ;move above the initial point
G0 Z5.230    ;go down to the initial point
G1 X1.318 Y-4.005 Z9.747 E0.274
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630    ;go down to the initial point
G1 X1.318 Y-4.005 Z9.747 E0.280
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X1.318 Y-4.005 Z9.747 E0.286
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.105 Y-4.135    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X9.529 Y-3.034 Z10.035 E0.256
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X9.529 Y-3.034 Z10.035 E0.310
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630    ;go down to the initial point
G1 X9.529 Y-3.034 Z10.035 E0.342
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980    ;go down to the initial point
G1 X6.338 Y-0.900 Z10.386 E0.232
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630    ;go down to the initial point
G1 X6.338 Y-0.900 Z10.386 E0.299
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X6.338 Y-0.900 Z10.386 E0.357
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X-3.635 Y3.227 Z10.643 E0.245
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.826 Y2.584    ;move above the initial point
G0 Z5.430    ;go down to the initial point
G1 X-3.635 Y3.227 Z10.643 E0.278
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.086 Y-0.235    ;move above the initial point
G0 Z6.080    ;go down to the initial point
G1 X-3.635 Y3.227 Z10.643 E0.301
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-3.635 Y3.227 Z10.643 E0.307
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.317 Y-1.902    ;move above the initial point
G0 Z5.230    ;go down to the initial point
G1 X0.223 Y-0.606 Z10.713 E0.296
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.745 Y-0.959    ;move above the initial point
G0 Z5.130    ;go down to the initial point
G1 X0.223 Y-0.606 Z10.713 E0.321
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.826 Y2.584    ;move above the initial point
G0 Z5.430    ;go down to the initial point
G1 X0.223 Y-0.606 Z10.713 E0.360
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y-1.178    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X-9.623 Y-2.720 Z10.715 E0.296
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y-5.888    ;move above the initial point
G0 Z5.958    ;go down to the initial point
G1 X-9.623 Y-2.720 Z10.715 E0.309
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.743 Y-1.738    ;move above the initial point
G0 Z5.780    ;go down to the initial point
G1 X-9.623 Y-2.720 Z10.715 E0.332
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y1.178    ;move above the initial point
G0 Z3.920    ;go down to the initial point
G1 X-9.623 Y-2.720 Z10.715 E0.410
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X-4.221 Y5.495 Z10.803 E0.257
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-4.221 Y5.495 Z10.803 E0.316
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X-4.221 Y5.495 Z10.803 E0.362
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380    ;go down to the initial point
G1 X-2.427 Y-4.463 Z11.200 E0.312
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.086 Y-0.235    ;move above the initial point
G0 Z6.080    ;go down to the initial point
G1 X-2.427 Y-4.463 Z11.200 E0.349
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-2.427 Y-4.463 Z11.200 E0.364
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.086 Y-0.235    ;move above the initial point
G0 Z6.080    ;go down to the initial point
G1 X-1.334 Y-1.990 Z11.205 E0.297
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.317 Y-1.902    ;move above the initial point
G0 Z5.230    ;go down to the initial point
G1 X-1.334 Y-1.990 Z11.205 E0.317
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.245 Y-4.521    ;move above the initial point
G0 Z4.280    ;go down to the initial point
G1 X-1.334 Y-1.990 Z11.205 E0.385
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.826 Y2.584    ;move above the initial point
G0 Z5.430    ;go down to the initial point
G1 X-1.334 Y-1.990 Z11.205 E0.393
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980    ;go down to the initial point
G1 X3.458 Y-1.932 Z11.343 E0.297
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630    ;go down to the initial point
G1 X3.458 Y-1.932 Z11.343 E0.318
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.745 Y-0.959    ;move above the initial point
G0 Z5.130    ;go down to the initial point
G1 X3.458 Y-1.932 Z11.343 E0.331
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.317 Y-1.902    ;move above the initial point
G0 Z5.230    ;go down to the initial point
G1 X3.458 Y-1.932 Z11.343 E0.375
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.689 Y9.632    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X-3.804 Y9.248 Z11.394 E0.325
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X-3.804 Y9.248 Z11.394 E0.352
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X-3.804 Y9.248 Z11.394 E0.376
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.086 Y-0.235    ;move above the initial point
G0 Z6.080    ;go down to the initial point
G1 X-4.456 Y-1.418 Z11.568 E0.302
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.743 Y-1.738    ;move above the initial point
G0 Z5.780    ;go down to the initial point
G1 X-4.456 Y-1.418 Z11.568 E0.310
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380    ;go down to the initial point
G1 X-4.456 Y-1.418 Z11.568 E0.382
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030    ;go down to the initial point
G1 X-4.456 Y-1.418 Z11.568 E0.445
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X-1.151 Y2.850 Z11.663 E0.264
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.826 Y2.584    ;move above the initial point
G0 Z5.430    ;go down to the initial point
G1 X-1.151 Y2.850 Z11.663 E0.338
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.745 Y-0.959    ;move above the initial point
G0 Z5.130    ;go down to the initial point
G1 X-1.151 Y2.850 Z11.663 E0.444
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.600 Y9.871    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X-1.145 Y9.934 Z12.074 E0.228
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.689 Y9.632    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X-1.145 Y9.934 Z12.074 E0.364
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X-1.145 Y9.934 Z12.074 E0.374
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.637 Y6.456    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X7.106 Y7.036 Z12.753 E0.217
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X7.106 Y7.036 Z12.753 E0.246
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980    ;go down to the initial point
G1 X7.106 Y7.036 Z12.753 E0.436
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.600 Y9.871    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X2.371 Y9.715 Z12.753 E0.217
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X2.371 Y9.715 Z12.753 E0.269
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X2.371 Y9.715 Z12.753 E0.432
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.637 Y6.456    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X9.402 Y3.407 Z13.433 E0.309
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980    ;go down to the initial point
G1 X9.402 Y3.407 Z13.433 E0.427
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.820 Y1.891    ;move above the initial point
G0 Z5.279    ;go down to the initial point
G1 X9.402 Y3.407 Z13.433 E0.434
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z4.599    ;go down to the initial point
G1 X9.402 Y3.407 Z13.433 E0.510
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980    ;go down to the initial point
G1 X2.856 Y1.157 Z13.530 E0.357
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X2.856 Y1.157 Z13.530 E0.443
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.745 Y-0.959    ;move above the initial point
G0 Z5.130    ;go down to the initial point
G1 X2.856 Y1.157 Z13.530 E0.453
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.635 Y3.227    ;move above the initial point
G0 Z10.643    ;go down to the initial point
G1 X-6.282 Y3.120 Z13.836 E0.217
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.024 Y1.094    ;move above the initial point
G0 Z9.510    ;go down to the initial point
G1 X-6.282 Y3.120 Z13.836 E0.253
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.308 Y5.566    ;move above the initial point
G0 Z9.356    ;go down to the initial point
G1 X-6.282 Y3.120 Z13.836 E0.287
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X2.942 Y4.851 Z13.862 E0.353
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980    ;go down to the initial point
G1 X2.942 Y4.851 Z13.862 E0.412
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030    ;go down to the initial point
G1 X2.942 Y4.851 Z13.862 E0.415
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z9.589    ;go down to the initial point
G1 X2.044 Y-6.123 Z13.887 E0.242
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.318 Y-4.005    ;move above the initial point
G0 Z9.747    ;go down to the initial point
G1 X2.044 Y-6.123 Z13.887 E0.246
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.033 Y-10.000    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X2.044 Y-6.123 Z13.887 E0.355
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.529 Y-3.034    ;move above the initial point
G0 Z10.035    ;go down to the initial point
G1 X9.260 Y-3.774 Z14.112 E0.217
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.885 Y-6.151    ;move above the initial point
G0 Z9.356    ;go down to the initial point
G1 X9.260 Y-3.774 Z14.112 E0.287
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.338 Y-0.900    ;move above the initial point
G0 Z10.386    ;go down to the initial point
G1 X9.260 Y-3.774 Z14.112 E0.289
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.033 Y-10.000    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X-0.754 Y-9.972 Z14.112 E0.287
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.280 Y-7.333    ;move above the initial point
G0 Z8.362    ;go down to the initial point
G1 X-0.754 Y-9.972 Z14.112 E0.340
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.318 Y-4.005    ;move above the initial point
G0 Z9.747    ;go down to the initial point
G1 X-0.754 Y-9.972 Z14.112 E0.401
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.458 Y-1.932    ;move above the initial point
G0 Z11.343    ;go down to the initial point
G1 X2.270 Y-2.802 Z14.298 E0.173
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.223 Y-0.606    ;move above the initial point
G0 Z10.713    ;go down to the initial point
G1 X2.270 Y-2.802 Z14.298 E0.244
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.318 Y-4.005    ;move above the initial point
G0 Z9.747    ;go down to the initial point
G1 X2.270 Y-2.802 Z14.298 E0.251
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z9.589    ;go down to the initial point
G1 X2.270 Y-2.802 Z14.298 E0.306
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.427 Y-4.463    ;move above the initial point
G0 Z11.200    ;go down to the initial point
G1 X-4.202 Y-3.937 Z14.609 E0.203
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z11.568    ;go down to the initial point
G1 X-4.202 Y-3.937 Z14.609 E0.207
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.651 Y-4.235    ;move above the initial point
G0 Z9.506    ;go down to the initial point
G1 X-4.202 Y-3.937 Z14.609 E0.278
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.280 Y-7.333    ;move above the initial point
G0 Z8.362    ;go down to the initial point
G1 X-4.202 Y-3.937 Z14.609 E0.385
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z11.568    ;go down to the initial point
G1 X-6.852 Y-0.783 Z14.747 E0.211
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.623 Y-2.720    ;move above the initial point
G0 Z10.715    ;go down to the initial point
G1 X-6.852 Y-0.783 Z14.747 E0.275
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.024 Y1.094    ;move above the initial point
G0 Z9.510    ;go down to the initial point
G1 X-6.852 Y-0.783 Z14.747 E0.291
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.499 Y-9.368    ;move above the initial point
G0 Z9.356    ;go down to the initial point
G1 X4.924 Y-8.704 Z14.791 E0.296
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z9.589    ;go down to the initial point
G1 X4.924 Y-8.704 Z14.791 E0.313
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.885 Y-6.151    ;move above the initial point
G0 Z9.356    ;go down to the initial point
G1 X4.924 Y-8.704 Z14.791 E0.350
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.033 Y-10.000    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X4.924 Y-8.704 Z14.791 E0.415
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.338 Y-0.900    ;move above the initial point
G0 Z10.386    ;go down to the initial point
G1 X5.985 Y-4.637 Z14.877 E0.306
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z9.589    ;go down to the initial point
G1 X5.985 Y-4.637 Z14.877 E0.307
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.885 Y-6.151    ;move above the initial point
G0 Z9.356    ;go down to the initial point
G1 X5.985 Y-4.637 Z14.877 E0.315
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.176 Y-7.865    ;move above the initial point
G0 Z9.356    ;go down to the initial point
G1 X-5.862 Y-8.102 Z15.471 E0.320
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.651 Y-4.235    ;move above the initial point
G0 Z9.506    ;go down to the initial point
G1 X-5.862 Y-8.102 Z15.471 E0.372
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.280 Y-7.333    ;move above the initial point
G0 Z8.362    ;go down to the initial point
G1 X-5.862 Y-8.102 Z15.471 E0.418
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.033 Y-10.000    ;move above the initial point
G0 Z8.676    ;go down to the initial point
G1 X-5.862 Y-8.102 Z15.471 E0.480
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.623 Y-2.720    ;move above the initial point
G0 Z10.715    ;go down to the initial point
G1 X-8.906 Y-4.549 Z15.471 E0.269
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z11.568    ;go down to the initial point
G1 X-8.906 Y-4.549 Z15.471 E0.350
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.651 Y-4.235    ;move above the initial point
G0 Z9.506    ;go down to the initial point
G1 X-8.906 Y-4.549 Z15.471 E0.355
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.176 Y-7.865    ;move above the initial point
G0 Z9.356    ;go down to the initial point
G1 X-8.906 Y-4.549 Z15.471 E0.390
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z11.568    ;go down to the initial point
G1 X-2.416 Y-0.622 Z16.079 E0.262
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.334 Y-1.990    ;move above the initial point
G0 Z11.205    ;go down to the initial point
G1 X-2.416 Y-0.622 Z16.079 E0.270
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663    ;go down to the initial point
G1 X-2.416 Y-0.622 Z16.079 E0.301
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.623 Y-2.720    ;move above the initial point
G0 Z10.715    ;go down to the initial point
G1 X-9.807 Y1.955 Z16.150 E0.375
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.024 Y1.094    ;move above the initial point
G0 Z9.510    ;go down to the initial point
G1 X-9.807 Y1.955 Z16.150 E0.379
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.308 Y5.566    ;move above the initial point
G0 Z9.356    ;go down to the initial point
G1 X-9.807 Y1.955 Z16.150 E0.410
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.221 Y5.495    ;move above the initial point
G0 Z10.803    ;go down to the initial point
G1 X-4.552 Y4.653 Z16.266 E0.289
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.635 Y3.227    ;move above the initial point
G0 Z10.643    ;go down to the initial point
G1 X-4.552 Y4.653 Z16.266 E0.307
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663    ;go down to the initial point
G1 X-4.552 Y4.653 Z16.266 E0.314
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.308 Y5.566    ;move above the initial point
G0 Z9.356    ;go down to the initial point
G1 X-4.552 Y4.653 Z16.266 E0.414
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z11.568    ;go down to the initial point
G1 X-4.611 Y0.850 Z16.446 E0.281
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663    ;go down to the initial point
G1 X-4.611 Y0.850 Z16.446 E0.326
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.635 Y3.227    ;move above the initial point
G0 Z10.643    ;go down to the initial point
G1 X-4.611 Y0.850 Z16.446 E0.332
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.024 Y1.094    ;move above the initial point
G0 Z9.510    ;go down to the initial point
G1 X-4.611 Y0.850 Z16.446 E0.384
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.942 Y4.851    ;move above the initial point
G0 Z13.862    ;go down to the initial point
G1 X1.706 Y2.917 Z16.618 E0.187
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z13.530    ;go down to the initial point
G1 X1.706 Y2.917 Z16.618 E0.195
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663    ;go down to the initial point
G1 X1.706 Y2.917 Z16.618 E0.299
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.106 Y7.036    ;move above the initial point
G0 Z12.753    ;go down to the initial point
G1 X5.262 Y8.503 Z16.830 E0.246
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.371 Y9.715    ;move above the initial point
G0 Z12.753    ;go down to the initial point
G1 X5.262 Y8.503 Z16.830 E0.269
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.942 Y4.851    ;move above the initial point
G0 Z13.862    ;go down to the initial point
G1 X5.262 Y8.503 Z16.830 E0.274
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.427 Y-4.463    ;move above the initial point
G0 Z11.200    ;go down to the initial point
G1 X-0.982 Y-4.131 Z16.866 E0.306
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.334 Y-1.990    ;move above the initial point
G0 Z11.205    ;go down to the initial point
G1 X-0.982 Y-4.131 Z16.866 E0.317
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z11.568    ;go down to the initial point
G1 X-0.982 Y-4.131 Z16.866 E0.360
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.318 Y-4.005    ;move above the initial point
G0 Z9.747    ;go down to the initial point
G1 X-0.982 Y-4.131 Z16.866 E0.391
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.280 Y-7.333    ;move above the initial point
G0 Z8.362    ;go down to the initial point
G1 X-0.982 Y-4.131 Z16.866 E0.480
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z13.530    ;go down to the initial point
G1 X0.074 Y0.872 Z16.872 E0.228
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663    ;go down to the initial point
G1 X0.074 Y0.872 Z16.872 E0.298
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.334 Y-1.990    ;move above the initial point
G0 Z11.205    ;go down to the initial point
G1 X0.074 Y0.872 Z16.872 E0.340
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z13.530    ;go down to the initial point
G1 X4.642 Y-1.394 Z17.262 E0.254
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.458 Y-1.932    ;move above the initial point
G0 Z11.343    ;go down to the initial point
G1 X4.642 Y-1.394 Z17.262 E0.317
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.338 Y-0.900    ;move above the initial point
G0 Z10.386    ;go down to the initial point
G1 X4.642 Y-1.394 Z17.262 E0.371
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.223 Y-0.606    ;move above the initial point
G0 Z10.713    ;go down to the initial point
G1 X4.642 Y-1.394 Z17.262 E0.415
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z9.589    ;go down to the initial point
G1 X4.642 Y-1.394 Z17.262 E0.469
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663    ;go down to the initial point
G1 X-2.467 Y5.709 Z17.363 E0.340
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.221 Y5.495    ;move above the initial point
G0 Z10.803    ;go down to the initial point
G1 X-2.467 Y5.709 Z17.363 E0.355
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.145 Y9.934    ;move above the initial point
G0 Z12.074    ;go down to the initial point
G1 X-2.467 Y5.709 Z17.363 E0.360
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.942 Y4.851    ;move above the initial point
G0 Z13.862    ;go down to the initial point
G1 X0.416 Y5.375 Z17.833 E0.247
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663    ;go down to the initial point
G1 X0.416 Y5.375 Z17.833 E0.358
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.145 Y9.934    ;move above the initial point
G0 Z12.074    ;go down to the initial point
G1 X0.416 Y5.375 Z17.833 E0.392
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.106 Y7.036    ;move above the initial point
G0 Z12.753    ;go down to the initial point
G1 X7.637 Y6.456 Z18.189 E0.287
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.402 Y3.407    ;move above the initial point
G0 Z13.433    ;go down to the initial point
G1 X7.637 Y6.456 Z18.189 E0.309
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.942 Y4.851    ;move above the initial point
G0 Z13.862    ;go down to the initial point
G1 X7.637 Y6.456 Z18.189 E0.344
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.402 Y3.407    ;move above the initial point
G0 Z13.433    ;go down to the initial point
G1 X9.974 Y-0.721 Z18.189 E0.330
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.529 Y-3.034    ;move above the initial point
G0 Z10.035    ;go down to the initial point
G1 X9.974 Y-0.721 Z18.189 E0.443
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.338 Y-0.900    ;move above the initial point
G0 Z10.386    ;go down to the initial point
G1 X9.974 Y-0.721 Z18.189 E0.450
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.804 Y9.248    ;move above the initial point
G0 Z11.394    ;go down to the initial point
G1 X-5.862 Y8.102 Z18.189 E0.376
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.145 Y9.934    ;move above the initial point
G0 Z12.074    ;go down to the initial point
G1 X-5.862 Y8.102 Z18.189 E0.415
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.221 Y5.495    ;move above the initial point
G0 Z10.803    ;go down to the initial point
G1 X-5.862 Y8.102 Z18.189 E0.418
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.308 Y5.566    ;move above the initial point
G0 Z9.356    ;go down to the initial point
G1 X-5.862 Y8.102 Z18.189 E0.497
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.924 Y-8.704    ;move above the initial point
G0 Z14.791    ;go down to the initial point
G1 X2.371 Y-9.715 Z18.189 E0.228
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.754 Y-9.972    ;move above the initial point
G0 Z14.112    ;go down to the initial point
G1 X2.371 Y-9.715 Z18.189 E0.269
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.044 Y-6.123    ;move above the initial point
G0 Z13.887    ;go down to the initial point
G1 X2.371 Y-9.715 Z18.189 E0.293
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z13.530    ;go down to the initial point
G1 X5.951 Y0.850 Z18.600 E0.311
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.402 Y3.407    ;move above the initial point
G0 Z13.433    ;go down to the initial point
G1 X5.951 Y0.850 Z18.600 E0.351
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.338 Y-0.900    ;move above the initial point
G0 Z10.386    ;go down to the initial point
G1 X5.951 Y0.850 Z18.600 E0.439
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.906 Y-4.549    ;move above the initial point
G0 Z15.471    ;go down to the initial point
G1 X-6.640 Y-2.989 Z18.792 E0.225
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.852 Y-0.783    ;move above the initial point
G0 Z14.747    ;go down to the initial point
G1 X-6.640 Y-2.989 Z18.792 E0.241
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.202 Y-3.937    ;move above the initial point
G0 Z14.609    ;go down to the initial point
G1 X-6.640 Y-2.989 Z18.792 E0.258
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.416 Y-0.622    ;move above the initial point
G0 Z16.079    ;go down to the initial point
G1 X-4.391 Y-1.839 Z18.845 E0.189
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.202 Y-3.937    ;move above the initial point
G0 Z14.609    ;go down to the initial point
G1 X-4.391 Y-1.839 Z18.845 E0.247
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.852 Y-0.783    ;move above the initial point
G0 Z14.747    ;go down to the initial point
G1 X-4.391 Y-1.839 Z18.845 E0.256
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.371 Y9.715    ;move above the initial point
G0 Z12.753    ;go down to the initial point
G1 X1.210 Y9.927 Z18.868 E0.325
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.145 Y9.934    ;move above the initial point
G0 Z12.074    ;go down to the initial point
G1 X1.210 Y9.927 Z18.868 E0.376
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.942 Y4.851    ;move above the initial point
G0 Z13.862    ;go down to the initial point
G1 X1.210 Y9.927 Z18.868 E0.383
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y-8.102    ;move above the initial point
G0 Z15.471    ;go down to the initial point
G1 X-7.333 Y-6.799 Z18.868 E0.205
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.906 Y-4.549    ;move above the initial point
G0 Z15.471    ;go down to the initial point
G1 X-7.333 Y-6.799 Z18.868 E0.228
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.202 Y-3.937    ;move above the initial point
G0 Z14.609    ;go down to the initial point
G1 X-7.333 Y-6.799 Z18.868 E0.314
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.982 Y-4.131    ;move above the initial point
G0 Z16.866    ;go down to the initial point
G1 X-1.790 Y-2.595 Z19.163 E0.150
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.416 Y-0.622    ;move above the initial point
G0 Z16.079    ;go down to the initial point
G1 X-1.790 Y-2.595 Z19.163 E0.194
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.202 Y-3.937    ;move above the initial point
G0 Z14.609    ;go down to the initial point
G1 X-1.790 Y-2.595 Z19.163 E0.278
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.270 Y-2.802    ;move above the initial point
G0 Z14.298    ;go down to the initial point
G1 X-1.790 Y-2.595 Z19.163 E0.331
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.942 Y4.851    ;move above the initial point
G0 Z13.862    ;go down to the initial point
G1 X4.357 Y3.119 Z19.458 E0.315
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z13.530    ;go down to the initial point
G1 X4.357 Y3.119 Z19.458 E0.336
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.402 Y3.407    ;move above the initial point
G0 Z13.433    ;go down to the initial point
G1 X4.357 Y3.119 Z19.458 E0.411
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.642 Y-1.394    ;move above the initial point
G0 Z17.262    ;go down to the initial point
G1 X4.728 Y-2.737 Z19.687 E0.145
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.985 Y-4.637    ;move above the initial point
G0 Z14.877    ;go down to the initial point
G1 X4.728 Y-2.737 Z19.687 E0.278
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.270 Y-2.802    ;move above the initial point
G0 Z14.298    ;go down to the initial point
G1 X4.728 Y-2.737 Z19.687 E0.309
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.260 Y-3.774    ;move above the initial point
G0 Z14.112    ;go down to the initial point
G1 X4.728 Y-2.737 Z19.687 E0.379
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.982 Y-4.131    ;move above the initial point
G0 Z16.866    ;go down to the initial point
G1 X0.318 Y-6.449 Z20.055 E0.217
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.044 Y-6.123    ;move above the initial point
G0 Z13.887    ;go down to the initial point
G1 X0.318 Y-6.449 Z20.055 E0.335
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.754 Y-9.972    ;move above the initial point
G0 Z14.112    ;go down to the initial point
G1 X0.318 Y-6.449 Z20.055 E0.365
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.982 Y-4.131    ;move above the initial point
G0 Z16.866    ;go down to the initial point
G1 X-3.552 Y-4.946 Z20.149 E0.222
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.202 Y-3.937    ;move above the initial point
G0 Z14.609    ;go down to the initial point
G1 X-3.552 Y-4.946 Z20.149 E0.296
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y-8.102    ;move above the initial point
G0 Z15.471    ;go down to the initial point
G1 X-3.552 Y-4.946 Z20.149 E0.319
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.807 Y1.955    ;move above the initial point
G0 Z16.150    ;go down to the initial point
G1 X-9.930 Y-1.178 Z20.227 E0.269
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.906 Y-4.549    ;move above the initial point
G0 Z15.471    ;go down to the initial point
G1 X-9.930 Y-1.178 Z20.227 E0.309
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.852 Y-0.783    ;move above the initial point
G0 Z14.747    ;go down to the initial point
G1 X-9.930 Y-1.178 Z20.227 E0.329
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.924 Y-8.704    ;move above the initial point
G0 Z14.791    ;go down to the initial point
G1 X5.593 Y-8.290 Z20.227 E0.287
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.985 Y-4.637    ;move above the initial point
G0 Z14.877    ;go down to the initial point
G1 X5.593 Y-8.290 Z20.227 E0.339
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.044 Y-6.123    ;move above the initial point
G0 Z13.887    ;go down to the initial point
G1 X5.593 Y-8.290 Z20.227 E0.396
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.260 Y-3.774    ;move above the initial point
G0 Z14.112    ;go down to the initial point
G1 X5.593 Y-8.290 Z20.227 E0.441
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.982 Y-4.131    ;move above the initial point
G0 Z16.866    ;go down to the initial point
G1 X2.209 Y-4.437 Z20.732 E0.262
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.270 Y-2.802    ;move above the initial point
G0 Z14.298    ;go down to the initial point
G1 X2.209 Y-4.437 Z20.732 E0.347
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.985 Y-4.637    ;move above the initial point
G0 Z14.877    ;go down to the initial point
G1 X2.209 Y-4.437 Z20.732 E0.364
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.044 Y-6.123    ;move above the initial point
G0 Z13.887    ;go down to the initial point
G1 X2.209 Y-4.437 Z20.732 E0.368
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z18.189    ;go down to the initial point
G1 X-6.481 Y7.616 Z20.907 E0.148
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.467 Y5.709    ;move above the initial point
G0 Z17.363    ;go down to the initial point
G1 X-6.481 Y7.616 Z20.907 E0.297
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.552 Y4.653    ;move above the initial point
G0 Z16.266    ;go down to the initial point
G1 X-6.481 Y7.616 Z20.907 E0.305
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.416 Y5.375    ;move above the initial point
G0 Z17.833    ;go down to the initial point
G1 X-1.283 Y3.989 Z20.934 E0.198
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.467 Y5.709    ;move above the initial point
G0 Z17.363    ;go down to the initial point
G1 X-1.283 Y3.989 Z20.934 E0.216
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.074 Y0.872    ;move above the initial point
G0 Z16.872    ;go down to the initial point
G1 X-1.283 Y3.989 Z20.934 E0.277
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.552 Y4.653    ;move above the initial point
G0 Z16.266    ;go down to the initial point
G1 X-1.283 Y3.989 Z20.934 E0.300
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.611 Y0.850    ;move above the initial point
G0 Z16.446    ;go down to the initial point
G1 X-6.748 Y1.290 Z21.089 E0.268
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.807 Y1.955    ;move above the initial point
G0 Z16.150    ;go down to the initial point
G1 X-6.748 Y1.290 Z21.089 E0.305
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.552 Y4.653    ;move above the initial point
G0 Z16.266    ;go down to the initial point
G1 X-6.748 Y1.290 Z21.089 E0.328
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.852 Y-0.783    ;move above the initial point
G0 Z14.747    ;go down to the initial point
G1 X-6.748 Y1.290 Z21.089 E0.349
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.282 Y3.120    ;move above the initial point
G0 Z13.836    ;go down to the initial point
G1 X-6.748 Y1.290 Z21.089 E0.392
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.611 Y0.850    ;move above the initial point
G0 Z16.446    ;go down to the initial point
G1 X-3.363 Y2.098 Z21.228 E0.266
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.074 Y0.872    ;move above the initial point
G0 Z16.872    ;go down to the initial point
G1 X-3.363 Y2.098 Z21.228 E0.297
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.552 Y4.653    ;move above the initial point
G0 Z16.266    ;go down to the initial point
G1 X-3.363 Y2.098 Z21.228 E0.298
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.210 Y9.927    ;move above the initial point
G0 Z18.868    ;go down to the initial point
G1 X2.751 Y9.614 Z21.586 E0.164
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z16.830    ;go down to the initial point
G1 X2.751 Y9.614 Z21.586 E0.287
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.416 Y5.375    ;move above the initial point
G0 Z17.833    ;go down to the initial point
G1 X2.751 Y9.614 Z21.586 E0.320
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y-8.102    ;move above the initial point
G0 Z15.471    ;go down to the initial point
G1 X-3.437 Y-9.391 Z21.586 E0.350
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.982 Y-4.131    ;move above the initial point
G0 Z16.866    ;go down to the initial point
G1 X-3.437 Y-9.391 Z21.586 E0.391
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.754 Y-9.972    ;move above the initial point
G0 Z14.112    ;go down to the initial point
G1 X-3.437 Y-9.391 Z21.586 E0.416
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.611 Y0.850    ;move above the initial point
G0 Z16.446    ;go down to the initial point
G1 X-4.344 Y0.070 Z22.236 E0.306
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.416 Y-0.622    ;move above the initial point
G0 Z16.079    ;go down to the initial point
G1 X-4.344 Y0.070 Z22.236 E0.339
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.074 Y0.872    ;move above the initial point
G0 Z16.872    ;go down to the initial point
G1 X-4.344 Y0.070 Z22.236 E0.365
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.852 Y-0.783    ;move above the initial point
G0 Z14.747    ;go down to the initial point
G1 X-4.344 Y0.070 Z22.236 E0.415
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.357 Y3.119    ;move above the initial point
G0 Z19.458    ;go down to the initial point
G1 X2.824 Y1.356 Z22.253 E0.190
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.706 Y2.917    ;move above the initial point
G0 Z16.618    ;go down to the initial point
G1 X2.824 Y1.356 Z22.253 E0.311
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.642 Y-1.394    ;move above the initial point
G0 Z17.262    ;go down to the initial point
G1 X2.824 Y1.356 Z22.253 E0.312
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.074 Y0.872    ;move above the initial point
G0 Z16.872    ;go down to the initial point
G1 X2.824 Y1.356 Z22.253 E0.317
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z18.189    ;go down to the initial point
G1 X9.738 Y-2.276 Z22.266 E0.228
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.642 Y-1.394    ;move above the initial point
G0 Z17.262    ;go down to the initial point
G1 X9.738 Y-2.276 Z22.266 E0.376
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.260 Y-3.774    ;move above the initial point
G0 Z14.112    ;go down to the initial point
G1 X9.738 Y-2.276 Z22.266 E0.434
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.357 Y3.119    ;move above the initial point
G0 Z19.458    ;go down to the initial point
G1 X2.810 Y4.784 Z22.572 E0.201
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.416 Y5.375    ;move above the initial point
G0 Z17.833    ;go down to the initial point
G1 X2.810 Y4.784 Z22.572 E0.279
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.706 Y2.917    ;move above the initial point
G0 Z16.618    ;go down to the initial point
G1 X2.810 Y4.784 Z22.572 E0.331
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z16.830    ;go down to the initial point
G1 X2.810 Y4.784 Z22.572 E0.380
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.074 Y0.872    ;move above the initial point
G0 Z16.872    ;go down to the initial point
G1 X2.810 Y4.784 Z22.572 E0.388
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.074 Y0.872    ;move above the initial point
G0 Z16.872    ;go down to the initial point
G1 X0.282 Y-0.563 Z22.578 E0.308
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.642 Y-1.394    ;move above the initial point
G0 Z17.262    ;go down to the initial point
G1 X0.282 Y-0.563 Z22.578 E0.362
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.416 Y-0.622    ;move above the initial point
G0 Z16.079    ;go down to the initial point
G1 X0.282 Y-0.563 Z22.578 E0.368
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.270 Y-2.802    ;move above the initial point
G0 Z14.298    ;go down to the initial point
G1 X0.282 Y-0.563 Z22.578 E0.460
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.416 Y5.375    ;move above the initial point
G0 Z17.833    ;go down to the initial point
G1 X-0.427 Y6.496 Z23.422 E0.301
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.210 Y9.927    ;move above the initial point
G0 Z18.868    ;go down to the initial point
G1 X-0.427 Y6.496 Z23.422 E0.310
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.467 Y5.709    ;move above the initial point
G0 Z17.363    ;go down to the initial point
G1 X-0.427 Y6.496 Z23.422 E0.336
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z18.189    ;go down to the initial point
G1 X-8.906 Y4.549 Z23.625 E0.375
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.807 Y1.955    ;move above the initial point
G0 Z16.150    ;go down to the initial point
G1 X-8.906 Y4.549 Z23.625 E0.416
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.282 Y3.120    ;move above the initial point
G0 Z13.836    ;go down to the initial point
G1 X-8.906 Y4.549 Z23.625 E0.535
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z18.189    ;go down to the initial point
G1 X9.738 Y2.276 Z23.625 E0.325
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.951 Y0.850    ;move above the initial point
G0 Z18.600    ;go down to the initial point
G1 X9.738 Y2.276 Z23.625 E0.337
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.637 Y6.456    ;move above the initial point
G0 Z18.189    ;go down to the initial point
G1 X9.738 Y2.276 Z23.625 E0.375
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.951 Y0.850    ;move above the initial point
G0 Z18.600    ;go down to the initial point
G1 X5.696 Y-0.195 Z23.727 E0.274
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.357 Y3.119    ;move above the initial point
G0 Z19.458    ;go down to the initial point
G1 X5.696 Y-0.195 Z23.727 E0.291
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.642 Y-1.394    ;move above the initial point
G0 Z17.262    ;go down to the initial point
G1 X5.696 Y-0.195 Z23.727 E0.348
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z18.189    ;go down to the initial point
G1 X5.696 Y-0.195 Z23.727 E0.367
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.748 Y1.290    ;move above the initial point
G0 Z21.089    ;go down to the initial point
G1 X-7.021 Y-0.950 Z23.788 E0.184
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y-1.178    ;move above the initial point
G0 Z20.227    ;go down to the initial point
G1 X-7.021 Y-0.950 Z23.788 E0.241
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.640 Y-2.989    ;move above the initial point
G0 Z18.792    ;go down to the initial point
G1 X-7.021 Y-0.950 Z23.788 E0.283
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.391 Y-1.839    ;move above the initial point
G0 Z18.845    ;go down to the initial point
G1 X-7.021 Y-0.950 Z23.788 E0.296
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.209 Y-4.437    ;move above the initial point
G0 Z20.732    ;go down to the initial point
G1 X1.038 Y-5.261 Z23.835 E0.179
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.318 Y-6.449    ;move above the initial point
G0 Z20.055    ;go down to the initial point
G1 X1.038 Y-5.261 Z23.835 E0.210
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.790 Y-2.595    ;move above the initial point
G0 Z19.163    ;go down to the initial point
G1 X1.038 Y-5.261 Z23.835 E0.318
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.371 Y-9.715    ;move above the initial point
G0 Z18.189    ;go down to the initial point
G1 X1.038 Y-5.261 Z23.835 E0.382
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z18.189    ;go down to the initial point
G1 X-3.437 Y9.391 Z24.304 E0.350
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.210 Y9.927    ;move above the initial point
G0 Z18.868    ;go down to the initial point
G1 X-3.437 Y9.391 Z24.304 E0.375
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.467 Y5.709    ;move above the initial point
G0 Z17.363    ;go down to the initial point
G1 X-3.437 Y9.391 Z24.304 E0.414
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.282 Y-0.563    ;move above the initial point
G0 Z22.578    ;go down to the initial point
G1 X0.570 Y-2.197 Z24.690 E0.140
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.209 Y-4.437    ;move above the initial point
G0 Z20.732    ;go down to the initial point
G1 X0.570 Y-2.197 Z24.690 E0.253
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.790 Y-2.595    ;move above the initial point
G0 Z19.163    ;go down to the initial point
G1 X0.570 Y-2.197 Z24.690 E0.315
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.728 Y-2.737    ;move above the initial point
G0 Z19.687    ;go down to the initial point
G1 X0.570 Y-2.197 Z24.690 E0.341
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.344 Y0.070    ;move above the initial point
G0 Z22.236    ;go down to the initial point
G1 X-5.117 Y0.686 Z24.762 E0.142
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.748 Y1.290    ;move above the initial point
G0 Z21.089    ;go down to the initial point
G1 X-5.117 Y0.686 Z24.762 E0.212
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.363 Y2.098    ;move above the initial point
G0 Z21.228    ;go down to the initial point
G1 X-5.117 Y0.686 Z24.762 E0.219
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.391 Y-1.839    ;move above the initial point
G0 Z18.845    ;go down to the initial point
G1 X-5.117 Y0.686 Z24.762 E0.338
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.637 Y6.456    ;move above the initial point
G0 Z18.189    ;go down to the initial point
G1 X7.106 Y7.036 Z24.984 E0.357
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.357 Y3.119    ;move above the initial point
G0 Z19.458    ;go down to the initial point
G1 X7.106 Y7.036 Z24.984 E0.382
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z16.830    ;go down to the initial point
G1 X7.106 Y7.036 Z24.984 E0.443
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.951 Y0.850    ;move above the initial point
G0 Z18.600    ;go down to the initial point
G1 X7.106 Y7.036 Z24.984 E0.468
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.437 Y-9.391    ;move above the initial point
G0 Z21.586    ;go down to the initial point
G1 X-5.862 Y-8.102 Z24.984 E0.228
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.552 Y-4.946    ;move above the initial point
G0 Z20.149    ;go down to the initial point
G1 X-5.862 Y-8.102 Z24.984 E0.325
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.333 Y-6.799    ;move above the initial point
G0 Z18.868    ;go down to the initial point
G1 X-5.862 Y-8.102 Z24.984 E0.336
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.593 Y-8.290    ;move above the initial point
G0 Z20.227    ;go down to the initial point
G1 X3.864 Y-9.223 Z24.984 E0.269
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.209 Y-4.437    ;move above the initial point
G0 Z20.732    ;go down to the initial point
G1 X3.864 Y-9.223 Z24.984 E0.345
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.371 Y-9.715    ;move above the initial point
G0 Z18.189    ;go down to the initial point
G1 X3.864 Y-9.223 Z24.984 E0.364
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.437 Y-9.391    ;move above the initial point
G0 Z21.586    ;go down to the initial point
G1 X-2.191 Y-6.821 Z24.997 E0.232
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.552 Y-4.946    ;move above the initial point
G0 Z20.149    ;go down to the initial point
G1 X-2.191 Y-6.821 Z24.997 E0.281
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.318 Y-6.449    ;move above the initial point
G0 Z20.055    ;go down to the initial point
G1 X-2.191 Y-6.821 Z24.997 E0.290
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.552 Y-4.946    ;move above the initial point
G0 Z20.149    ;go down to the initial point
G1 X-2.787 Y-3.748 Z25.001 E0.264
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.790 Y-2.595    ;move above the initial point
G0 Z19.163    ;go down to the initial point
G1 X-2.787 Y-3.748 Z25.001 E0.315
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.318 Y-6.449    ;move above the initial point
G0 Z20.055    ;go down to the initial point
G1 X-2.787 Y-3.748 Z25.001 E0.336
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.391 Y-1.839    ;move above the initial point
G0 Z18.845    ;go down to the initial point
G1 X-2.787 Y-3.748 Z25.001 E0.347
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.640 Y-2.989    ;move above the initial point
G0 Z18.792    ;go down to the initial point
G1 X-2.787 Y-3.748 Z25.001 E0.384
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.209 Y-4.437    ;move above the initial point
G0 Z20.732    ;go down to the initial point
G1 X3.874 Y-4.668 Z25.016 E0.240
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.728 Y-2.737    ;move above the initial point
G0 Z19.687    ;go down to the initial point
G1 X3.874 Y-4.668 Z25.016 E0.299
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.593 Y-8.290    ;move above the initial point
G0 Z20.227    ;go down to the initial point
G1 X3.874 Y-4.668 Z25.016 E0.326
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.282 Y-0.563    ;move above the initial point
G0 Z22.578    ;go down to the initial point
G1 X2.393 Y-0.370 Z25.106 E0.172
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.824 Y1.356    ;move above the initial point
G0 Z22.253    ;go down to the initial point
G1 X2.393 Y-0.370 Z25.106 E0.176
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.728 Y-2.737    ;move above the initial point
G0 Z19.687    ;go down to the initial point
G1 X2.393 Y-0.370 Z25.106 E0.332
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.282 Y-0.563    ;move above the initial point
G0 Z22.578    ;go down to the initial point
G1 X-1.760 Y-0.698 Z25.451 E0.184
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.344 Y0.070    ;move above the initial point
G0 Z22.236    ;go down to the initial point
G1 X-1.760 Y-0.698 Z25.451 E0.219
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.363 Y2.098    ;move above the initial point
G0 Z21.228    ;go down to the initial point
G1 X-1.760 Y-0.698 Z25.451 E0.278
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.790 Y-2.595    ;move above the initial point
G0 Z19.163    ;go down to the initial point
G1 X-1.760 Y-0.698 Z25.451 E0.343
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.282 Y-0.563    ;move above the initial point
G0 Z22.578    ;go down to the initial point
G1 X0.123 Y1.357 Z25.498 E0.183
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.824 Y1.356    ;move above the initial point
G0 Z22.253    ;go down to the initial point
G1 X0.123 Y1.357 Z25.498 E0.221
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.283 Y3.989    ;move above the initial point
G0 Z20.934    ;go down to the initial point
G1 X0.123 Y1.357 Z25.498 E0.285
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.363 Y2.098    ;move above the initial point
G0 Z21.228    ;go down to the initial point
G1 X0.123 Y1.357 Z25.498 E0.291
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.437 Y-9.391    ;move above the initial point
G0 Z21.586    ;go down to the initial point
G1 X-0.361 Y-9.993 Z25.663 E0.269
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.318 Y-6.449    ;move above the initial point
G0 Z20.055    ;go down to the initial point
G1 X-0.361 Y-9.993 Z25.663 E0.348
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.371 Y-9.715    ;move above the initial point
G0 Z18.189    ;go down to the initial point
G1 X-0.361 Y-9.993 Z25.663 E0.416
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.906 Y4.549    ;move above the initial point
G0 Z23.625    ;go down to the initial point
G1 X-8.082 Y5.888 Z26.342 E0.164
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.481 Y7.616    ;move above the initial point
G0 Z20.907    ;go down to the initial point
G1 X-8.082 Y5.888 Z26.342 E0.310
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.363 Y2.098    ;move above the initial point
G0 Z21.228    ;go down to the initial point
G1 X-8.082 Y5.888 Z26.342 E0.414
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.333 Y-6.799    ;move above the initial point
G0 Z18.868    ;go down to the initial point
G1 X-8.082 Y-5.888 Z26.342 E0.395
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.552 Y-4.946    ;move above the initial point
G0 Z20.149    ;go down to the initial point
G1 X-8.082 Y-5.888 Z26.342 E0.404
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y-1.178    ;move above the initial point
G0 Z20.227    ;go down to the initial point
G1 X-8.082 Y-5.888 Z26.342 E0.415
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.640 Y-2.989    ;move above the initial point
G0 Z18.792    ;go down to the initial point
G1 X-8.082 Y-5.888 Z26.342 E0.429
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.906 Y4.549    ;move above the initial point
G0 Z23.625    ;go down to the initial point
G1 X-9.509 Y3.096 Z26.342 E0.164
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.748 Y1.290    ;move above the initial point
G0 Z21.089    ;go down to the initial point
G1 X-9.509 Y3.096 Z26.342 E0.324
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y-1.178    ;move above the initial point
G0 Z20.227    ;go down to the initial point
G1 X-9.509 Y3.096 Z26.342 E0.390
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.363 Y2.098    ;move above the initial point
G0 Z21.228    ;go down to the initial point
G1 X-9.509 Y3.096 Z26.342 E0.421
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.363 Y2.098    ;move above the initial point
G0 Z21.228    ;go down to the initial point
G1 X-3.070 Y3.885 Z26.973 E0.315
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.283 Y3.989    ;move above the initial point
G0 Z20.934    ;go down to the initial point
G1 X-3.070 Y3.885 Z26.973 E0.329
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.481 Y7.616    ;move above the initial point
G0 Z20.907    ;go down to the initial point
G1 X-3.070 Y3.885 Z26.973 E0.413
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.427 Y6.496    ;move above the initial point
G0 Z23.422    ;go down to the initial point
G1 X1.380 Y3.955 Z27.145 E0.254
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.810 Y4.784    ;move above the initial point
G0 Z22.572    ;go down to the initial point
G1 X1.380 Y3.955 Z27.145 E0.254
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.824 Y1.356    ;move above the initial point
G0 Z22.253    ;go down to the initial point
G1 X1.380 Y3.955 Z27.145 E0.299
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.283 Y3.989    ;move above the initial point
G0 Z20.934    ;go down to the initial point
G1 X1.380 Y3.955 Z27.145 E0.353
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.427 Y6.496    ;move above the initial point
G0 Z23.422    ;go down to the initial point
G1 X1.596 Y6.807 Z30.780 E0.399
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.810 Y4.784    ;move above the initial point
G0 Z22.572    ;go down to the initial point
G1 X1.596 Y6.807 Z30.780 E0.446
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.751 Y9.614    ;move above the initial point
G0 Z21.586    ;go down to the initial point
G1 X1.596 Y6.807 Z30.780 E0.506
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.427 Y6.496    ;move above the initial point
G0 Z23.422    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.780 E0.394
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.283 Y3.989    ;move above the initial point
G0 Z20.934    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.780 E0.523
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.481 Y7.616    ;move above the initial point
G0 Z20.907    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.780 E0.579
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.696 Y-0.195    ;move above the initial point
G0 Z23.727    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.780 E0.373
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.824 Y1.356    ;move above the initial point
G0 Z22.253    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.780 E0.462
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.810 Y4.784    ;move above the initial point
G0 Z22.572    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.780 E0.510
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.728 Y-2.737    ;move above the initial point
G0 Z19.687    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.780 E0.595
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.696 Y-0.195    ;move above the initial point
G0 Z23.727    ;go down to the initial point
G1 X6.213 Y1.925 Z30.780 E0.386
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.738 Y2.276    ;move above the initial point
G0 Z23.625    ;go down to the initial point
G1 X6.213 Y1.925 Z30.780 E0.417
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.810 Y4.784    ;move above the initial point
G0 Z22.572    ;go down to the initial point
G1 X6.213 Y1.925 Z30.780 E0.488
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.070 Y3.885    ;move above the initial point
G0 Z26.973    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.780 E0.244
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.760 Y-0.698    ;move above the initial point
G0 Z25.451    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.780 E0.309
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.117 Y0.686    ;move above the initial point
G0 Z24.762    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.780 E0.327
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.123 Y1.357    ;move above the initial point
G0 Z25.498    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.780 E0.292
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.760 Y-0.698    ;move above the initial point
G0 Z25.451    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.780 E0.299
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.393 Y-0.370    ;move above the initial point
G0 Z25.106    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.780 E0.316
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.570 Y-2.197    ;move above the initial point
G0 Z24.690    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.780 E0.331
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.874 Y-4.668    ;move above the initial point
G0 Z25.016    ;go down to the initial point
G1 X2.145 Y-3.687 Z30.780 E0.319
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.570 Y-2.197    ;move above the initial point
G0 Z24.690    ;go down to the initial point
G1 X2.145 Y-3.687 Z30.780 E0.338
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.393 Y-0.370    ;move above the initial point
G0 Z25.106    ;go down to the initial point
G1 X2.145 Y-3.687 Z30.780 E0.344
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.038 Y-5.261    ;move above the initial point
G0 Z23.835    ;go down to the initial point
G1 X2.145 Y-3.687 Z30.780 E0.377
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.760 Y-0.698    ;move above the initial point
G0 Z25.451    ;go down to the initial point
G1 X-0.934 Y-2.931 Z30.780 E0.305
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.787 Y-3.748    ;move above the initial point
G0 Z25.001    ;go down to the initial point
G1 X-0.934 Y-2.931 Z30.780 E0.320
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.570 Y-2.197    ;move above the initial point
G0 Z24.690    ;go down to the initial point
G1 X-0.934 Y-2.931 Z30.780 E0.330
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.038 Y-5.261    ;move above the initial point
G0 Z23.835    ;go down to the initial point
G1 X-0.934 Y-2.931 Z30.780 E0.396
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.070 Y3.885    ;move above the initial point
G0 Z26.973    ;go down to the initial point
G1 X-1.088 Y2.396 Z30.780 E0.237
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.380 Y3.955    ;move above the initial point
G0 Z27.145    ;go down to the initial point
G1 X-1.088 Y2.396 Z30.780 E0.244
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.123 Y1.357    ;move above the initial point
G0 Z25.498    ;go down to the initial point
G1 X-1.088 Y2.396 Z30.780 E0.288
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.760 Y-0.698    ;move above the initial point
G0 Z25.451    ;go down to the initial point
G1 X-1.088 Y2.396 Z30.780 E0.324
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.191 Y-6.821    ;move above the initial point
G0 Z24.997    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.780 E0.311
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.787 Y-3.748    ;move above the initial point
G0 Z25.001    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.780 E0.315
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y-8.102    ;move above the initial point
G0 Z24.984    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.780 E0.381
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.038 Y-5.261    ;move above the initial point
G0 Z23.835    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.780 E0.404
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.760 Y-0.698    ;move above the initial point
G0 Z25.451    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.780 E0.297
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.787 Y-3.748    ;move above the initial point
G0 Z25.001    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.780 E0.327
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.117 Y0.686    ;move above the initial point
G0 Z24.762    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.780 E0.344
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.021 Y-0.950    ;move above the initial point
G0 Z23.788    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.780 E0.408
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y-5.888    ;move above the initial point
G0 Z26.342    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.780 E0.286
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.787 Y-3.748    ;move above the initial point
G0 Z25.001    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.780 E0.346
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.021 Y-0.950    ;move above the initial point
G0 Z23.788    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.780 E0.391
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.361 Y-9.993    ;move above the initial point
G0 Z25.663    ;go down to the initial point
G1 X2.121 Y-7.777 Z30.780 E0.319
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.864 Y-9.223    ;move above the initial point
G0 Z24.984    ;go down to the initial point
G1 X2.121 Y-7.777 Z30.780 E0.325
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.874 Y-4.668    ;move above the initial point
G0 Z25.016    ;go down to the initial point
G1 X2.121 Y-7.777 Z30.780 E0.354
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.038 Y-5.261    ;move above the initial point
G0 Z23.835    ;go down to the initial point
G1 X2.121 Y-7.777 Z30.780 E0.390
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.437 Y9.391    ;move above the initial point
G0 Z24.304    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.780 E0.340
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.427 Y6.496    ;move above the initial point
G0 Z23.422    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.780 E0.451
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.481 Y7.616    ;move above the initial point
G0 Z20.907    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.780 E0.536
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.437 Y9.391    ;move above the initial point
G0 Z24.304    ;go down to the initial point
G1 X-0.249 Y9.997 Z30.780 E0.378
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.427 Y6.496    ;move above the initial point
G0 Z23.422    ;go down to the initial point
G1 X-0.249 Y9.997 Z30.780 E0.426
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.751 Y9.614    ;move above the initial point
G0 Z21.586    ;go down to the initial point
G1 X-0.249 Y9.997 Z30.780 E0.506
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.106 Y7.036    ;move above the initial point
G0 Z24.984    ;go down to the initial point
G1 X4.562 Y8.899 Z30.780 E0.345
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.810 Y4.784    ;move above the initial point
G0 Z22.572    ;go down to the initial point
G1 X4.562 Y8.899 Z30.780 E0.488
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.751 Y9.614    ;move above the initial point
G0 Z21.586    ;go down to the initial point
G1 X4.562 Y8.899 Z30.780 E0.491
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.106 Y7.036    ;move above the initial point
G0 Z24.984    ;go down to the initial point
G1 X7.660 Y6.428 Z30.780 E0.306
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.738 Y2.276    ;move above the initial point
G0 Z23.625    ;go down to the initial point
G1 X7.660 Y6.428 Z30.780 E0.446
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.810 Y4.784    ;move above the initial point
G0 Z22.572    ;go down to the initial point
G1 X7.660 Y6.428 Z30.780 E0.505
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.738 Y2.276    ;move above the initial point
G0 Z23.625    ;go down to the initial point
G1 X9.950 Y-0.996 Z30.780 E0.411
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.696 Y-0.195    ;move above the initial point
G0 Z23.727    ;go down to the initial point
G1 X9.950 Y-0.996 Z30.780 E0.432
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.738 Y-2.276    ;move above the initial point
G0 Z22.266    ;go down to the initial point
G1 X9.950 Y-0.996 Z30.780 E0.450
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.728 Y-2.737    ;move above the initial point
G0 Z19.687    ;go down to the initial point
G1 X9.950 Y-0.996 Z30.780 E0.647
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.738 Y-2.276    ;move above the initial point
G0 Z22.266    ;go down to the initial point
G1 X8.262 Y-5.633 Z30.780 E0.484
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.593 Y-8.290    ;move above the initial point
G0 Z20.227    ;go down to the initial point
G1 X8.262 Y-5.633 Z30.780 E0.585
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.728 Y-2.737    ;move above the initial point
G0 Z19.687    ;go down to the initial point
G1 X8.262 Y-5.633 Z30.780 E0.627
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y-5.888    ;move above the initial point
G0 Z26.342    ;go down to the initial point
G1 X-6.617 Y-7.498 Z30.780 E0.258
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y-8.102    ;move above the initial point
G0 Z24.984    ;go down to the initial point
G1 X-6.617 Y-7.498 Z30.780 E0.307
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.787 Y-3.748    ;move above the initial point
G0 Z25.001    ;go down to the initial point
G1 X-6.617 Y-7.498 Z30.780 E0.412
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.361 Y-9.993    ;move above the initial point
G0 Z25.663    ;go down to the initial point
G1 X-1.243 Y-9.922 Z30.780 E0.271
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.191 Y-6.821    ;move above the initial point
G0 Z24.997    ;go down to the initial point
G1 X-1.243 Y-9.922 Z30.780 E0.346
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y-8.102    ;move above the initial point
G0 Z24.984    ;go down to the initial point
G1 X-1.243 Y-9.922 Z30.780 E0.399
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.038 Y-5.261    ;move above the initial point
G0 Z23.835    ;go down to the initial point
G1 X-1.243 Y-9.922 Z30.780 E0.453
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.509 Y3.096    ;move above the initial point
G0 Z26.342    ;go down to the initial point
G1 X-9.397 Y3.420 Z30.780 E0.233
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y5.888    ;move above the initial point
G0 Z26.342    ;go down to the initial point
G1 X-9.397 Y3.420 Z30.780 E0.274
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.117 Y0.686    ;move above the initial point
G0 Z24.762    ;go down to the initial point
G1 X-9.397 Y3.420 Z30.780 E0.411
G91    ;set relative coords
G0 Z1.000  ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.021 Y-0.950    ;move above the initial point
G0 Z23.788    ;go down to the initial point
G1 X-9.397 Y3.420 Z30.780 E0.448
; start top printing
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.000 E0.399
G1 X-6.617 Y-7.498 Z30.000 E0.214
G1 X-9.397 Y3.420 Z30.000 E0.589
G1 X-1.835 Y5.689 Z30.000 E0.412
G1 X-4.113 Y9.115 Z30.000 E0.215
G1 X-9.397 Y3.420 Z30.000 E0.406
G1 X-3.464 Y1.216 Z30.000 E0.331
G1 X-6.018 Y-3.438 Z30.000 E0.277
G1 X-2.358 Y-5.414 Z30.000 E0.217
G1 X2.121 Y-7.777 Z30.000 E0.265
G1 X-1.243 Y-9.922 Z30.000 E0.208
G1 X-2.358 Y-5.414 Z30.000 E0.243
G1 X-6.617 Y-7.498 Z30.000 E0.248
G1 X-1.243 Y-9.922 Z30.000 E0.308
G1 X8.262 Y-5.633 Z30.000 E0.545
G1 X9.950 Y-0.996 Z30.000 E0.258
G1 X6.213 Y1.925 Z30.000 E0.248
G1 X7.660 Y6.428 Z30.000 E0.247
G1 X9.950 Y-0.996 Z30.000 E0.406
G1 X4.591 Y-0.189 Z30.000 E0.283
G1 X6.213 Y1.925 Z30.000 E0.139
G1 X1.596 Y6.807 Z30.000 E0.351
G1 X7.660 Y6.428 Z30.000 E0.317
G1 X4.562 Y8.899 Z30.000 E0.207
G1 X1.596 Y6.807 Z30.000 E0.190
G1 X-0.249 Y9.997 Z30.000 E0.193
G1 X4.562 Y8.899 Z30.000 E0.258
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.000 E0.240
G1 X-3.464 Y1.216 Z30.000 E0.249
G1 X-1.088 Y2.396 Z30.000 E0.139
G1 X6.213 Y1.925 Z30.000 E0.382
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.088 Y2.396    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.000 E0.326
G1 X8.262 Y-5.633 Z30.000 E0.343
G1 X2.121 Y-7.777 Z30.000 E0.340
G1 X2.145 Y-3.687 Z30.000 E0.214
G1 X8.262 Y-5.633 Z30.000 E0.335
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.145 Y-3.687    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.000 E0.223
G1 X0.322 Y-0.459 Z30.000 E0.224
G1 X-1.088 Y2.396 Z30.000 E0.166
G1 X1.596 Y6.807 Z30.000 E0.270
G1 X-1.835 Y5.689 Z30.000 E0.189
G1 X-1.088 Y2.396 Z30.000 E0.176
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.000 E0.216
G1 X-3.592 Y-1.496 Z30.000 E0.142
G1 X-6.018 Y-3.438 Z30.000 E0.162
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-3.592 Y-1.496    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.000 E0.215
G1 X2.145 Y-3.687 Z30.000 E0.252
G1 X-0.934 Y-2.931 Z30.000 E0.166
G1 X-2.358 Y-5.414 Z30.000 E0.150
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.934 Y-2.931    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.000 E0.145
G1 X2.145 Y-3.687 Z30.000 E0.194
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.000 E0.212
G1 X-0.934 Y-2.931 Z30.000 E0.158
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.000    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.000 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.260 E0.399
G1 X-6.617 Y-7.498 Z30.260 E0.214
G1 X-9.397 Y3.420 Z30.260 E0.589
G1 X-1.835 Y5.689 Z30.260 E0.412
G1 X-4.113 Y9.115 Z30.260 E0.215
G1 X-9.397 Y3.420 Z30.260 E0.406
G1 X-3.464 Y1.216 Z30.260 E0.331
G1 X-6.018 Y-3.438 Z30.260 E0.277
G1 X-2.358 Y-5.414 Z30.260 E0.217
G1 X2.121 Y-7.777 Z30.260 E0.265
G1 X-1.243 Y-9.922 Z30.260 E0.208
G1 X-2.358 Y-5.414 Z30.260 E0.243
G1 X-6.617 Y-7.498 Z30.260 E0.248
G1 X-1.243 Y-9.922 Z30.260 E0.308
G1 X8.262 Y-5.633 Z30.260 E0.545
G1 X9.950 Y-0.996 Z30.260 E0.258
G1 X6.213 Y1.925 Z30.260 E0.248
G1 X7.660 Y6.428 Z30.260 E0.247
G1 X9.950 Y-0.996 Z30.260 E0.406
G1 X4.591 Y-0.189 Z30.260 E0.283
G1 X6.213 Y1.925 Z30.260 E0.139
G1 X1.596 Y6.807 Z30.260 E0.351
G1 X7.660 Y6.428 Z30.260 E0.317
G1 X4.562 Y8.899 Z30.260 E0.207
G1 X1.596 Y6.807 Z30.260 E0.190
G1 X-0.249 Y9.997 Z30.260 E0.193
G1 X4.562 Y8.899 Z30.260 E0.258
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.260 E0.240
G1 X-3.464 Y1.216 Z30.260 E0.249
G1 X-1.088 Y2.396 Z30.260 E0.139
G1 X6.213 Y1.925 Z30.260 E0.382
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.088 Y2.396    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.260 E0.326
G1 X8.262 Y-5.633 Z30.260 E0.343
G1 X2.121 Y-7.777 Z30.260 E0.340
G1 X2.145 Y-3.687 Z30.260 E0.214
G1 X8.262 Y-5.633 Z30.260 E0.335
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.145 Y-3.687    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.260 E0.223
G1 X0.322 Y-0.459 Z30.260 E0.224
G1 X-1.088 Y2.396 Z30.260 E0.166
G1 X1.596 Y6.807 Z30.260 E0.270
G1 X-1.835 Y5.689 Z30.260 E0.189
G1 X-1.088 Y2.396 Z30.260 E0.176
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.260 E0.216
G1 X-3.592 Y-1.496 Z30.260 E0.142
G1 X-6.018 Y-3.438 Z30.260 E0.162
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-3.592 Y-1.496    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.260 E0.215
G1 X2.145 Y-3.687 Z30.260 E0.252
G1 X-0.934 Y-2.931 Z30.260 E0.166
G1 X-2.358 Y-5.414 Z30.260 E0.150
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.934 Y-2.931    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.260 E0.145
G1 X2.145 Y-3.687 Z30.260 E0.194
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.260 E0.212
G1 X-0.934 Y-2.931 Z30.260 E0.158
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.260    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.260 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.520 E0.399
G1 X-6.617 Y-7.498 Z30.520 E0.214
G1 X-9.397 Y3.420 Z30.520 E0.589
G1 X-1.835 Y5.689 Z30.520 E0.412
G1 X-4.113 Y9.115 Z30.520 E0.215
G1 X-9.397 Y3.420 Z30.520 E0.406
G1 X-3.464 Y1.216 Z30.520 E0.331
G1 X-6.018 Y-3.438 Z30.520 E0.277
G1 X-2.358 Y-5.414 Z30.520 E0.217
G1 X2.121 Y-7.777 Z30.520 E0.265
G1 X-1.243 Y-9.922 Z30.520 E0.208
G1 X-2.358 Y-5.414 Z30.520 E0.243
G1 X-6.617 Y-7.498 Z30.520 E0.248
G1 X-1.243 Y-9.922 Z30.520 E0.308
G1 X8.262 Y-5.633 Z30.520 E0.545
G1 X9.950 Y-0.996 Z30.520 E0.258
G1 X6.213 Y1.925 Z30.520 E0.248
G1 X7.660 Y6.428 Z30.520 E0.247
G1 X9.950 Y-0.996 Z30.520 E0.406
G1 X4.591 Y-0.189 Z30.520 E0.283
G1 X6.213 Y1.925 Z30.520 E0.139
G1 X1.596 Y6.807 Z30.520 E0.351
G1 X7.660 Y6.428 Z30.520 E0.317
G1 X4.562 Y8.899 Z30.520 E0.207
G1 X1.596 Y6.807 Z30.520 E0.190
G1 X-0.249 Y9.997 Z30.520 E0.193
G1 X4.562 Y8.899 Z30.520 E0.258
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.520 E0.240
G1 X-3.464 Y1.216 Z30.520 E0.249
G1 X-1.088 Y2.396 Z30.520 E0.139
G1 X6.213 Y1.925 Z30.520 E0.382
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.088 Y2.396    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.520 E0.326
G1 X8.262 Y-5.633 Z30.520 E0.343
G1 X2.121 Y-7.777 Z30.520 E0.340
G1 X2.145 Y-3.687 Z30.520 E0.214
G1 X8.262 Y-5.633 Z30.520 E0.335
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.145 Y-3.687    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.520 E0.223
G1 X0.322 Y-0.459 Z30.520 E0.224
G1 X-1.088 Y2.396 Z30.520 E0.166
G1 X1.596 Y6.807 Z30.520 E0.270
G1 X-1.835 Y5.689 Z30.520 E0.189
G1 X-1.088 Y2.396 Z30.520 E0.176
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.520 E0.216
G1 X-3.592 Y-1.496 Z30.520 E0.142
G1 X-6.018 Y-3.438 Z30.520 E0.162
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-3.592 Y-1.496    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.520 E0.215
G1 X2.145 Y-3.687 Z30.520 E0.252
G1 X-0.934 Y-2.931 Z30.520 E0.166
G1 X-2.358 Y-5.414 Z30.520 E0.150
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.934 Y-2.931    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.520 E0.145
G1 X2.145 Y-3.687 Z30.520 E0.194
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.520 E0.212
G1 X-0.934 Y-2.931 Z30.520 E0.158
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.520    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.520 E0.207
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.780 E0.399
G1 X-6.617 Y-7.498 Z30.780 E0.214
G1 X-9.397 Y3.420 Z30.780 E0.589
G1 X-1.835 Y5.689 Z30.780 E0.412
G1 X-4.113 Y9.115 Z30.780 E0.215
G1 X-9.397 Y3.420 Z30.780 E0.406
G1 X-3.464 Y1.216 Z30.780 E0.331
G1 X-6.018 Y-3.438 Z30.780 E0.277
G1 X-2.358 Y-5.414 Z30.780 E0.217
G1 X2.121 Y-7.777 Z30.780 E0.265
G1 X-1.243 Y-9.922 Z30.780 E0.208
G1 X-2.358 Y-5.414 Z30.780 E0.243
G1 X-6.617 Y-7.498 Z30.780 E0.248
G1 X-1.243 Y-9.922 Z30.780 E0.308
G1 X8.262 Y-5.633 Z30.780 E0.545
G1 X9.950 Y-0.996 Z30.780 E0.258
G1 X6.213 Y1.925 Z30.780 E0.248
G1 X7.660 Y6.428 Z30.780 E0.247
G1 X9.950 Y-0.996 Z30.780 E0.406
G1 X4.591 Y-0.189 Z30.780 E0.283
G1 X6.213 Y1.925 Z30.780 E0.139
G1 X1.596 Y6.807 Z30.780 E0.351
G1 X7.660 Y6.428 Z30.780 E0.317
G1 X4.562 Y8.899 Z30.780 E0.207
G1 X1.596 Y6.807 Z30.780 E0.190
G1 X-0.249 Y9.997 Z30.780 E0.193
G1 X4.562 Y8.899 Z30.780 E0.258
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.780 E0.240
G1 X-3.464 Y1.216 Z30.780 E0.249
G1 X-1.088 Y2.396 Z30.780 E0.139
G1 X6.213 Y1.925 Z30.780 E0.382
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.088 Y2.396    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.780 E0.326
G1 X8.262 Y-5.633 Z30.780 E0.343
G1 X2.121 Y-7.777 Z30.780 E0.340
G1 X2.145 Y-3.687 Z30.780 E0.214
G1 X8.262 Y-5.633 Z30.780 E0.335
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.145 Y-3.687    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.780 E0.223
G1 X0.322 Y-0.459 Z30.780 E0.224
G1 X-1.088 Y2.396 Z30.780 E0.166
G1 X1.596 Y6.807 Z30.780 E0.270
G1 X-1.835 Y5.689 Z30.780 E0.189
G1 X-1.088 Y2.396 Z30.780 E0.176
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.780 E0.216
G1 X-3.592 Y-1.496 Z30.780 E0.142
G1 X-6.018 Y-3.438 Z30.780 E0.162
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-3.592 Y-1.496    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.780 E0.215
G1 X2.145 Y-3.687 Z30.780 E0.252
G1 X-0.934 Y-2.931 Z30.780 E0.166
G1 X-2.358 Y-5.414 Z30.780 E0.150
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.934 Y-2.931    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.780 E0.145
G1 X2.145 Y-3.687 Z30.780 E0.194
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.780 E0.212
G1 X-0.934 Y-2.931 Z30.780 E0.158
G91    ;set relative coords
G0 Z0.500  ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.780    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.780 E0.207
G1 E-1 F600
G91 
G1 Z10 E-5  ;raise the extruder 1 cm
G0 X-100.0    ;move to the initial point
M104 S0    ;turn off the extruder
M140 S0    ;turn off the bed
M84    ;disable motors
