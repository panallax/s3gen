# S³-Gen

A Python tool for generating and processing 3D stochastic strut-based self-supported structures.

## Installation and usage
- Clone the repository:

   ```
   git clone https://github.com/panallax/mesh-gen.git
   cd mesh-gen
   ```
- Install package:

   ``` pip install -e .```

-  Place your STL file:
   - Put the input STL file in the `data` directory

- Run with Docker Compose (optional):

   ```
   docker-compose up --build
   ```

   If you prefer more control, you can use Docker directly:

   1. Build the image:

   ```
   docker build -t meshgen .
   ```
   2. Run the container:

   ```
   docker run -v $(pwd)/data:/app/data \\
               -v $(pwd)/tmp:/app/tmp \\
               -e MESHGEN_STL_FILE=/app/data/_your_.stl \\
               meshgen
   ```
- Execute in _src_:

   ```python run.py```

   For clean run first remove any file in ```tmp``` folder.

## Configuration:

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
export MESHGEN_STL_FILE=/path/to/your/stl/file.stl
```

## Output:

Each execution creates a folder containing all the output files created. Those files are: 
* pickle file containing the graph generated 
* npz file containing the node position and the adjacency matrix 
* STL file of the structure
* log file

The name of the output folder will always be the name of the STL file executed plus the time when it was executed. Also, the pickle file is stored in the temporal folder. The program checks if there is a file in the ```tmp``` folder, if there is any, the graph generation will be bypassed and the existing file will be used to generate the STL. If the executions fails anytime, the output folder is removed.

## Troubleshooting

1. **File not found error**:
   - Verify that your STL file is in the correct location
   - Check the file permissions
   - Ensure the file name matches the configuration

2. **Output directory issues**:
   - The output directory will be created automatically if it does not exist
   - Ensure you have write permissions in the data directory

3. **Docker volume issues**:
   - Make sure the data directory exists locally
   - Check Docker has permissions to mount volumes
