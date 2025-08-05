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
G1 Y5 E15.151
G0 X100.000 Y100.000 Z0.260 F9000    ;move to origin
G92 X0 Y0 Z0    ;set current position as origin
; start base printing
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.000 F100    ;go down to the initial point
G1 X-5.835 Y0.988 Z0.000 E15.381
G1 X-3.118 Y4.337 Z0.000 E15.607
G1 X-7.331 Y6.802 Z0.000 E15.862
G1 X-5.835 Y0.988 Z0.000 E16.175
G1 X-3.342 Y-2.531 Z0.000 E16.401
G1 X-6.617 Y-7.498 Z0.000 E16.712
G1 X-9.010 Y-4.339 Z0.000 E16.919
G1 X-3.342 Y-2.531 Z0.000 E17.229
G1 X1.654 Y-4.420 Z0.000 E17.508
G1 X0.747 Y-9.972 Z0.000 E17.802
G1 X-3.185 Y-9.479 Z0.000 E18.009
G1 X-1.788 Y-5.972 Z0.000 E18.207
G1 X0.747 Y-9.972 Z0.000 E18.454
G1 X4.562 Y-8.899 Z0.000 E18.661
G1 X1.654 Y-4.420 Z0.000 E18.940
G1 X-1.788 Y-5.972 Z0.000 E19.137
G1 X-3.342 Y-2.531 Z0.000 E19.335
G1 X0.929 Y1.609 Z0.000 E19.645
G1 X1.654 Y-4.420 Z0.000 E19.963
G1 X7.660 Y-6.428 Z0.000 E20.293
G1 X5.315 Y-0.532 Z0.000 E20.625
G1 X9.950 Y0.996 Z0.000 E20.880
G1 X9.556 Y-2.948 Z0.000 E21.087
G1 X5.315 Y-0.532 Z0.000 E21.342
G1 X8.782 Y4.783 Z0.000 E21.674
G1 X9.950 Y0.996 Z0.000 E21.881
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.000 F100    ;go down to the initial point
G1 X0.929 Y1.609 Z2.000 E24.323
G1 X-5.835 Y0.988 Z0.000 E22.678
G1 X-9.010 Y-4.339 Z0.000 E23.002
G1 X-9.988 Y-0.498 Z0.000 E23.209
G1 X-9.397 Y3.420 Z0.000 E23.416
G1 X-5.835 Y0.988 Z0.000 E23.641
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.000 F100    ;go down to the initial point
G1 X-7.331 Y6.802 Z2.000 E25.848
G1 X-4.113 Y9.115 Z0.000 E24.055
G1 X-3.118 Y4.337 Z0.000 E24.310
G1 X-0.249 Y9.997 Z0.000 E24.642
G1 X-4.113 Y9.115 Z0.000 E24.849
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.000 F100    ;go down to the initial point
G1 X0.929 Y1.609 Z2.000 E27.291
G1 X5.315 Y-0.532 Z0.000 E25.546
G1 X1.654 Y-4.420 Z0.000 E25.825
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.000 F100    ;go down to the initial point
G1 X6.235 Y7.818 Z2.000 E28.252
G1 X3.653 Y9.309 Z0.000 E26.408
G1 X0.929 Y1.609 Z0.000 E26.835
G1 X-3.118 Y4.337 Z0.000 E27.090
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.000 F100    ;go down to the initial point
G1 X-0.249 Y9.997 Z2.000 E29.297
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.000 F100    ;go down to the initial point
G1 X8.782 Y4.783 Z2.000 E29.504
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.000 F100    ;go down to the initial point
G1 X7.660 Y-6.428 Z2.000 E29.711
G1 X4.562 Y-8.899 Z0.000 E27.918
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.000 F100    ;go down to the initial point
G1 X-6.617 Y-7.498 Z2.000 E30.182
G1 X-3.185 Y-9.479 Z0.000 E28.389
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.260 F100    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.260 F100    ;go down to the initial point
G1 X-5.835 Y0.988 Z2.260 E30.620
G1 X-3.118 Y4.337 Z0.260 E28.845
G1 X-7.331 Y6.802 Z0.260 E29.100
G1 X-5.835 Y0.988 Z0.260 E29.414
G1 X-3.342 Y-2.531 Z0.260 E29.639
G1 X-6.617 Y-7.498 Z0.260 E29.950
G1 X-9.010 Y-4.339 Z0.260 E30.157
G1 X-3.342 Y-2.531 Z0.260 E30.468
G1 X1.654 Y-4.420 Z0.260 E30.747
G1 X0.747 Y-9.972 Z0.260 E31.041
G1 X-3.185 Y-9.479 Z0.260 E31.248
G1 X-1.788 Y-5.972 Z0.260 E31.445
G1 X0.747 Y-9.972 Z0.260 E31.692
G1 X4.562 Y-8.899 Z0.260 E31.899
G1 X1.654 Y-4.420 Z0.260 E32.178
G1 X-1.788 Y-5.972 Z0.260 E32.376
G1 X-3.342 Y-2.531 Z0.260 E32.573
G1 X0.929 Y1.609 Z0.260 E32.884
G1 X1.654 Y-4.420 Z0.260 E33.201
G1 X7.660 Y-6.428 Z0.260 E33.532
G1 X5.315 Y-0.532 Z0.260 E33.863
G1 X9.950 Y0.996 Z0.260 E34.118
G1 X9.556 Y-2.948 Z0.260 E34.325
G1 X5.315 Y-0.532 Z0.260 E34.580
G1 X8.782 Y4.783 Z0.260 E34.912
G1 X9.950 Y0.996 Z0.260 E35.119
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.260 F100    ;go down to the initial point
G1 X0.929 Y1.609 Z2.260 E37.561
G1 X-5.835 Y0.988 Z0.260 E35.916
G1 X-9.010 Y-4.339 Z0.260 E36.240
G1 X-9.988 Y-0.498 Z0.260 E36.447
G1 X-9.397 Y3.420 Z0.260 E36.654
G1 X-5.835 Y0.988 Z0.260 E36.880
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.260 F100    ;go down to the initial point
G1 X-7.331 Y6.802 Z2.260 E39.087
G1 X-4.113 Y9.115 Z0.260 E37.294
G1 X-3.118 Y4.337 Z0.260 E37.549
G1 X-0.249 Y9.997 Z0.260 E37.880
G1 X-4.113 Y9.115 Z0.260 E38.087
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.260 F100    ;go down to the initial point
G1 X0.929 Y1.609 Z2.260 E40.530
G1 X5.315 Y-0.532 Z0.260 E38.785
G1 X1.654 Y-4.420 Z0.260 E39.064
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.260 F100    ;go down to the initial point
G1 X6.235 Y7.818 Z2.260 E41.491
G1 X3.653 Y9.309 Z0.260 E39.646
G1 X0.929 Y1.609 Z0.260 E40.073
G1 X-3.118 Y4.337 Z0.260 E40.328
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.260 F100    ;go down to the initial point
G1 X-0.249 Y9.997 Z2.260 E42.535
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.260 F100    ;go down to the initial point
G1 X8.782 Y4.783 Z2.260 E42.742
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.260 F100    ;go down to the initial point
G1 X7.660 Y-6.428 Z2.260 E42.949
G1 X4.562 Y-8.899 Z0.260 E41.156
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.260 F100    ;go down to the initial point
G1 X-6.617 Y-7.498 Z2.260 E43.421
G1 X-3.185 Y-9.479 Z0.260 E41.628
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.520 F100    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.520 F100    ;go down to the initial point
G1 X-5.835 Y0.988 Z2.520 E43.858
G1 X-3.118 Y4.337 Z0.520 E42.083
G1 X-7.331 Y6.802 Z0.520 E42.338
G1 X-5.835 Y0.988 Z0.520 E42.652
G1 X-3.342 Y-2.531 Z0.520 E42.877
G1 X-6.617 Y-7.498 Z0.520 E43.188
G1 X-9.010 Y-4.339 Z0.520 E43.395
G1 X-3.342 Y-2.531 Z0.520 E43.706
G1 X1.654 Y-4.420 Z0.520 E43.985
G1 X0.747 Y-9.972 Z0.520 E44.279
G1 X-3.185 Y-9.479 Z0.520 E44.486
G1 X-1.788 Y-5.972 Z0.520 E44.683
G1 X0.747 Y-9.972 Z0.520 E44.931
G1 X4.562 Y-8.899 Z0.520 E45.138
G1 X1.654 Y-4.420 Z0.520 E45.417
G1 X-1.788 Y-5.972 Z0.520 E45.614
G1 X-3.342 Y-2.531 Z0.520 E45.811
G1 X0.929 Y1.609 Z0.520 E46.122
G1 X1.654 Y-4.420 Z0.520 E46.439
G1 X7.660 Y-6.428 Z0.520 E46.770
G1 X5.315 Y-0.532 Z0.520 E47.102
G1 X9.950 Y0.996 Z0.520 E47.357
G1 X9.556 Y-2.948 Z0.520 E47.564
G1 X5.315 Y-0.532 Z0.520 E47.819
G1 X8.782 Y4.783 Z0.520 E48.150
G1 X9.950 Y0.996 Z0.520 E48.357
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.520 F100    ;go down to the initial point
G1 X0.929 Y1.609 Z2.520 E50.800
G1 X-5.835 Y0.988 Z0.520 E49.155
G1 X-9.010 Y-4.339 Z0.520 E49.479
G1 X-9.988 Y-0.498 Z0.520 E49.686
G1 X-9.397 Y3.420 Z0.520 E49.893
G1 X-5.835 Y0.988 Z0.520 E50.118
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.520 F100    ;go down to the initial point
G1 X-7.331 Y6.802 Z2.520 E52.325
G1 X-4.113 Y9.115 Z0.520 E50.532
G1 X-3.118 Y4.337 Z0.520 E50.787
G1 X-0.249 Y9.997 Z0.520 E51.119
G1 X-4.113 Y9.115 Z0.520 E51.326
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.520 F100    ;go down to the initial point
G1 X0.929 Y1.609 Z2.520 E53.768
G1 X5.315 Y-0.532 Z0.520 E52.023
G1 X1.654 Y-4.420 Z0.520 E52.302
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.520 F100    ;go down to the initial point
G1 X6.235 Y7.818 Z2.520 E54.729
G1 X3.653 Y9.309 Z0.520 E52.885
G1 X0.929 Y1.609 Z0.520 E53.311
G1 X-3.118 Y4.337 Z0.520 E53.566
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.520 F100    ;go down to the initial point
G1 X-0.249 Y9.997 Z2.520 E55.773
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.520 F100    ;go down to the initial point
G1 X8.782 Y4.783 Z2.520 E55.980
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.520 F100    ;go down to the initial point
G1 X7.660 Y-6.428 Z2.520 E56.187
G1 X4.562 Y-8.899 Z0.520 E54.394
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.520 F100    ;go down to the initial point
G1 X-6.617 Y-7.498 Z2.520 E56.659
G1 X-3.185 Y-9.479 Z0.520 E54.866
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-5.835 Y0.988 Z2.780 E57.096
G1 X-3.118 Y4.337 Z0.780 E55.322
G1 X-7.331 Y6.802 Z0.780 E55.577
G1 X-5.835 Y0.988 Z0.780 E55.890
G1 X-3.342 Y-2.531 Z0.780 E56.116
G1 X-6.617 Y-7.498 Z0.780 E56.427
G1 X-9.010 Y-4.339 Z0.780 E56.634
G1 X-3.342 Y-2.531 Z0.780 E56.944
G1 X1.654 Y-4.420 Z0.780 E57.223
G1 X0.747 Y-9.972 Z0.780 E57.517
G1 X-3.185 Y-9.479 Z0.780 E57.724
G1 X-1.788 Y-5.972 Z0.780 E57.922
G1 X0.747 Y-9.972 Z0.780 E58.169
G1 X4.562 Y-8.899 Z0.780 E58.376
G1 X1.654 Y-4.420 Z0.780 E58.655
G1 X-1.788 Y-5.972 Z0.780 E58.852
G1 X-3.342 Y-2.531 Z0.780 E59.050
G1 X0.929 Y1.609 Z0.780 E59.360
G1 X1.654 Y-4.420 Z0.780 E59.678
G1 X7.660 Y-6.428 Z0.780 E60.009
G1 X5.315 Y-0.532 Z0.780 E60.340
G1 X9.950 Y0.996 Z0.780 E60.595
G1 X9.556 Y-2.948 Z0.780 E60.802
G1 X5.315 Y-0.532 Z0.780 E61.057
G1 X8.782 Y4.783 Z0.780 E61.389
G1 X9.950 Y0.996 Z0.780 E61.596
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X0.929 Y1.609 Z2.780 E64.038
G1 X-5.835 Y0.988 Z0.780 E62.393
G1 X-9.010 Y-4.339 Z0.780 E62.717
G1 X-9.988 Y-0.498 Z0.780 E62.924
G1 X-9.397 Y3.420 Z0.780 E63.131
G1 X-5.835 Y0.988 Z0.780 E63.356
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-7.331 Y6.802 Z2.780 E65.563
G1 X-4.113 Y9.115 Z0.780 E63.770
G1 X-3.118 Y4.337 Z0.780 E64.025
G1 X-0.249 Y9.997 Z0.780 E64.357
G1 X-4.113 Y9.115 Z0.780 E64.564
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X0.929 Y1.609 Z2.780 E67.007
G1 X5.315 Y-0.532 Z0.780 E65.262
G1 X1.654 Y-4.420 Z0.780 E65.541
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X6.235 Y7.818 Z2.780 E67.967
G1 X3.653 Y9.309 Z0.780 E66.123
G1 X0.929 Y1.609 Z0.780 E66.550
G1 X-3.118 Y4.337 Z0.780 E66.805
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-0.249 Y9.997 Z2.780 E69.012
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X8.782 Y4.783 Z2.780 E69.219
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X7.660 Y-6.428 Z2.780 E69.426
G1 X4.562 Y-8.899 Z0.780 E67.633
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-6.617 Y-7.498 Z2.780 E69.897
G1 X-3.185 Y-9.479 Z0.780 E68.104
G1 F5.000
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.185 Y-9.479    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-1.923 Y-9.813 Z3.920 E70.282
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.747 Y-9.972    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-1.923 Y-9.813 Z3.920 E70.498
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-1.923 Y-9.813 Z3.920 E70.757
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.185 Y-9.479    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-4.165 Y-9.091 Z3.920 E70.930
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.617 Y-7.498    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-4.165 Y-9.091 Z3.920 E71.154
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-4.165 Y-9.091 Z3.920 E71.417
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-9.930 Y1.178 Z3.920 E71.603
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-9.930 Y1.178 Z3.920 E71.806
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-9.930 Y1.178 Z3.920 E72.076
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-1.245 Y-4.521 Z4.280 E72.276
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-1.245 Y-4.521 Z4.280 E72.513
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-1.245 Y-4.521 Z4.280 E72.750
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.331 Y6.802    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-5.862 Y8.102 Z4.599 E72.975
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.113 Y9.115    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-5.862 Y8.102 Z4.599 E73.201
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-5.862 Y8.102 Z4.599 E73.515
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.950 Y0.996    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X9.974 Y-0.721 Z4.599 E73.734
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X9.974 Y-0.721 Z4.599 E73.966
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X9.974 Y-0.721 Z4.599 E74.281
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-8.906 Y4.549 Z4.599 E74.491
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.331 Y6.802    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-8.906 Y4.549 Z4.599 E74.736
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-8.906 Y4.549 Z4.599 E75.053
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-5.191 Y3.982 Z5.030 E75.301
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-5.191 Y3.982 Z5.030 E75.574
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.331 Y6.802    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-5.191 Y3.982 Z5.030 E75.863
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X0.067 Y-6.504 Z5.030 E76.107
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X0.067 Y-6.504 Z5.030 E76.368
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.747 Y-9.972    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X0.067 Y-6.504 Z5.030 E76.657
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X2.745 Y-0.959 Z5.130 E76.922
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X2.745 Y-0.959 Z5.130 E77.202
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X2.745 Y-0.959 Z5.130 E77.498
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-0.317 Y-1.902 Z5.230 E77.781
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-0.317 Y-1.902 Z5.230 E78.067
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-0.317 Y-1.902 Z5.230 E78.371
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.988 Y-0.498    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-9.930 Y-1.178 Z5.279 E78.608
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.010 Y-4.339    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-9.930 Y-1.178 Z5.279 E78.900
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-9.930 Y-1.178 Z5.279 E79.237
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.950 Y0.996    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X9.820 Y1.891 Z5.279 E79.477
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X9.820 Y1.891 Z5.279 E79.761
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X9.820 Y1.891 Z5.279 E80.117
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.562 Y-8.899    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X2.751 Y-9.614 Z5.279 E80.373
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.747 Y-9.972    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X2.751 Y-9.614 Z5.279 E80.631
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X2.751 Y-9.614 Z5.279 E80.995
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.113 Y9.115    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-2.689 Y9.632 Z5.279 E81.243
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-2.689 Y9.632 Z5.279 E81.511
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-2.689 Y9.632 Z5.279 E81.875
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.556 Y-2.948    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X9.105 Y-4.135 Z5.279 E82.119
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.660 Y-6.428    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X9.105 Y-4.135 Z5.279 E82.393
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X9.105 Y-4.135 Z5.279 E82.754
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.788 Y-5.972    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-3.561 Y-5.196 Z5.380 E83.014
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-3.561 Y-5.196 Z5.380 E83.292
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.617 Y-7.498    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-3.561 Y-5.196 Z5.380 E83.605
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-2.826 Y2.584 Z5.430 E83.865
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-2.826 Y2.584 Z5.430 E84.166
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-2.826 Y2.584 Z5.430 E84.483
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X4.717 Y-3.641 Z5.630 E84.785
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X4.717 Y-3.641 Z5.630 E85.088
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.660 Y-6.428    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X4.717 Y-3.641 Z5.630 E85.418
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-5.743 Y-1.738 Z5.780 E85.711
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-5.743 Y-1.738 Z5.780 E86.008
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.010 Y-4.339    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-5.743 Y-1.738 Z5.780 E86.349
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.010 Y-4.339    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-8.082 Y-5.888 Z5.958 E86.635
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.617 Y-7.498    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-8.082 Y-5.888 Z5.958 E86.929
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-8.082 Y-5.888 Z5.958 E87.335
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.562 Y-8.899    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X5.915 Y-8.063 Z5.958 E87.618
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.660 Y-6.428    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X5.915 Y-8.063 Z5.958 E87.916
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.654 Y-4.420    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X5.915 Y-8.063 Z5.958 E88.315
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.342 Y-2.531    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-3.086 Y-0.235 Z6.080 E88.617
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.835 Y0.988    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-3.086 Y-0.235 Z6.080 E88.935
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-3.086 Y-0.235 Z6.080 E89.296
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.315 Y-0.532    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X4.770 Y1.482 Z6.980 E89.638
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X4.770 Y1.482 Z6.980 E90.019
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X4.770 Y1.482 Z6.980 E90.441
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.118 Y4.337    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-1.126 Y4.866 Z7.030 E90.785
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-1.126 Y4.866 Z7.030 E91.169
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X-1.126 Y4.866 Z7.030 E91.594
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380 F100    ;go down to the initial point
G1 X-2.280 Y-7.333 Z8.362 E91.797
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030 F100    ;go down to the initial point
G1 X-2.280 Y-7.333 Z8.362 E92.014
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.923 Y-9.813    ;move above the initial point
G0 Z3.920 F100    ;go down to the initial point
G1 X-2.280 Y-7.333 Z8.362 E92.280
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.165 Y-9.091    ;move above the initial point
G0 Z3.920 F100    ;go down to the initial point
G1 X-2.280 Y-7.333 Z8.362 E92.549
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X5.262 Y8.503 Z8.676 E92.966
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X5.262 Y8.503 Z8.676 E93.389
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X5.262 Y8.503 Z8.676 E93.982
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X1.600 Y9.871 Z8.676 E94.405
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.653 Y9.309    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X1.600 Y9.871 Z8.676 E94.833
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X1.600 Y9.871 Z8.676 E95.431
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.235 Y7.818    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X7.637 Y6.456 Z8.676 E95.856
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X8.782 Y4.783    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X7.637 Y6.456 Z8.676 E96.282
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.929 Y1.609    ;move above the initial point
G0 Z0.780 F100    ;go down to the initial point
G1 X7.637 Y6.456 Z8.676 E96.879
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.751 Y-9.614    ;move above the initial point
G0 Z5.279 F100    ;go down to the initial point
G1 X0.033 Y-10.000 Z8.676 E97.108
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030 F100    ;go down to the initial point
G1 X0.033 Y-10.000 Z8.676 E97.371
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.923 Y-9.813    ;move above the initial point
G0 Z3.920 F100    ;go down to the initial point
G1 X0.033 Y-10.000 Z8.676 E97.640
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.751 Y-9.614    ;move above the initial point
G0 Z5.279 F100    ;go down to the initial point
G1 X3.499 Y-9.368 Z9.356 E97.857
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.915 Y-8.063    ;move above the initial point
G0 Z5.958 F100    ;go down to the initial point
G1 X3.499 Y-9.368 Z9.356 E98.085
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030 F100    ;go down to the initial point
G1 X3.499 Y-9.368 Z9.356 E98.410
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y-5.888    ;move above the initial point
G0 Z5.958 F100    ;go down to the initial point
G1 X-6.176 Y-7.865 Z9.356 E98.639
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380 F100    ;go down to the initial point
G1 X-6.176 Y-7.865 Z9.356 E98.924
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.165 Y-9.091    ;move above the initial point
G0 Z3.920 F100    ;go down to the initial point
G1 X-6.176 Y-7.865 Z9.356 E99.233
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.915 Y-8.063    ;move above the initial point
G0 Z5.958 F100    ;go down to the initial point
G1 X7.885 Y-6.151 Z9.356 E99.461
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.105 Y-4.135    ;move above the initial point
G0 Z5.279 F100    ;go down to the initial point
G1 X7.885 Y-6.151 Z9.356 E99.707
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630 F100    ;go down to the initial point
G1 X7.885 Y-6.151 Z9.356 E99.995
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.906 Y4.549    ;move above the initial point
G0 Z4.599 F100    ;go down to the initial point
G1 X-8.308 Y5.566 Z9.356 E100.251
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030 F100    ;go down to the initial point
G1 X-8.308 Y5.566 Z9.356 E100.541
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z4.599 F100    ;go down to the initial point
G1 X-8.308 Y5.566 Z9.356 E100.850
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y1.178    ;move above the initial point
G0 Z3.920 F100    ;go down to the initial point
G1 X-8.308 Y5.566 Z9.356 E101.225
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.743 Y-1.738    ;move above the initial point
G0 Z5.780 F100    ;go down to the initial point
G1 X-5.651 Y-4.235 Z9.506 E101.459
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y-5.888    ;move above the initial point
G0 Z5.958 F100    ;go down to the initial point
G1 X-5.651 Y-4.235 Z9.506 E101.700
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380 F100    ;go down to the initial point
G1 X-5.651 Y-4.235 Z9.506 E101.947
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.743 Y-1.738    ;move above the initial point
G0 Z5.780 F100    ;go down to the initial point
G1 X-7.024 Y1.094 Z9.510 E102.201
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030 F100    ;go down to the initial point
G1 X-7.024 Y1.094 Z9.510 E102.495
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y1.178    ;move above the initial point
G0 Z3.920 F100    ;go down to the initial point
G1 X-7.024 Y1.094 Z9.510 E102.824
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630 F100    ;go down to the initial point
G1 X3.764 Y-5.956 Z9.589 E103.069
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.915 Y-8.063    ;move above the initial point
G0 Z5.958 F100    ;go down to the initial point
G1 X3.764 Y-5.956 Z9.589 E103.316
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030 F100    ;go down to the initial point
G1 X3.764 Y-5.956 Z9.589 E103.624
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.317 Y-1.902    ;move above the initial point
G0 Z5.230 F100    ;go down to the initial point
G1 X1.318 Y-4.005 Z9.747 E103.898
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630 F100    ;go down to the initial point
G1 X1.318 Y-4.005 Z9.747 E104.177
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030 F100    ;go down to the initial point
G1 X1.318 Y-4.005 Z9.747 E104.463
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.105 Y-4.135    ;move above the initial point
G0 Z5.279 F100    ;go down to the initial point
G1 X9.529 Y-3.034 Z10.035 E104.720
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z4.599 F100    ;go down to the initial point
G1 X9.529 Y-3.034 Z10.035 E105.029
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630 F100    ;go down to the initial point
G1 X9.529 Y-3.034 Z10.035 E105.371
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980 F100    ;go down to the initial point
G1 X6.338 Y-0.900 Z10.386 E105.603
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630 F100    ;go down to the initial point
G1 X6.338 Y-0.900 Z10.386 E105.902
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z4.599 F100    ;go down to the initial point
G1 X6.338 Y-0.900 Z10.386 E106.260
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030 F100    ;go down to the initial point
G1 X-3.635 Y3.227 Z10.643 E106.505
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.826 Y2.584    ;move above the initial point
G0 Z5.430 F100    ;go down to the initial point
G1 X-3.635 Y3.227 Z10.643 E106.783
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.086 Y-0.235    ;move above the initial point
G0 Z6.080 F100    ;go down to the initial point
G1 X-3.635 Y3.227 Z10.643 E107.083
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030 F100    ;go down to the initial point
G1 X-3.635 Y3.227 Z10.643 E107.390
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.317 Y-1.902    ;move above the initial point
G0 Z5.230 F100    ;go down to the initial point
G1 X0.223 Y-0.606 Z10.713 E107.686
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.745 Y-0.959    ;move above the initial point
G0 Z5.130 F100    ;go down to the initial point
G1 X0.223 Y-0.606 Z10.713 E108.006
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.826 Y2.584    ;move above the initial point
G0 Z5.430 F100    ;go down to the initial point
G1 X0.223 Y-0.606 Z10.713 E108.366
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y-1.178    ;move above the initial point
G0 Z5.279 F100    ;go down to the initial point
G1 X-9.623 Y-2.720 Z10.715 E108.662
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y-5.888    ;move above the initial point
G0 Z5.958 F100    ;go down to the initial point
G1 X-9.623 Y-2.720 Z10.715 E108.971
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.743 Y-1.738    ;move above the initial point
G0 Z5.780 F100    ;go down to the initial point
G1 X-9.623 Y-2.720 Z10.715 E109.303
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y1.178    ;move above the initial point
G0 Z3.920 F100    ;go down to the initial point
G1 X-9.623 Y-2.720 Z10.715 E109.712
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030 F100    ;go down to the initial point
G1 X-4.221 Y5.495 Z10.803 E109.969
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030 F100    ;go down to the initial point
G1 X-4.221 Y5.495 Z10.803 E110.285
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z4.599 F100    ;go down to the initial point
G1 X-4.221 Y5.495 Z10.803 E110.647
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380 F100    ;go down to the initial point
G1 X-2.427 Y-4.463 Z11.200 E110.959
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.086 Y-0.235    ;move above the initial point
G0 Z6.080 F100    ;go down to the initial point
G1 X-2.427 Y-4.463 Z11.200 E111.308
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.067 Y-6.504    ;move above the initial point
G0 Z5.030 F100    ;go down to the initial point
G1 X-2.427 Y-4.463 Z11.200 E111.672
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.086 Y-0.235    ;move above the initial point
G0 Z6.080 F100    ;go down to the initial point
G1 X-1.334 Y-1.990 Z11.205 E111.969
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.317 Y-1.902    ;move above the initial point
G0 Z5.230 F100    ;go down to the initial point
G1 X-1.334 Y-1.990 Z11.205 E112.286
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.245 Y-4.521    ;move above the initial point
G0 Z4.280 F100    ;go down to the initial point
G1 X-1.334 Y-1.990 Z11.205 E112.671
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.826 Y2.584    ;move above the initial point
G0 Z5.430 F100    ;go down to the initial point
G1 X-1.334 Y-1.990 Z11.205 E113.064
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980 F100    ;go down to the initial point
G1 X3.458 Y-1.932 Z11.343 E113.361
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.717 Y-3.641    ;move above the initial point
G0 Z5.630 F100    ;go down to the initial point
G1 X3.458 Y-1.932 Z11.343 E113.679
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.745 Y-0.959    ;move above the initial point
G0 Z5.130 F100    ;go down to the initial point
G1 X3.458 Y-1.932 Z11.343 E114.010
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.317 Y-1.902    ;move above the initial point
G0 Z5.230 F100    ;go down to the initial point
G1 X3.458 Y-1.932 Z11.343 E114.385
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.689 Y9.632    ;move above the initial point
G0 Z5.279 F100    ;go down to the initial point
G1 X-3.804 Y9.248 Z11.394 E114.711
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030 F100    ;go down to the initial point
G1 X-3.804 Y9.248 Z11.394 E115.063
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z4.599 F100    ;go down to the initial point
G1 X-3.804 Y9.248 Z11.394 E115.439
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.086 Y-0.235    ;move above the initial point
G0 Z6.080 F100    ;go down to the initial point
G1 X-4.456 Y-1.418 Z11.568 E115.741
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.743 Y-1.738    ;move above the initial point
G0 Z5.780 F100    ;go down to the initial point
G1 X-4.456 Y-1.418 Z11.568 E116.051
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.561 Y-5.196    ;move above the initial point
G0 Z5.380 F100    ;go down to the initial point
G1 X-4.456 Y-1.418 Z11.568 E116.432
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.191 Y3.982    ;move above the initial point
G0 Z5.030 F100    ;go down to the initial point
G1 X-4.456 Y-1.418 Z11.568 E116.877
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030 F100    ;go down to the initial point
G1 X-1.151 Y2.850 Z11.663 E117.141
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.826 Y2.584    ;move above the initial point
G0 Z5.430 F100    ;go down to the initial point
G1 X-1.151 Y2.850 Z11.663 E117.479
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.745 Y-0.959    ;move above the initial point
G0 Z5.130 F100    ;go down to the initial point
G1 X-1.151 Y2.850 Z11.663 E117.923
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.600 Y9.871    ;move above the initial point
G0 Z8.676 F100    ;go down to the initial point
G1 X-1.145 Y9.934 Z12.074 E118.151
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.689 Y9.632    ;move above the initial point
G0 Z5.279 F100    ;go down to the initial point
G1 X-1.145 Y9.934 Z12.074 E118.516
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030 F100    ;go down to the initial point
G1 X-1.145 Y9.934 Z12.074 E118.889
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.637 Y6.456    ;move above the initial point
G0 Z8.676 F100    ;go down to the initial point
G1 X7.106 Y7.036 Z12.753 E119.106
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z8.676 F100    ;go down to the initial point
G1 X7.106 Y7.036 Z12.753 E119.352
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980 F100    ;go down to the initial point
G1 X7.106 Y7.036 Z12.753 E119.788
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.600 Y9.871    ;move above the initial point
G0 Z8.676 F100    ;go down to the initial point
G1 X2.371 Y9.715 Z12.753 E120.005
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z8.676 F100    ;go down to the initial point
G1 X2.371 Y9.715 Z12.753 E120.274
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030 F100    ;go down to the initial point
G1 X2.371 Y9.715 Z12.753 E120.706
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.637 Y6.456    ;move above the initial point
G0 Z8.676 F100    ;go down to the initial point
G1 X9.402 Y3.407 Z13.433 E121.015
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980 F100    ;go down to the initial point
G1 X9.402 Y3.407 Z13.433 E121.442
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.820 Y1.891    ;move above the initial point
G0 Z5.279 F100    ;go down to the initial point
G1 X9.402 Y3.407 Z13.433 E121.876
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z4.599 F100    ;go down to the initial point
G1 X9.402 Y3.407 Z13.433 E122.386
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980 F100    ;go down to the initial point
G1 X2.856 Y1.157 Z13.530 E122.743
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030 F100    ;go down to the initial point
G1 X2.856 Y1.157 Z13.530 E123.186
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.745 Y-0.959    ;move above the initial point
G0 Z5.130 F100    ;go down to the initial point
G1 X2.856 Y1.157 Z13.530 E123.639
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.635 Y3.227    ;move above the initial point
G0 Z10.643 F100    ;go down to the initial point
G1 X-6.282 Y3.120 Z13.836 E123.856
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.024 Y1.094    ;move above the initial point
G0 Z9.510 F100    ;go down to the initial point
G1 X-6.282 Y3.120 Z13.836 E124.108
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.308 Y5.566    ;move above the initial point
G0 Z9.356 F100    ;go down to the initial point
G1 X-6.282 Y3.120 Z13.836 E124.395
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z8.676 F100    ;go down to the initial point
G1 X2.942 Y4.851 Z13.862 E124.748
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.770 Y1.482    ;move above the initial point
G0 Z6.980 F100    ;go down to the initial point
G1 X2.942 Y4.851 Z13.862 E125.159
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.126 Y4.866    ;move above the initial point
G0 Z7.030 F100    ;go down to the initial point
G1 X2.942 Y4.851 Z13.862 E125.575
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z9.589 F100    ;go down to the initial point
G1 X2.044 Y-6.123 Z13.887 E125.817
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.318 Y-4.005    ;move above the initial point
G0 Z9.747 F100    ;go down to the initial point
G1 X2.044 Y-6.123 Z13.887 E126.063
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.033 Y-10.000    ;move above the initial point
G0 Z8.676 F100    ;go down to the initial point
G1 X2.044 Y-6.123 Z13.887 E126.418
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.529 Y-3.034    ;move above the initial point
G0 Z10.035 F100    ;go down to the initial point
G1 X9.260 Y-3.774 Z14.112 E126.635
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.885 Y-6.151    ;move above the initial point
G0 Z9.356 F100    ;go down to the initial point
G1 X9.260 Y-3.774 Z14.112 E126.922
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.338 Y-0.900    ;move above the initial point
G0 Z10.386 F100    ;go down to the initial point
G1 X9.260 Y-3.774 Z14.112 E127.211
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.033 Y-10.000    ;move above the initial point
G0 Z8.676 F100    ;go down to the initial point
G1 X-0.754 Y-9.972 Z14.112 E127.498
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.280 Y-7.333    ;move above the initial point
G0 Z8.362 F100    ;go down to the initial point
G1 X-0.754 Y-9.972 Z14.112 E127.838
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.318 Y-4.005    ;move above the initial point
G0 Z9.747 F100    ;go down to the initial point
G1 X-0.754 Y-9.972 Z14.112 E128.239
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.458 Y-1.932    ;move above the initial point
G0 Z11.343 F100    ;go down to the initial point
G1 X2.270 Y-2.802 Z14.298 E128.412
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.223 Y-0.606    ;move above the initial point
G0 Z10.713 F100    ;go down to the initial point
G1 X2.270 Y-2.802 Z14.298 E128.656
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.318 Y-4.005    ;move above the initial point
G0 Z9.747 F100    ;go down to the initial point
G1 X2.270 Y-2.802 Z14.298 E128.907
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z9.589 F100    ;go down to the initial point
G1 X2.270 Y-2.802 Z14.298 E129.213
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.427 Y-4.463    ;move above the initial point
G0 Z11.200 F100    ;go down to the initial point
G1 X-4.202 Y-3.937 Z14.609 E129.416
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z11.568 F100    ;go down to the initial point
G1 X-4.202 Y-3.937 Z14.609 E129.623
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.651 Y-4.235    ;move above the initial point
G0 Z9.506 F100    ;go down to the initial point
G1 X-4.202 Y-3.937 Z14.609 E129.900
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.280 Y-7.333    ;move above the initial point
G0 Z8.362 F100    ;go down to the initial point
G1 X-4.202 Y-3.937 Z14.609 E130.285
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z11.568 F100    ;go down to the initial point
G1 X-6.852 Y-0.783 Z14.747 E130.496
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.623 Y-2.720    ;move above the initial point
G0 Z10.715 F100    ;go down to the initial point
G1 X-6.852 Y-0.783 Z14.747 E130.771
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.024 Y1.094    ;move above the initial point
G0 Z9.510 F100    ;go down to the initial point
G1 X-6.852 Y-0.783 Z14.747 E131.062
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.499 Y-9.368    ;move above the initial point
G0 Z9.356 F100    ;go down to the initial point
G1 X4.924 Y-8.704 Z14.791 E131.357
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z9.589 F100    ;go down to the initial point
G1 X4.924 Y-8.704 Z14.791 E131.670
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.885 Y-6.151    ;move above the initial point
G0 Z9.356 F100    ;go down to the initial point
G1 X4.924 Y-8.704 Z14.791 E132.020
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.033 Y-10.000    ;move above the initial point
G0 Z8.676 F100    ;go down to the initial point
G1 X4.924 Y-8.704 Z14.791 E132.435
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.338 Y-0.900    ;move above the initial point
G0 Z10.386 F100    ;go down to the initial point
G1 X5.985 Y-4.637 Z14.877 E132.741
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z9.589 F100    ;go down to the initial point
G1 X5.985 Y-4.637 Z14.877 E133.048
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.885 Y-6.151    ;move above the initial point
G0 Z9.356 F100    ;go down to the initial point
G1 X5.985 Y-4.637 Z14.877 E133.363
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.176 Y-7.865    ;move above the initial point
G0 Z9.356 F100    ;go down to the initial point
G1 X-5.862 Y-8.102 Z15.471 E133.683
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.651 Y-4.235    ;move above the initial point
G0 Z9.506 F100    ;go down to the initial point
G1 X-5.862 Y-8.102 Z15.471 E134.055
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.280 Y-7.333    ;move above the initial point
G0 Z8.362 F100    ;go down to the initial point
G1 X-5.862 Y-8.102 Z15.471 E134.473
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.033 Y-10.000    ;move above the initial point
G0 Z8.676 F100    ;go down to the initial point
G1 X-5.862 Y-8.102 Z15.471 E134.953
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.623 Y-2.720    ;move above the initial point
G0 Z10.715 F100    ;go down to the initial point
G1 X-8.906 Y-4.549 Z15.471 E135.222
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z11.568 F100    ;go down to the initial point
G1 X-8.906 Y-4.549 Z15.471 E135.572
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.651 Y-4.235    ;move above the initial point
G0 Z9.506 F100    ;go down to the initial point
G1 X-8.906 Y-4.549 Z15.471 E135.927
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.176 Y-7.865    ;move above the initial point
G0 Z9.356 F100    ;go down to the initial point
G1 X-8.906 Y-4.549 Z15.471 E136.318
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z11.568 F100    ;go down to the initial point
G1 X-2.416 Y-0.622 Z16.079 E136.580
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.334 Y-1.990    ;move above the initial point
G0 Z11.205 F100    ;go down to the initial point
G1 X-2.416 Y-0.622 Z16.079 E136.850
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663 F100    ;go down to the initial point
G1 X-2.416 Y-0.622 Z16.079 E137.151
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.623 Y-2.720    ;move above the initial point
G0 Z10.715 F100    ;go down to the initial point
G1 X-9.807 Y1.955 Z16.150 E137.526
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.024 Y1.094    ;move above the initial point
G0 Z9.510 F100    ;go down to the initial point
G1 X-9.807 Y1.955 Z16.150 E137.904
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.308 Y5.566    ;move above the initial point
G0 Z9.356 F100    ;go down to the initial point
G1 X-9.807 Y1.955 Z16.150 E138.314
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.221 Y5.495    ;move above the initial point
G0 Z10.803 F100    ;go down to the initial point
G1 X-4.552 Y4.653 Z16.266 E138.603
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.635 Y3.227    ;move above the initial point
G0 Z10.643 F100    ;go down to the initial point
G1 X-4.552 Y4.653 Z16.266 E138.910
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663 F100    ;go down to the initial point
G1 X-4.552 Y4.653 Z16.266 E139.224
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.308 Y5.566    ;move above the initial point
G0 Z9.356 F100    ;go down to the initial point
G1 X-4.552 Y4.653 Z16.266 E139.637
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z11.568 F100    ;go down to the initial point
G1 X-4.611 Y0.850 Z16.446 E139.918
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663 F100    ;go down to the initial point
G1 X-4.611 Y0.850 Z16.446 E140.244
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.635 Y3.227    ;move above the initial point
G0 Z10.643 F100    ;go down to the initial point
G1 X-4.611 Y0.850 Z16.446 E140.576
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.024 Y1.094    ;move above the initial point
G0 Z9.510 F100    ;go down to the initial point
G1 X-4.611 Y0.850 Z16.446 E140.960
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.942 Y4.851    ;move above the initial point
G0 Z13.862 F100    ;go down to the initial point
G1 X1.706 Y2.917 Z16.618 E141.147
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z13.530 F100    ;go down to the initial point
G1 X1.706 Y2.917 Z16.618 E141.342
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663 F100    ;go down to the initial point
G1 X1.706 Y2.917 Z16.618 E141.641
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.106 Y7.036    ;move above the initial point
G0 Z12.753 F100    ;go down to the initial point
G1 X5.262 Y8.503 Z16.830 E141.887
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.371 Y9.715    ;move above the initial point
G0 Z12.753 F100    ;go down to the initial point
G1 X5.262 Y8.503 Z16.830 E142.156
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.942 Y4.851    ;move above the initial point
G0 Z13.862 F100    ;go down to the initial point
G1 X5.262 Y8.503 Z16.830 E142.430
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.427 Y-4.463    ;move above the initial point
G0 Z11.200 F100    ;go down to the initial point
G1 X-0.982 Y-4.131 Z16.866 E142.736
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.334 Y-1.990    ;move above the initial point
G0 Z11.205 F100    ;go down to the initial point
G1 X-0.982 Y-4.131 Z16.866 E143.053
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.456 Y-1.418    ;move above the initial point
G0 Z11.568 F100    ;go down to the initial point
G1 X-0.982 Y-4.131 Z16.866 E143.413
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.318 Y-4.005    ;move above the initial point
G0 Z9.747 F100    ;go down to the initial point
G1 X-0.982 Y-4.131 Z16.866 E143.804
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.280 Y-7.333    ;move above the initial point
G0 Z8.362 F100    ;go down to the initial point
G1 X-0.982 Y-4.131 Z16.866 E144.283
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z13.530 F100    ;go down to the initial point
G1 X0.074 Y0.872 Z16.872 E144.511
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663 F100    ;go down to the initial point
G1 X0.074 Y0.872 Z16.872 E144.809
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.334 Y-1.990    ;move above the initial point
G0 Z11.205 F100    ;go down to the initial point
G1 X0.074 Y0.872 Z16.872 E145.149
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z13.530 F100    ;go down to the initial point
G1 X4.642 Y-1.394 Z17.262 E145.402
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.458 Y-1.932    ;move above the initial point
G0 Z11.343 F100    ;go down to the initial point
G1 X4.642 Y-1.394 Z17.262 E145.719
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.338 Y-0.900    ;move above the initial point
G0 Z10.386 F100    ;go down to the initial point
G1 X4.642 Y-1.394 Z17.262 E146.090
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.223 Y-0.606    ;move above the initial point
G0 Z10.713 F100    ;go down to the initial point
G1 X4.642 Y-1.394 Z17.262 E146.505
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.764 Y-5.956    ;move above the initial point
G0 Z9.589 F100    ;go down to the initial point
G1 X4.642 Y-1.394 Z17.262 E146.973
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663 F100    ;go down to the initial point
G1 X-2.467 Y5.709 Z17.363 E147.314
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.221 Y5.495    ;move above the initial point
G0 Z10.803 F100    ;go down to the initial point
G1 X-2.467 Y5.709 Z17.363 E147.669
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.145 Y9.934    ;move above the initial point
G0 Z12.074 F100    ;go down to the initial point
G1 X-2.467 Y5.709 Z17.363 E148.029
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.942 Y4.851    ;move above the initial point
G0 Z13.862 F100    ;go down to the initial point
G1 X0.416 Y5.375 Z17.833 E148.276
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.151 Y2.850    ;move above the initial point
G0 Z11.663 F100    ;go down to the initial point
G1 X0.416 Y5.375 Z17.833 E148.634
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.145 Y9.934    ;move above the initial point
G0 Z12.074 F100    ;go down to the initial point
G1 X0.416 Y5.375 Z17.833 E149.027
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.106 Y7.036    ;move above the initial point
G0 Z12.753 F100    ;go down to the initial point
G1 X7.637 Y6.456 Z18.189 E149.313
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.402 Y3.407    ;move above the initial point
G0 Z13.433 F100    ;go down to the initial point
G1 X7.637 Y6.456 Z18.189 E149.623
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.942 Y4.851    ;move above the initial point
G0 Z13.862 F100    ;go down to the initial point
G1 X7.637 Y6.456 Z18.189 E149.967
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.402 Y3.407    ;move above the initial point
G0 Z13.433 F100    ;go down to the initial point
G1 X9.974 Y-0.721 Z18.189 E150.297
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.529 Y-3.034    ;move above the initial point
G0 Z10.035 F100    ;go down to the initial point
G1 X9.974 Y-0.721 Z18.189 E150.740
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.338 Y-0.900    ;move above the initial point
G0 Z10.386 F100    ;go down to the initial point
G1 X9.974 Y-0.721 Z18.189 E151.190
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.804 Y9.248    ;move above the initial point
G0 Z11.394 F100    ;go down to the initial point
G1 X-5.862 Y8.102 Z18.189 E151.566
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.145 Y9.934    ;move above the initial point
G0 Z12.074 F100    ;go down to the initial point
G1 X-5.862 Y8.102 Z18.189 E151.981
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.221 Y5.495    ;move above the initial point
G0 Z10.803 F100    ;go down to the initial point
G1 X-5.862 Y8.102 Z18.189 E152.399
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.308 Y5.566    ;move above the initial point
G0 Z9.356 F100    ;go down to the initial point
G1 X-5.862 Y8.102 Z18.189 E152.896
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.924 Y-8.704    ;move above the initial point
G0 Z14.791 F100    ;go down to the initial point
G1 X2.371 Y-9.715 Z18.189 E153.124
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.754 Y-9.972    ;move above the initial point
G0 Z14.112 F100    ;go down to the initial point
G1 X2.371 Y-9.715 Z18.189 E153.392
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.044 Y-6.123    ;move above the initial point
G0 Z13.887 F100    ;go down to the initial point
G1 X2.371 Y-9.715 Z18.189 E153.686
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z13.530 F100    ;go down to the initial point
G1 X5.951 Y0.850 Z18.600 E153.997
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.402 Y3.407    ;move above the initial point
G0 Z13.433 F100    ;go down to the initial point
G1 X5.951 Y0.850 Z18.600 E154.348
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X6.338 Y-0.900    ;move above the initial point
G0 Z10.386 F100    ;go down to the initial point
G1 X5.951 Y0.850 Z18.600 E154.787
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.906 Y-4.549    ;move above the initial point
G0 Z15.471 F100    ;go down to the initial point
G1 X-6.640 Y-2.989 Z18.792 E155.012
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.852 Y-0.783    ;move above the initial point
G0 Z14.747 F100    ;go down to the initial point
G1 X-6.640 Y-2.989 Z18.792 E155.253
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.202 Y-3.937    ;move above the initial point
G0 Z14.609 F100    ;go down to the initial point
G1 X-6.640 Y-2.989 Z18.792 E155.511
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.416 Y-0.622    ;move above the initial point
G0 Z16.079 F100    ;go down to the initial point
G1 X-4.391 Y-1.839 Z18.845 E155.699
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.202 Y-3.937    ;move above the initial point
G0 Z14.609 F100    ;go down to the initial point
G1 X-4.391 Y-1.839 Z18.845 E155.947
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.852 Y-0.783    ;move above the initial point
G0 Z14.747 F100    ;go down to the initial point
G1 X-4.391 Y-1.839 Z18.845 E156.202
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.371 Y9.715    ;move above the initial point
G0 Z12.753 F100    ;go down to the initial point
G1 X1.210 Y9.927 Z18.868 E156.528
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.145 Y9.934    ;move above the initial point
G0 Z12.074 F100    ;go down to the initial point
G1 X1.210 Y9.927 Z18.868 E156.903
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.942 Y4.851    ;move above the initial point
G0 Z13.862 F100    ;go down to the initial point
G1 X1.210 Y9.927 Z18.868 E157.287
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y-8.102    ;move above the initial point
G0 Z15.471 F100    ;go down to the initial point
G1 X-7.333 Y-6.799 Z18.868 E157.492
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.906 Y-4.549    ;move above the initial point
G0 Z15.471 F100    ;go down to the initial point
G1 X-7.333 Y-6.799 Z18.868 E157.720
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.202 Y-3.937    ;move above the initial point
G0 Z14.609 F100    ;go down to the initial point
G1 X-7.333 Y-6.799 Z18.868 E158.034
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.982 Y-4.131    ;move above the initial point
G0 Z16.866 F100    ;go down to the initial point
G1 X-1.790 Y-2.595 Z19.163 E158.184
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.416 Y-0.622    ;move above the initial point
G0 Z16.079 F100    ;go down to the initial point
G1 X-1.790 Y-2.595 Z19.163 E158.378
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.202 Y-3.937    ;move above the initial point
G0 Z14.609 F100    ;go down to the initial point
G1 X-1.790 Y-2.595 Z19.163 E158.657
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.270 Y-2.802    ;move above the initial point
G0 Z14.298 F100    ;go down to the initial point
G1 X-1.790 Y-2.595 Z19.163 E158.988
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.942 Y4.851    ;move above the initial point
G0 Z13.862 F100    ;go down to the initial point
G1 X4.357 Y3.119 Z19.458 E159.303
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.856 Y1.157    ;move above the initial point
G0 Z13.530 F100    ;go down to the initial point
G1 X4.357 Y3.119 Z19.458 E159.638
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.402 Y3.407    ;move above the initial point
G0 Z13.433 F100    ;go down to the initial point
G1 X4.357 Y3.119 Z19.458 E160.049
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.642 Y-1.394    ;move above the initial point
G0 Z17.262 F100    ;go down to the initial point
G1 X4.728 Y-2.737 Z19.687 E160.194
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.985 Y-4.637    ;move above the initial point
G0 Z14.877 F100    ;go down to the initial point
G1 X4.728 Y-2.737 Z19.687 E160.472
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.270 Y-2.802    ;move above the initial point
G0 Z14.298 F100    ;go down to the initial point
G1 X4.728 Y-2.737 Z19.687 E160.782
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.260 Y-3.774    ;move above the initial point
G0 Z14.112 F100    ;go down to the initial point
G1 X4.728 Y-2.737 Z19.687 E161.161
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.982 Y-4.131    ;move above the initial point
G0 Z16.866 F100    ;go down to the initial point
G1 X0.318 Y-6.449 Z20.055 E161.378
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.044 Y-6.123    ;move above the initial point
G0 Z13.887 F100    ;go down to the initial point
G1 X0.318 Y-6.449 Z20.055 E161.713
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.754 Y-9.972    ;move above the initial point
G0 Z14.112 F100    ;go down to the initial point
G1 X0.318 Y-6.449 Z20.055 E162.078
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.982 Y-4.131    ;move above the initial point
G0 Z16.866 F100    ;go down to the initial point
G1 X-3.552 Y-4.946 Z20.149 E162.300
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.202 Y-3.937    ;move above the initial point
G0 Z14.609 F100    ;go down to the initial point
G1 X-3.552 Y-4.946 Z20.149 E162.596
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y-8.102    ;move above the initial point
G0 Z15.471 F100    ;go down to the initial point
G1 X-3.552 Y-4.946 Z20.149 E162.915
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.807 Y1.955    ;move above the initial point
G0 Z16.150 F100    ;go down to the initial point
G1 X-9.930 Y-1.178 Z20.227 E163.183
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.906 Y-4.549    ;move above the initial point
G0 Z15.471 F100    ;go down to the initial point
G1 X-9.930 Y-1.178 Z20.227 E163.493
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.852 Y-0.783    ;move above the initial point
G0 Z14.747 F100    ;go down to the initial point
G1 X-9.930 Y-1.178 Z20.227 E163.822
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.924 Y-8.704    ;move above the initial point
G0 Z14.791 F100    ;go down to the initial point
G1 X5.593 Y-8.290 Z20.227 E164.109
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.985 Y-4.637    ;move above the initial point
G0 Z14.877 F100    ;go down to the initial point
G1 X5.593 Y-8.290 Z20.227 E164.448
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.044 Y-6.123    ;move above the initial point
G0 Z13.887 F100    ;go down to the initial point
G1 X5.593 Y-8.290 Z20.227 E164.844
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.260 Y-3.774    ;move above the initial point
G0 Z14.112 F100    ;go down to the initial point
G1 X5.593 Y-8.290 Z20.227 E165.285
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.982 Y-4.131    ;move above the initial point
G0 Z16.866 F100    ;go down to the initial point
G1 X2.209 Y-4.437 Z20.732 E165.547
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.270 Y-2.802    ;move above the initial point
G0 Z14.298 F100    ;go down to the initial point
G1 X2.209 Y-4.437 Z20.732 E165.894
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.985 Y-4.637    ;move above the initial point
G0 Z14.877 F100    ;go down to the initial point
G1 X2.209 Y-4.437 Z20.732 E166.258
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.044 Y-6.123    ;move above the initial point
G0 Z13.887 F100    ;go down to the initial point
G1 X2.209 Y-4.437 Z20.732 E166.627
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z18.189 F100    ;go down to the initial point
G1 X-6.481 Y7.616 Z20.907 E166.774
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.467 Y5.709    ;move above the initial point
G0 Z17.363 F100    ;go down to the initial point
G1 X-6.481 Y7.616 Z20.907 E167.071
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.552 Y4.653    ;move above the initial point
G0 Z16.266 F100    ;go down to the initial point
G1 X-6.481 Y7.616 Z20.907 E167.376
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.416 Y5.375    ;move above the initial point
G0 Z17.833 F100    ;go down to the initial point
G1 X-1.283 Y3.989 Z20.934 E167.574
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.467 Y5.709    ;move above the initial point
G0 Z17.363 F100    ;go down to the initial point
G1 X-1.283 Y3.989 Z20.934 E167.791
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.074 Y0.872    ;move above the initial point
G0 Z16.872 F100    ;go down to the initial point
G1 X-1.283 Y3.989 Z20.934 E168.067
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.552 Y4.653    ;move above the initial point
G0 Z16.266 F100    ;go down to the initial point
G1 X-1.283 Y3.989 Z20.934 E168.367
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.611 Y0.850    ;move above the initial point
G0 Z16.446 F100    ;go down to the initial point
G1 X-6.748 Y1.290 Z21.089 E168.635
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.807 Y1.955    ;move above the initial point
G0 Z16.150 F100    ;go down to the initial point
G1 X-6.748 Y1.290 Z21.089 E168.941
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.552 Y4.653    ;move above the initial point
G0 Z16.266 F100    ;go down to the initial point
G1 X-6.748 Y1.290 Z21.089 E169.268
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.852 Y-0.783    ;move above the initial point
G0 Z14.747 F100    ;go down to the initial point
G1 X-6.748 Y1.290 Z21.089 E169.617
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.282 Y3.120    ;move above the initial point
G0 Z13.836 F100    ;go down to the initial point
G1 X-6.748 Y1.290 Z21.089 E170.009
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.611 Y0.850    ;move above the initial point
G0 Z16.446 F100    ;go down to the initial point
G1 X-3.363 Y2.098 Z21.228 E170.275
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.074 Y0.872    ;move above the initial point
G0 Z16.872 F100    ;go down to the initial point
G1 X-3.363 Y2.098 Z21.228 E170.572
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.552 Y4.653    ;move above the initial point
G0 Z16.266 F100    ;go down to the initial point
G1 X-3.363 Y2.098 Z21.228 E170.870
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.210 Y9.927    ;move above the initial point
G0 Z18.868 F100    ;go down to the initial point
G1 X2.751 Y9.614 Z21.586 E171.034
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z16.830 F100    ;go down to the initial point
G1 X2.751 Y9.614 Z21.586 E171.321
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.416 Y5.375    ;move above the initial point
G0 Z17.833 F100    ;go down to the initial point
G1 X2.751 Y9.614 Z21.586 E171.641
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y-8.102    ;move above the initial point
G0 Z15.471 F100    ;go down to the initial point
G1 X-3.437 Y-9.391 Z21.586 E171.991
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.982 Y-4.131    ;move above the initial point
G0 Z16.866 F100    ;go down to the initial point
G1 X-3.437 Y-9.391 Z21.586 E172.382
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.754 Y-9.972    ;move above the initial point
G0 Z14.112 F100    ;go down to the initial point
G1 X-3.437 Y-9.391 Z21.586 E172.798
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.611 Y0.850    ;move above the initial point
G0 Z16.446 F100    ;go down to the initial point
G1 X-4.344 Y0.070 Z22.236 E173.104
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.416 Y-0.622    ;move above the initial point
G0 Z16.079 F100    ;go down to the initial point
G1 X-4.344 Y0.070 Z22.236 E173.443
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.074 Y0.872    ;move above the initial point
G0 Z16.872 F100    ;go down to the initial point
G1 X-4.344 Y0.070 Z22.236 E173.808
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.852 Y-0.783    ;move above the initial point
G0 Z14.747 F100    ;go down to the initial point
G1 X-4.344 Y0.070 Z22.236 E174.223
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.357 Y3.119    ;move above the initial point
G0 Z19.458 F100    ;go down to the initial point
G1 X2.824 Y1.356 Z22.253 E174.413
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.706 Y2.917    ;move above the initial point
G0 Z16.618 F100    ;go down to the initial point
G1 X2.824 Y1.356 Z22.253 E174.724
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.642 Y-1.394    ;move above the initial point
G0 Z17.262 F100    ;go down to the initial point
G1 X2.824 Y1.356 Z22.253 E175.037
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.074 Y0.872    ;move above the initial point
G0 Z16.872 F100    ;go down to the initial point
G1 X2.824 Y1.356 Z22.253 E175.353
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z18.189 F100    ;go down to the initial point
G1 X9.738 Y-2.276 Z22.266 E175.582
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.642 Y-1.394    ;move above the initial point
G0 Z17.262 F100    ;go down to the initial point
G1 X9.738 Y-2.276 Z22.266 E175.958
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.260 Y-3.774    ;move above the initial point
G0 Z14.112 F100    ;go down to the initial point
G1 X9.738 Y-2.276 Z22.266 E176.392
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.357 Y3.119    ;move above the initial point
G0 Z19.458 F100    ;go down to the initial point
G1 X2.810 Y4.784 Z22.572 E176.593
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.416 Y5.375    ;move above the initial point
G0 Z17.833 F100    ;go down to the initial point
G1 X2.810 Y4.784 Z22.572 E176.872
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.706 Y2.917    ;move above the initial point
G0 Z16.618 F100    ;go down to the initial point
G1 X2.810 Y4.784 Z22.572 E177.203
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z16.830 F100    ;go down to the initial point
G1 X2.810 Y4.784 Z22.572 E177.583
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.074 Y0.872    ;move above the initial point
G0 Z16.872 F100    ;go down to the initial point
G1 X2.810 Y4.784 Z22.572 E177.971
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.074 Y0.872    ;move above the initial point
G0 Z16.872 F100    ;go down to the initial point
G1 X0.282 Y-0.563 Z22.578 E178.279
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.642 Y-1.394    ;move above the initial point
G0 Z17.262 F100    ;go down to the initial point
G1 X0.282 Y-0.563 Z22.578 E178.641
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.416 Y-0.622    ;move above the initial point
G0 Z16.079 F100    ;go down to the initial point
G1 X0.282 Y-0.563 Z22.578 E179.008
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.270 Y-2.802    ;move above the initial point
G0 Z14.298 F100    ;go down to the initial point
G1 X0.282 Y-0.563 Z22.578 E179.468
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.416 Y5.375    ;move above the initial point
G0 Z17.833 F100    ;go down to the initial point
G1 X-0.427 Y6.496 Z23.422 E179.769
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.210 Y9.927    ;move above the initial point
G0 Z18.868 F100    ;go down to the initial point
G1 X-0.427 Y6.496 Z23.422 E180.079
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.467 Y5.709    ;move above the initial point
G0 Z17.363 F100    ;go down to the initial point
G1 X-0.427 Y6.496 Z23.422 E180.416
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z18.189 F100    ;go down to the initial point
G1 X-8.906 Y4.549 Z23.625 E180.790
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.807 Y1.955    ;move above the initial point
G0 Z16.150 F100    ;go down to the initial point
G1 X-8.906 Y4.549 Z23.625 E181.206
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.282 Y3.120    ;move above the initial point
G0 Z13.836 F100    ;go down to the initial point
G1 X-8.906 Y4.549 Z23.625 E181.741
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z18.189 F100    ;go down to the initial point
G1 X9.738 Y2.276 Z23.625 E182.066
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.951 Y0.850    ;move above the initial point
G0 Z18.600 F100    ;go down to the initial point
G1 X9.738 Y2.276 Z23.625 E182.403
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.637 Y6.456    ;move above the initial point
G0 Z18.189 F100    ;go down to the initial point
G1 X9.738 Y2.276 Z23.625 E182.777
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.951 Y0.850    ;move above the initial point
G0 Z18.600 F100    ;go down to the initial point
G1 X5.696 Y-0.195 Z23.727 E183.051
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.357 Y3.119    ;move above the initial point
G0 Z19.458 F100    ;go down to the initial point
G1 X5.696 Y-0.195 Z23.727 E183.342
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.642 Y-1.394    ;move above the initial point
G0 Z17.262 F100    ;go down to the initial point
G1 X5.696 Y-0.195 Z23.727 E183.690
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.974 Y-0.721    ;move above the initial point
G0 Z18.189 F100    ;go down to the initial point
G1 X5.696 Y-0.195 Z23.727 E184.056
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.748 Y1.290    ;move above the initial point
G0 Z21.089 F100    ;go down to the initial point
G1 X-7.021 Y-0.950 Z23.788 E184.240
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y-1.178    ;move above the initial point
G0 Z20.227 F100    ;go down to the initial point
G1 X-7.021 Y-0.950 Z23.788 E184.481
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.640 Y-2.989    ;move above the initial point
G0 Z18.792 F100    ;go down to the initial point
G1 X-7.021 Y-0.950 Z23.788 E184.763
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.391 Y-1.839    ;move above the initial point
G0 Z18.845 F100    ;go down to the initial point
G1 X-7.021 Y-0.950 Z23.788 E185.060
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.209 Y-4.437    ;move above the initial point
G0 Z20.732 F100    ;go down to the initial point
G1 X1.038 Y-5.261 Z23.835 E185.238
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.318 Y-6.449    ;move above the initial point
G0 Z20.055 F100    ;go down to the initial point
G1 X1.038 Y-5.261 Z23.835 E185.449
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.790 Y-2.595    ;move above the initial point
G0 Z19.163 F100    ;go down to the initial point
G1 X1.038 Y-5.261 Z23.835 E185.766
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.371 Y-9.715    ;move above the initial point
G0 Z18.189 F100    ;go down to the initial point
G1 X1.038 Y-5.261 Z23.835 E186.148
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y8.102    ;move above the initial point
G0 Z18.189 F100    ;go down to the initial point
G1 X-3.437 Y9.391 Z24.304 E186.498
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.210 Y9.927    ;move above the initial point
G0 Z18.868 F100    ;go down to the initial point
G1 X-3.437 Y9.391 Z24.304 E186.873
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.467 Y5.709    ;move above the initial point
G0 Z17.363 F100    ;go down to the initial point
G1 X-3.437 Y9.391 Z24.304 E187.287
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.282 Y-0.563    ;move above the initial point
G0 Z22.578 F100    ;go down to the initial point
G1 X0.570 Y-2.197 Z24.690 E187.427
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.209 Y-4.437    ;move above the initial point
G0 Z20.732 F100    ;go down to the initial point
G1 X0.570 Y-2.197 Z24.690 E187.680
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.790 Y-2.595    ;move above the initial point
G0 Z19.163 F100    ;go down to the initial point
G1 X0.570 Y-2.197 Z24.690 E187.994
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.728 Y-2.737    ;move above the initial point
G0 Z19.687 F100    ;go down to the initial point
G1 X0.570 Y-2.197 Z24.690 E188.335
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.344 Y0.070    ;move above the initial point
G0 Z22.236 F100    ;go down to the initial point
G1 X-5.117 Y0.686 Z24.762 E188.477
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.748 Y1.290    ;move above the initial point
G0 Z21.089 F100    ;go down to the initial point
G1 X-5.117 Y0.686 Z24.762 E188.689
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.363 Y2.098    ;move above the initial point
G0 Z21.228 F100    ;go down to the initial point
G1 X-5.117 Y0.686 Z24.762 E188.908
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.391 Y-1.839    ;move above the initial point
G0 Z18.845 F100    ;go down to the initial point
G1 X-5.117 Y0.686 Z24.762 E189.246
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.637 Y6.456    ;move above the initial point
G0 Z18.189 F100    ;go down to the initial point
G1 X7.106 Y7.036 Z24.984 E189.604
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.357 Y3.119    ;move above the initial point
G0 Z19.458 F100    ;go down to the initial point
G1 X7.106 Y7.036 Z24.984 E189.986
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.262 Y8.503    ;move above the initial point
G0 Z16.830 F100    ;go down to the initial point
G1 X7.106 Y7.036 Z24.984 E190.429
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.951 Y0.850    ;move above the initial point
G0 Z18.600 F100    ;go down to the initial point
G1 X7.106 Y7.036 Z24.984 E190.897
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.437 Y-9.391    ;move above the initial point
G0 Z21.586 F100    ;go down to the initial point
G1 X-5.862 Y-8.102 Z24.984 E191.126
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.552 Y-4.946    ;move above the initial point
G0 Z20.149 F100    ;go down to the initial point
G1 X-5.862 Y-8.102 Z24.984 E191.451
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.333 Y-6.799    ;move above the initial point
G0 Z18.868 F100    ;go down to the initial point
G1 X-5.862 Y-8.102 Z24.984 E191.786
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.593 Y-8.290    ;move above the initial point
G0 Z20.227 F100    ;go down to the initial point
G1 X3.864 Y-9.223 Z24.984 E192.055
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.209 Y-4.437    ;move above the initial point
G0 Z20.732 F100    ;go down to the initial point
G1 X3.864 Y-9.223 Z24.984 E192.400
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.371 Y-9.715    ;move above the initial point
G0 Z18.189 F100    ;go down to the initial point
G1 X3.864 Y-9.223 Z24.984 E192.765
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.437 Y-9.391    ;move above the initial point
G0 Z21.586 F100    ;go down to the initial point
G1 X-2.191 Y-6.821 Z24.997 E192.997
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.552 Y-4.946    ;move above the initial point
G0 Z20.149 F100    ;go down to the initial point
G1 X-2.191 Y-6.821 Z24.997 E193.278
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.318 Y-6.449    ;move above the initial point
G0 Z20.055 F100    ;go down to the initial point
G1 X-2.191 Y-6.821 Z24.997 E193.568
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.552 Y-4.946    ;move above the initial point
G0 Z20.149 F100    ;go down to the initial point
G1 X-2.787 Y-3.748 Z25.001 E193.832
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.790 Y-2.595    ;move above the initial point
G0 Z19.163 F100    ;go down to the initial point
G1 X-2.787 Y-3.748 Z25.001 E194.148
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.318 Y-6.449    ;move above the initial point
G0 Z20.055 F100    ;go down to the initial point
G1 X-2.787 Y-3.748 Z25.001 E194.484
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.391 Y-1.839    ;move above the initial point
G0 Z18.845 F100    ;go down to the initial point
G1 X-2.787 Y-3.748 Z25.001 E194.831
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.640 Y-2.989    ;move above the initial point
G0 Z18.792 F100    ;go down to the initial point
G1 X-2.787 Y-3.748 Z25.001 E195.215
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.209 Y-4.437    ;move above the initial point
G0 Z20.732 F100    ;go down to the initial point
G1 X3.874 Y-4.668 Z25.016 E195.455
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.728 Y-2.737    ;move above the initial point
G0 Z19.687 F100    ;go down to the initial point
G1 X3.874 Y-4.668 Z25.016 E195.754
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.593 Y-8.290    ;move above the initial point
G0 Z20.227 F100    ;go down to the initial point
G1 X3.874 Y-4.668 Z25.016 E196.081
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.282 Y-0.563    ;move above the initial point
G0 Z22.578 F100    ;go down to the initial point
G1 X2.393 Y-0.370 Z25.106 E196.253
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.824 Y1.356    ;move above the initial point
G0 Z22.253 F100    ;go down to the initial point
G1 X2.393 Y-0.370 Z25.106 E196.429
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.728 Y-2.737    ;move above the initial point
G0 Z19.687 F100    ;go down to the initial point
G1 X2.393 Y-0.370 Z25.106 E196.761
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.282 Y-0.563    ;move above the initial point
G0 Z22.578 F100    ;go down to the initial point
G1 X-1.760 Y-0.698 Z25.451 E196.945
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-4.344 Y0.070    ;move above the initial point
G0 Z22.236 F100    ;go down to the initial point
G1 X-1.760 Y-0.698 Z25.451 E197.164
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.363 Y2.098    ;move above the initial point
G0 Z21.228 F100    ;go down to the initial point
G1 X-1.760 Y-0.698 Z25.451 E197.442
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.790 Y-2.595    ;move above the initial point
G0 Z19.163 F100    ;go down to the initial point
G1 X-1.760 Y-0.698 Z25.451 E197.785
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.282 Y-0.563    ;move above the initial point
G0 Z22.578 F100    ;go down to the initial point
G1 X0.123 Y1.357 Z25.498 E197.968
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.824 Y1.356    ;move above the initial point
G0 Z22.253 F100    ;go down to the initial point
G1 X0.123 Y1.357 Z25.498 E198.188
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.283 Y3.989    ;move above the initial point
G0 Z20.934 F100    ;go down to the initial point
G1 X0.123 Y1.357 Z25.498 E198.473
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.363 Y2.098    ;move above the initial point
G0 Z21.228 F100    ;go down to the initial point
G1 X0.123 Y1.357 Z25.498 E198.764
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.437 Y-9.391    ;move above the initial point
G0 Z21.586 F100    ;go down to the initial point
G1 X-0.361 Y-9.993 Z25.663 E199.033
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.318 Y-6.449    ;move above the initial point
G0 Z20.055 F100    ;go down to the initial point
G1 X-0.361 Y-9.993 Z25.663 E199.381
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.371 Y-9.715    ;move above the initial point
G0 Z18.189 F100    ;go down to the initial point
G1 X-0.361 Y-9.993 Z25.663 E199.797
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.906 Y4.549    ;move above the initial point
G0 Z23.625 F100    ;go down to the initial point
G1 X-8.082 Y5.888 Z26.342 E199.961
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.481 Y7.616    ;move above the initial point
G0 Z20.907 F100    ;go down to the initial point
G1 X-8.082 Y5.888 Z26.342 E200.271
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.363 Y2.098    ;move above the initial point
G0 Z21.228 F100    ;go down to the initial point
G1 X-8.082 Y5.888 Z26.342 E200.685
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.333 Y-6.799    ;move above the initial point
G0 Z18.868 F100    ;go down to the initial point
G1 X-8.082 Y-5.888 Z26.342 E201.080
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.552 Y-4.946    ;move above the initial point
G0 Z20.149 F100    ;go down to the initial point
G1 X-8.082 Y-5.888 Z26.342 E201.484
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y-1.178    ;move above the initial point
G0 Z20.227 F100    ;go down to the initial point
G1 X-8.082 Y-5.888 Z26.342 E201.899
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.640 Y-2.989    ;move above the initial point
G0 Z18.792 F100    ;go down to the initial point
G1 X-8.082 Y-5.888 Z26.342 E202.328
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.906 Y4.549    ;move above the initial point
G0 Z23.625 F100    ;go down to the initial point
G1 X-9.509 Y3.096 Z26.342 E202.492
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.748 Y1.290    ;move above the initial point
G0 Z21.089 F100    ;go down to the initial point
G1 X-9.509 Y3.096 Z26.342 E202.816
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.930 Y-1.178    ;move above the initial point
G0 Z20.227 F100    ;go down to the initial point
G1 X-9.509 Y3.096 Z26.342 E203.206
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.363 Y2.098    ;move above the initial point
G0 Z21.228 F100    ;go down to the initial point
G1 X-9.509 Y3.096 Z26.342 E203.627
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.363 Y2.098    ;move above the initial point
G0 Z21.228 F100    ;go down to the initial point
G1 X-3.070 Y3.885 Z26.973 E203.942
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.283 Y3.989    ;move above the initial point
G0 Z20.934 F100    ;go down to the initial point
G1 X-3.070 Y3.885 Z26.973 E204.271
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.481 Y7.616    ;move above the initial point
G0 Z20.907 F100    ;go down to the initial point
G1 X-3.070 Y3.885 Z26.973 E204.684
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.427 Y6.496    ;move above the initial point
G0 Z23.422 F100    ;go down to the initial point
G1 X1.380 Y3.955 Z27.145 E204.937
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.810 Y4.784    ;move above the initial point
G0 Z22.572 F100    ;go down to the initial point
G1 X1.380 Y3.955 Z27.145 E205.191
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.824 Y1.356    ;move above the initial point
G0 Z22.253 F100    ;go down to the initial point
G1 X1.380 Y3.955 Z27.145 E205.490
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.283 Y3.989    ;move above the initial point
G0 Z20.934 F100    ;go down to the initial point
G1 X1.380 Y3.955 Z27.145 E205.843
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.427 Y6.496    ;move above the initial point
G0 Z23.422 F100    ;go down to the initial point
G1 X1.596 Y6.807 Z30.780 E206.242
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.810 Y4.784    ;move above the initial point
G0 Z22.572 F100    ;go down to the initial point
G1 X1.596 Y6.807 Z30.780 E206.689
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.751 Y9.614    ;move above the initial point
G0 Z21.586 F100    ;go down to the initial point
G1 X1.596 Y6.807 Z30.780 E207.195
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.427 Y6.496    ;move above the initial point
G0 Z23.422 F100    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.780 E207.588
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.283 Y3.989    ;move above the initial point
G0 Z20.934 F100    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.780 E208.111
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.481 Y7.616    ;move above the initial point
G0 Z20.907 F100    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.780 E208.690
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.696 Y-0.195    ;move above the initial point
G0 Z23.727 F100    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.780 E209.063
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.824 Y1.356    ;move above the initial point
G0 Z22.253 F100    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.780 E209.525
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.810 Y4.784    ;move above the initial point
G0 Z22.572 F100    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.780 E210.035
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.728 Y-2.737    ;move above the initial point
G0 Z19.687 F100    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.780 E210.630
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.696 Y-0.195    ;move above the initial point
G0 Z23.727 F100    ;go down to the initial point
G1 X6.213 Y1.925 Z30.780 E211.015
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.738 Y2.276    ;move above the initial point
G0 Z23.625 F100    ;go down to the initial point
G1 X6.213 Y1.925 Z30.780 E211.432
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.810 Y4.784    ;move above the initial point
G0 Z22.572 F100    ;go down to the initial point
G1 X6.213 Y1.925 Z30.780 E211.920
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.070 Y3.885    ;move above the initial point
G0 Z26.973 F100    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.780 E212.164
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.760 Y-0.698    ;move above the initial point
G0 Z25.451 F100    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.780 E212.473
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.117 Y0.686    ;move above the initial point
G0 Z24.762 F100    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.780 E212.800
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.123 Y1.357    ;move above the initial point
G0 Z25.498 F100    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.780 E213.092
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.760 Y-0.698    ;move above the initial point
G0 Z25.451 F100    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.780 E213.391
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.393 Y-0.370    ;move above the initial point
G0 Z25.106 F100    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.780 E213.707
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.570 Y-2.197    ;move above the initial point
G0 Z24.690 F100    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.780 E214.038
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.874 Y-4.668    ;move above the initial point
G0 Z25.016 F100    ;go down to the initial point
G1 X2.145 Y-3.687 Z30.780 E214.356
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.570 Y-2.197    ;move above the initial point
G0 Z24.690 F100    ;go down to the initial point
G1 X2.145 Y-3.687 Z30.780 E214.694
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.393 Y-0.370    ;move above the initial point
G0 Z25.106 F100    ;go down to the initial point
G1 X2.145 Y-3.687 Z30.780 E215.038
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.038 Y-5.261    ;move above the initial point
G0 Z23.835 F100    ;go down to the initial point
G1 X2.145 Y-3.687 Z30.780 E215.414
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.760 Y-0.698    ;move above the initial point
G0 Z25.451 F100    ;go down to the initial point
G1 X-0.934 Y-2.931 Z30.780 E215.719
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.787 Y-3.748    ;move above the initial point
G0 Z25.001 F100    ;go down to the initial point
G1 X-0.934 Y-2.931 Z30.780 E216.039
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.570 Y-2.197    ;move above the initial point
G0 Z24.690 F100    ;go down to the initial point
G1 X-0.934 Y-2.931 Z30.780 E216.369
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.038 Y-5.261    ;move above the initial point
G0 Z23.835 F100    ;go down to the initial point
G1 X-0.934 Y-2.931 Z30.780 E216.765
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.070 Y3.885    ;move above the initial point
G0 Z26.973 F100    ;go down to the initial point
G1 X-1.088 Y2.396 Z30.780 E217.003
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.380 Y3.955    ;move above the initial point
G0 Z27.145 F100    ;go down to the initial point
G1 X-1.088 Y2.396 Z30.780 E217.246
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X0.123 Y1.357    ;move above the initial point
G0 Z25.498 F100    ;go down to the initial point
G1 X-1.088 Y2.396 Z30.780 E217.535
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.760 Y-0.698    ;move above the initial point
G0 Z25.451 F100    ;go down to the initial point
G1 X-1.088 Y2.396 Z30.780 E217.859
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.191 Y-6.821    ;move above the initial point
G0 Z24.997 F100    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.780 E218.170
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.787 Y-3.748    ;move above the initial point
G0 Z25.001 F100    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.780 E218.485
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y-8.102    ;move above the initial point
G0 Z24.984 F100    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.780 E218.865
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.038 Y-5.261    ;move above the initial point
G0 Z23.835 F100    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.780 E219.269
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-1.760 Y-0.698    ;move above the initial point
G0 Z25.451 F100    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.780 E219.567
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.787 Y-3.748    ;move above the initial point
G0 Z25.001 F100    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.780 E219.893
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.117 Y0.686    ;move above the initial point
G0 Z24.762 F100    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.780 E220.237
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.021 Y-0.950    ;move above the initial point
G0 Z23.788 F100    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.780 E220.645
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y-5.888    ;move above the initial point
G0 Z26.342 F100    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.780 E220.931
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.787 Y-3.748    ;move above the initial point
G0 Z25.001 F100    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.780 E221.277
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.021 Y-0.950    ;move above the initial point
G0 Z23.788 F100    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.780 E221.669
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.361 Y-9.993    ;move above the initial point
G0 Z25.663 F100    ;go down to the initial point
G1 X2.121 Y-7.777 Z30.780 E221.987
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.864 Y-9.223    ;move above the initial point
G0 Z24.984 F100    ;go down to the initial point
G1 X2.121 Y-7.777 Z30.780 E222.313
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X3.874 Y-4.668    ;move above the initial point
G0 Z25.016 F100    ;go down to the initial point
G1 X2.121 Y-7.777 Z30.780 E222.667
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.038 Y-5.261    ;move above the initial point
G0 Z23.835 F100    ;go down to the initial point
G1 X2.121 Y-7.777 Z30.780 E223.057
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.437 Y9.391    ;move above the initial point
G0 Z24.304 F100    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.780 E223.397
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.427 Y6.496    ;move above the initial point
G0 Z23.422 F100    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.780 E223.849
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-6.481 Y7.616    ;move above the initial point
G0 Z20.907 F100    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.780 E224.385
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-3.437 Y9.391    ;move above the initial point
G0 Z24.304 F100    ;go down to the initial point
G1 X-0.249 Y9.997 Z30.780 E224.763
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.427 Y6.496    ;move above the initial point
G0 Z23.422 F100    ;go down to the initial point
G1 X-0.249 Y9.997 Z30.780 E225.189
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.751 Y9.614    ;move above the initial point
G0 Z21.586 F100    ;go down to the initial point
G1 X-0.249 Y9.997 Z30.780 E225.695
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.106 Y7.036    ;move above the initial point
G0 Z24.984 F100    ;go down to the initial point
G1 X4.562 Y8.899 Z30.780 E226.039
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.810 Y4.784    ;move above the initial point
G0 Z22.572 F100    ;go down to the initial point
G1 X4.562 Y8.899 Z30.780 E226.528
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.751 Y9.614    ;move above the initial point
G0 Z21.586 F100    ;go down to the initial point
G1 X4.562 Y8.899 Z30.780 E227.019
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X7.106 Y7.036    ;move above the initial point
G0 Z24.984 F100    ;go down to the initial point
G1 X7.660 Y6.428 Z30.780 E227.325
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.738 Y2.276    ;move above the initial point
G0 Z23.625 F100    ;go down to the initial point
G1 X7.660 Y6.428 Z30.780 E227.770
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X2.810 Y4.784    ;move above the initial point
G0 Z22.572 F100    ;go down to the initial point
G1 X7.660 Y6.428 Z30.780 E228.276
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.738 Y2.276    ;move above the initial point
G0 Z23.625 F100    ;go down to the initial point
G1 X9.950 Y-0.996 Z30.780 E228.687
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.696 Y-0.195    ;move above the initial point
G0 Z23.727 F100    ;go down to the initial point
G1 X9.950 Y-0.996 Z30.780 E229.119
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.738 Y-2.276    ;move above the initial point
G0 Z22.266 F100    ;go down to the initial point
G1 X9.950 Y-0.996 Z30.780 E229.569
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.728 Y-2.737    ;move above the initial point
G0 Z19.687 F100    ;go down to the initial point
G1 X9.950 Y-0.996 Z30.780 E230.216
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X9.738 Y-2.276    ;move above the initial point
G0 Z22.266 F100    ;go down to the initial point
G1 X8.262 Y-5.633 Z30.780 E230.701
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X5.593 Y-8.290    ;move above the initial point
G0 Z20.227 F100    ;go down to the initial point
G1 X8.262 Y-5.633 Z30.780 E231.286
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X4.728 Y-2.737    ;move above the initial point
G0 Z19.687 F100    ;go down to the initial point
G1 X8.262 Y-5.633 Z30.780 E231.913
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y-5.888    ;move above the initial point
G0 Z26.342 F100    ;go down to the initial point
G1 X-6.617 Y-7.498 Z30.780 E232.171
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y-8.102    ;move above the initial point
G0 Z24.984 F100    ;go down to the initial point
G1 X-6.617 Y-7.498 Z30.780 E232.478
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.787 Y-3.748    ;move above the initial point
G0 Z25.001 F100    ;go down to the initial point
G1 X-6.617 Y-7.498 Z30.780 E232.890
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-0.361 Y-9.993    ;move above the initial point
G0 Z25.663 F100    ;go down to the initial point
G1 X-1.243 Y-9.922 Z30.780 E233.161
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-2.191 Y-6.821    ;move above the initial point
G0 Z24.997 F100    ;go down to the initial point
G1 X-1.243 Y-9.922 Z30.780 E233.507
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.862 Y-8.102    ;move above the initial point
G0 Z24.984 F100    ;go down to the initial point
G1 X-1.243 Y-9.922 Z30.780 E233.906
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X1.038 Y-5.261    ;move above the initial point
G0 Z23.835 F100    ;go down to the initial point
G1 X-1.243 Y-9.922 Z30.780 E234.359
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-9.509 Y3.096    ;move above the initial point
G0 Z26.342 F100    ;go down to the initial point
G1 X-9.397 Y3.420 Z30.780 E234.592
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-8.082 Y5.888    ;move above the initial point
G0 Z26.342 F100    ;go down to the initial point
G1 X-9.397 Y3.420 Z30.780 E234.866
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-5.117 Y0.686    ;move above the initial point
G0 Z24.762 F100    ;go down to the initial point
G1 X-9.397 Y3.420 Z30.780 E235.277
G91    ;set relative coords
G0 Z1.000 F600 E-2.000    ;raise the extruder 1 mm
G90    ;set absolute coords
G0 X-7.021 Y-0.950    ;move above the initial point
G0 Z23.788 F100    ;go down to the initial point
G1 X-9.397 Y3.420 Z30.780 E235.725
; start top printing
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.000 F100    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.000 E234.125
G1 X-6.617 Y-7.498 Z30.000 E234.339
G1 X-9.397 Y3.420 Z30.000 E234.928
G1 X-1.835 Y5.689 Z30.000 E235.340
G1 X-4.113 Y9.115 Z30.000 E235.555
G1 X-9.397 Y3.420 Z30.000 E235.961
G1 X-3.464 Y1.216 Z30.000 E236.292
G1 X-6.018 Y-3.438 Z30.000 E236.569
G1 X-2.358 Y-5.414 Z30.000 E236.786
G1 X2.121 Y-7.777 Z30.000 E237.051
G1 X-1.243 Y-9.922 Z30.000 E237.260
G1 X-2.358 Y-5.414 Z30.000 E237.502
G1 X-6.617 Y-7.498 Z30.000 E237.750
G1 X-1.243 Y-9.922 Z30.000 E238.058
G1 X8.262 Y-5.633 Z30.000 E238.603
G1 X9.950 Y-0.996 Z30.000 E238.860
G1 X6.213 Y1.925 Z30.000 E239.108
G1 X7.660 Y6.428 Z30.000 E239.355
G1 X9.950 Y-0.996 Z30.000 E239.761
G1 X4.591 Y-0.189 Z30.000 E240.044
G1 X6.213 Y1.925 Z30.000 E240.184
G1 X1.596 Y6.807 Z30.000 E240.535
G1 X7.660 Y6.428 Z30.000 E240.852
G1 X4.562 Y8.899 Z30.000 E241.059
G1 X1.596 Y6.807 Z30.000 E241.249
G1 X-0.249 Y9.997 Z30.000 E241.441
G1 X4.562 Y8.899 Z30.000 E241.699
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.000 F100    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.000 E243.939
G1 X-3.464 Y1.216 Z30.000 E242.188
G1 X-1.088 Y2.396 Z30.000 E242.326
G1 X6.213 Y1.925 Z30.000 E242.709
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.088 Y2.396    ;move above the initial point
G0 Z30.000 F100    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.000 E245.035
G1 X8.262 Y-5.633 Z30.000 E243.378
G1 X2.121 Y-7.777 Z30.000 E243.717
G1 X2.145 Y-3.687 Z30.000 E243.931
G1 X8.262 Y-5.633 Z30.000 E244.267
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.145 Y-3.687    ;move above the initial point
G0 Z30.000 F100    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.000 E246.490
G1 X0.322 Y-0.459 Z30.000 E244.713
G1 X-1.088 Y2.396 Z30.000 E244.879
G1 X1.596 Y6.807 Z30.000 E245.149
G1 X-1.835 Y5.689 Z30.000 E245.338
G1 X-1.088 Y2.396 Z30.000 E245.514
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.000 F100    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.000 E247.730
G1 X-3.592 Y-1.496 Z30.000 E245.872
G1 X-6.018 Y-3.438 Z30.000 E246.035
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-3.592 Y-1.496    ;move above the initial point
G0 Z30.000 F100    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.000 E248.249
G1 X2.145 Y-3.687 Z30.000 E246.501
G1 X-0.934 Y-2.931 Z30.000 E246.667
G1 X-2.358 Y-5.414 Z30.000 E246.817
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.934 Y-2.931    ;move above the initial point
G0 Z30.000 F100    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.000 E248.961
G1 X2.145 Y-3.687 Z30.000 E247.155
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.000 F100    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.000 E249.367
G1 X-0.934 Y-2.931 Z30.000 E247.524
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.000 F100    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.000 E249.731
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.260 F100    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.260 F100    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.260 E250.131
G1 X-6.617 Y-7.498 Z30.260 E248.345
G1 X-9.397 Y3.420 Z30.260 E248.934
G1 X-1.835 Y5.689 Z30.260 E249.346
G1 X-4.113 Y9.115 Z30.260 E249.561
G1 X-9.397 Y3.420 Z30.260 E249.967
G1 X-3.464 Y1.216 Z30.260 E250.298
G1 X-6.018 Y-3.438 Z30.260 E250.575
G1 X-2.358 Y-5.414 Z30.260 E250.792
G1 X2.121 Y-7.777 Z30.260 E251.057
G1 X-1.243 Y-9.922 Z30.260 E251.266
G1 X-2.358 Y-5.414 Z30.260 E251.508
G1 X-6.617 Y-7.498 Z30.260 E251.756
G1 X-1.243 Y-9.922 Z30.260 E252.064
G1 X8.262 Y-5.633 Z30.260 E252.609
G1 X9.950 Y-0.996 Z30.260 E252.866
G1 X6.213 Y1.925 Z30.260 E253.114
G1 X7.660 Y6.428 Z30.260 E253.361
G1 X9.950 Y-0.996 Z30.260 E253.767
G1 X4.591 Y-0.189 Z30.260 E254.050
G1 X6.213 Y1.925 Z30.260 E254.190
G1 X1.596 Y6.807 Z30.260 E254.541
G1 X7.660 Y6.428 Z30.260 E254.858
G1 X4.562 Y8.899 Z30.260 E255.065
G1 X1.596 Y6.807 Z30.260 E255.255
G1 X-0.249 Y9.997 Z30.260 E255.447
G1 X4.562 Y8.899 Z30.260 E255.705
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.260 F100    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.260 E257.945
G1 X-3.464 Y1.216 Z30.260 E256.194
G1 X-1.088 Y2.396 Z30.260 E256.332
G1 X6.213 Y1.925 Z30.260 E256.715
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.088 Y2.396    ;move above the initial point
G0 Z30.260 F100    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.260 E259.041
G1 X8.262 Y-5.633 Z30.260 E257.384
G1 X2.121 Y-7.777 Z30.260 E257.723
G1 X2.145 Y-3.687 Z30.260 E257.937
G1 X8.262 Y-5.633 Z30.260 E258.273
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.145 Y-3.687    ;move above the initial point
G0 Z30.260 F100    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.260 E260.496
G1 X0.322 Y-0.459 Z30.260 E258.719
G1 X-1.088 Y2.396 Z30.260 E258.885
G1 X1.596 Y6.807 Z30.260 E259.155
G1 X-1.835 Y5.689 Z30.260 E259.344
G1 X-1.088 Y2.396 Z30.260 E259.520
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.260 F100    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.260 E261.736
G1 X-3.592 Y-1.496 Z30.260 E259.878
G1 X-6.018 Y-3.438 Z30.260 E260.041
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-3.592 Y-1.496    ;move above the initial point
G0 Z30.260 F100    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.260 E262.255
G1 X2.145 Y-3.687 Z30.260 E260.507
G1 X-0.934 Y-2.931 Z30.260 E260.673
G1 X-2.358 Y-5.414 Z30.260 E260.822
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.934 Y-2.931    ;move above the initial point
G0 Z30.260 F100    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.260 E262.967
G1 X2.145 Y-3.687 Z30.260 E261.161
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.260 F100    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.260 E263.373
G1 X-0.934 Y-2.931 Z30.260 E261.530
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.260 F100    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.260 E263.737
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.520 F100    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.520 F100    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.520 E264.137
G1 X-6.617 Y-7.498 Z30.520 E262.351
G1 X-9.397 Y3.420 Z30.520 E262.940
G1 X-1.835 Y5.689 Z30.520 E263.352
G1 X-4.113 Y9.115 Z30.520 E263.567
G1 X-9.397 Y3.420 Z30.520 E263.973
G1 X-3.464 Y1.216 Z30.520 E264.304
G1 X-6.018 Y-3.438 Z30.520 E264.581
G1 X-2.358 Y-5.414 Z30.520 E264.798
G1 X2.121 Y-7.777 Z30.520 E265.063
G1 X-1.243 Y-9.922 Z30.520 E265.271
G1 X-2.358 Y-5.414 Z30.520 E265.514
G1 X-6.617 Y-7.498 Z30.520 E265.762
G1 X-1.243 Y-9.922 Z30.520 E266.070
G1 X8.262 Y-5.633 Z30.520 E266.615
G1 X9.950 Y-0.996 Z30.520 E266.872
G1 X6.213 Y1.925 Z30.520 E267.120
G1 X7.660 Y6.428 Z30.520 E267.367
G1 X9.950 Y-0.996 Z30.520 E267.773
G1 X4.591 Y-0.189 Z30.520 E268.056
G1 X6.213 Y1.925 Z30.520 E268.196
G1 X1.596 Y6.807 Z30.520 E268.547
G1 X7.660 Y6.428 Z30.520 E268.864
G1 X4.562 Y8.899 Z30.520 E269.071
G1 X1.596 Y6.807 Z30.520 E269.261
G1 X-0.249 Y9.997 Z30.520 E269.453
G1 X4.562 Y8.899 Z30.520 E269.711
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.520 F100    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.520 E271.951
G1 X-3.464 Y1.216 Z30.520 E270.200
G1 X-1.088 Y2.396 Z30.520 E270.338
G1 X6.213 Y1.925 Z30.520 E270.720
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.088 Y2.396    ;move above the initial point
G0 Z30.520 F100    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.520 E273.047
G1 X8.262 Y-5.633 Z30.520 E271.390
G1 X2.121 Y-7.777 Z30.520 E271.729
G1 X2.145 Y-3.687 Z30.520 E271.943
G1 X8.262 Y-5.633 Z30.520 E272.278
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.145 Y-3.687    ;move above the initial point
G0 Z30.520 F100    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.520 E274.502
G1 X0.322 Y-0.459 Z30.520 E272.725
G1 X-1.088 Y2.396 Z30.520 E272.891
G1 X1.596 Y6.807 Z30.520 E273.161
G1 X-1.835 Y5.689 Z30.520 E273.350
G1 X-1.088 Y2.396 Z30.520 E273.526
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.520 F100    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.520 E275.742
G1 X-3.592 Y-1.496 Z30.520 E273.884
G1 X-6.018 Y-3.438 Z30.520 E274.047
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-3.592 Y-1.496    ;move above the initial point
G0 Z30.520 F100    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.520 E276.261
G1 X2.145 Y-3.687 Z30.520 E274.513
G1 X-0.934 Y-2.931 Z30.520 E274.679
G1 X-2.358 Y-5.414 Z30.520 E274.828
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.934 Y-2.931    ;move above the initial point
G0 Z30.520 F100    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.520 E276.973
G1 X2.145 Y-3.687 Z30.520 E275.167
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.520 F100    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.520 E277.379
G1 X-0.934 Y-2.931 Z30.520 E275.536
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.520 F100    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.520 E277.743
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.780 F100    ;go down to the initial point
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-9.397 Y3.420    ;move above the initial point
G0 Z30.780 F100    ;go down to the initial point
G1 X-6.018 Y-3.438 Z30.780 E278.143
G1 X-6.617 Y-7.498 Z30.780 E276.357
G1 X-9.397 Y3.420 Z30.780 E276.946
G1 X-1.835 Y5.689 Z30.780 E277.358
G1 X-4.113 Y9.115 Z30.780 E277.573
G1 X-9.397 Y3.420 Z30.780 E277.979
G1 X-3.464 Y1.216 Z30.780 E278.310
G1 X-6.018 Y-3.438 Z30.780 E278.587
G1 X-2.358 Y-5.414 Z30.780 E278.804
G1 X2.121 Y-7.777 Z30.780 E279.069
G1 X-1.243 Y-9.922 Z30.780 E279.277
G1 X-2.358 Y-5.414 Z30.780 E279.520
G1 X-6.617 Y-7.498 Z30.780 E279.768
G1 X-1.243 Y-9.922 Z30.780 E280.076
G1 X8.262 Y-5.633 Z30.780 E280.621
G1 X9.950 Y-0.996 Z30.780 E280.878
G1 X6.213 Y1.925 Z30.780 E281.126
G1 X7.660 Y6.428 Z30.780 E281.373
G1 X9.950 Y-0.996 Z30.780 E281.779
G1 X4.591 Y-0.189 Z30.780 E282.062
G1 X6.213 Y1.925 Z30.780 E282.202
G1 X1.596 Y6.807 Z30.780 E282.553
G1 X7.660 Y6.428 Z30.780 E282.870
G1 X4.562 Y8.899 Z30.780 E283.077
G1 X1.596 Y6.807 Z30.780 E283.267
G1 X-0.249 Y9.997 Z30.780 E283.459
G1 X4.562 Y8.899 Z30.780 E283.717
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.780 F100    ;go down to the initial point
G1 X-1.835 Y5.689 Z30.780 E285.957
G1 X-3.464 Y1.216 Z30.780 E284.206
G1 X-1.088 Y2.396 Z30.780 E284.344
G1 X6.213 Y1.925 Z30.780 E284.726
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-1.088 Y2.396    ;move above the initial point
G0 Z30.780 F100    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.780 E287.052
G1 X8.262 Y-5.633 Z30.780 E285.396
G1 X2.121 Y-7.777 Z30.780 E285.735
G1 X2.145 Y-3.687 Z30.780 E285.949
G1 X8.262 Y-5.633 Z30.780 E286.284
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X2.145 Y-3.687    ;move above the initial point
G0 Z30.780 F100    ;go down to the initial point
G1 X4.591 Y-0.189 Z30.780 E288.508
G1 X0.322 Y-0.459 Z30.780 E286.731
G1 X-1.088 Y2.396 Z30.780 E286.897
G1 X1.596 Y6.807 Z30.780 E287.167
G1 X-1.835 Y5.689 Z30.780 E287.356
G1 X-1.088 Y2.396 Z30.780 E287.532
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.780 F100    ;go down to the initial point
G1 X-3.464 Y1.216 Z30.780 E289.748
G1 X-3.592 Y-1.496 Z30.780 E287.890
G1 X-6.018 Y-3.438 Z30.780 E288.053
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-3.592 Y-1.496    ;move above the initial point
G0 Z30.780 F100    ;go down to the initial point
G1 X-2.358 Y-5.414 Z30.780 E290.267
G1 X2.145 Y-3.687 Z30.780 E288.519
G1 X-0.934 Y-2.931 Z30.780 E288.685
G1 X-2.358 Y-5.414 Z30.780 E288.834
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.934 Y-2.931    ;move above the initial point
G0 Z30.780 F100    ;go down to the initial point
G1 X0.322 Y-0.459 Z30.780 E290.979
G1 X2.145 Y-3.687 Z30.780 E289.173
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X0.322 Y-0.459    ;move above the initial point
G0 Z30.780 F100    ;go down to the initial point
G1 X-3.592 Y-1.496 Z30.780 E291.385
G1 X-0.934 Y-2.931 Z30.780 E289.542
G91    ;set relative coords
G0 Z0.500 F600 E-2.000    ;raise the extruder 0.5 mm
G90    ;set absolute coords
G0 X-0.249 Y9.997    ;move above the initial point
G0 Z30.780 F100    ;go down to the initial point
G1 X-4.113 Y9.115 Z30.780 E291.749
G1 E-1 F600
G91 
G1 Z10 E-5  ;raise the extruder 1 cm
G0 X-100.0    ;move to the initial point
M104 S0    ;turn off the extruder
M140 S0    ;turn off the bed
M84    ;disable motors
