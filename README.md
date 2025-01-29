### Usage

#### Installation

- Install package:

``` pip install -e .```

#### Configuration:

All the attributes in the ```config.py``` can be modified to customize the execution.
Config file contains one data class for each of the main modules of the package, can be customized individually.

Moreover, the parameter ```SHOW_LOGS_IN_CONSOLE``` can be set to ```False``` to turn off the logs in console, if it is set ```True```, logs will be prompted in console and registered in log file. The default is ```True```.

User is encouraged to use the default folder structure, but different folders can be used by setting the following environment variables:

* ```MESHGEN_BASE_DIR```: Project base directory
* ```MESHGEN_DATA_DIR```: Data directory
* ```MESHGEN_OUTPUT_DIR```: Results directory
* ```MESHGEN_TMP_DIR```: Temporary directory
* ```MESHGEN_STL_FILE```: Input STL file path

e.g.:

```
export MESHGEN_STL_FILE=/path/to/you/stl/file.stl
```
#### Execute in _src_:

```python run.py```

For clean run first remove any file in ```tmp``` folder.

#### Output:

Each execution creates a folder containing all the output files created. Those files are: 
* pickle file containing the graph generated 
* npz file containing the node position and the adjacency matrix 
* STL file of the structure
* log file

The name of the output folder will always be the name of the STL file executed plus the time when it was executed. Also, the pickle file is stored in the temporal folder. The program checks if there is a file in the ```tmp``` folder, if there is any, the graph generation will be bypassed and the existing file will be used to generate the STL. If the executions fails anytime, the output folder is removed.

