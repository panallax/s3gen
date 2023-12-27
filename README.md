### Usage

- Intall package:

``` pip install -e .```

- Install FreeCAD

FreeCAD is needed for generating the STL output file. To install FreeCAD follow the instructions [here](https://wiki.freecad.org/Compile_on_Linux.)*. Do what is explained including the manual installation of the endless list of dependences (when I installed it the one command line showed didn't work) and before doing the step ```make -j$(nproc --ignore=2)``` do ```sudo make install```. And then paste the directory where the FreeCad.so file is in the config file, it should be similar to ```freecad-source/build/lib```.


*For now, this has only been tested in Ubuntu so the user should follow the instructions [here](https://wiki.freecad.org/Manual:Installing) to install it in other OS.

- Execute in _src_:

```python run.py```

For clean run first remove any file in ```tmp``` folder.

- Output:

Each execution creates a folder containing all the output files created. This files are: 
* pickle file containing the graph generated 
* npz file containing the node position and the adjacency matrix 
* STL file of the structure
* FCStd file of the structure

The name of the output folder will always be the name of the STL file executed plus the time when it was executed. Also, the pickle file is stored in the temporal folder. The program checks if there is a file in the ```tmp``` folder, if there is any, the graph generation will be bypassed and the existing file will be used to generate the STL. If the executions fails anytime, the output folder is removed.

- Incoming updates

Currently the way that the STL is generated is not he optimal one but some issues realated to lib versions need to be fixed for testing and upgrading it. It is on work.