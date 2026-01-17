from pathlib import Path
from dataclasses import dataclass
from typing import ClassVar, Optional
import logging, os
from datetime import datetime
from logging.handlers import RotatingFileHandler

class Logger:

    COLORS = {
        "INFO": "\033[94m",        # Light blue
        "SUCCESS": "\033[92m",     # Light green
        "WARNING": "\033[93m",     # Light yellow
        "ERROR": "\033[91m",       # Light red
        "RESET": "\033[0m"         # Reset color
    }

    def __init__(self, name: str = "log"):
        self.start_time = datetime.now()
        self.logger = logging.getLogger(name)
        self.logger.setLevel(logging.DEBUG)
        self._show_logs_in_console = True

        self.formatter = logging.Formatter(
                "%(asctime)s - %(module)s - %(levelname)s - %(message)s",
                datefmt="%H:%M:%S"
            )

        self._console_handler = logging.StreamHandler()
        self._console_handler.setFormatter(self.formatter)
        self._update_console_handler()

    def log_file(self, log_file: str= "."):
        """Add file logging to the logger"""
        try:
            log_path = os.path.join(log_file, 'log.log')
            if not any(isinstance(handler, RotatingFileHandler) for handler in self.logger.handlers):
                file_handler = RotatingFileHandler(
                                                log_path, 
                                                maxBytes=5 * 1024 * 1024, 
                                                backupCount=3
                                                )
                file_handler.setFormatter(self.formatter)
                self.logger.addHandler(file_handler)
                self.info(f"Log file initialized at: {log_path}")

        except Exception as e:
            self.error(f"Error initializing log file: {str(e)}")

    @property
    def show_logs_in_console(self):
        return self._show_logs_in_console
    
    @show_logs_in_console.setter
    def show_logs_in_console(self, val: bool= True):
        self._show_logs_in_console = val
        self._update_console_handler()
    
    def _update_console_handler(self):
        if self._show_logs_in_console:
            if self._console_handler not in self.logger.handlers:
                self.logger.addHandler(self._console_handler)
        
        else:
            if self._console_handler in self.logger.handlers:
                self.logger.removeHandler(self._console_handler)
    
    def _colored(self, msg: str, level: str):
        return f"{self.COLORS[level]}{msg}{self.COLORS['RESET']}"
    
    def debug(self, message: str):
        """Log message"""
        self.logger.debug(message, stacklevel=2)

    def info(self, message: str):
        """Log info"""
        self.logger.info(self._colored(message, "INFO"), stacklevel=2)

    def success(self, message: str):
        """Log success"""
        self.logger.info(self._colored(message, "SUCCESS"), stacklevel=2)

    def warning(self, message: str):
        """Log warning"""
        self.logger.warning(self._colored(message, "WARNING"), stacklevel=2)

    def error(self, message: str):
        """Log error"""
        self.logger.error(self._colored(message, "ERROR"), exc_info=True, stacklevel=2)

    def finalize(self):
        execution_time = datetime.now() - self.start_time
        minutes = int(execution_time.total_seconds() // 60)
        seconds = int(execution_time.total_seconds() % 60)
        self.success(f"Finished! Execution time: {minutes} minutes and {seconds} seconds")


@dataclass
class PrintingConfig:
    """3D printing parameters

    Attributes:
        EXTRUSION_WIDTH (float): Width of the extruded filament in mm
        FILAMENT_WIDTH (float): Diameter of the raw filament in mm
        BED_TEMP (int): Build plate temperature in Celsius
        EXTRUDER_TEMP (int): Extruder temperature in Celsius
        FEED_RATE (int): Print speed in mm/min
        NO_PLANAR_FEEDRATE (int): Speed for non-planar movements in mm/min
        BED_DIMENSIONS (tuple): Build plate dimensions (x, y) in mm
        BOTTOM_LAYERS (int): Number of bottom layers
        TOP_LAYERS (int): Number of top layers
    """
    EXTRUSION_WIDTH: float = 2    # mm
    OUTTER_RADIUS: float = 0.55     # mm
    FILAMENT_WIDTH: float = 1.75    # mm
    FEED_RATE: int = 9000           # mm/min
    NO_PLANAR_FEEDRATE: int = 10    # Feedrate in mm/min for non-planar movements
    BED_TEMP: int = 60              # Celsius
    EXTRUDER_TEMP: int = 200        # Extruder temperature in Celsius 140 PCL 210 PLA
    BED_DIMENSIONS: tuple = (200, 200)  # mm
    BOTTOM_LAYERS: int = 2
    TOP_LAYERS: int = 2

    @property
    def LAYER_HEIGHT(self) -> float:
        return 0.5 * self.EXTRUSION_WIDTH

@dataclass
class MeshConfig:
    """Mesh generation parameters
    
    Attributes:
        INITIAL_SPHERE_RADIUS (float): Initial radius for sphere generation in mm
        INITIAL_CYLINDER_RADIUS (float): Initial radius for cylinder generation in mm
        PORE_RADIUS (float): Pore radius in mm
        PORE_AREA (int): Pore area in mm^2
    """
    SECTION_THICKNESS = 0.4
    N_SIDES = 4
    PORE_RADIUS: float = None  # mm
    PORE_AREA: int = 8
    BOLTS = False
    MESH_SUBDIVISION_LOOPS = 4
    MIN_STRUT_ANGLE = 45

@dataclass
class PathConfig:
    """System paths configuration
    
    Paths can be configured using environment variables:
    - MESHGEN_BASE_DIR: Project base directory
    - MESHGEN_DATA_DIR: Data directory
    - MESHGEN_OUTPUT_DIR: Results directory
    - MESHGEN_TMP_DIR: Temporary directory
    - MESHGEN_STL_FILE: Input STL file path
    
    Attributes:
        BASE_PATH (Path): Project's base directory
        DATA_PATH (Path): Data directory
        OUTPUT_PATH (Path): Results directory
        TMP_PATH (Path): Temporary files directory
        STL_FILE (Path): Input STL file path
    """
    BASE_PATH: Path = Path(os.getenv('MESHGEN_BASE_DIR', 
                                      Path(__file__).parent))
    DATA_PATH: Path = Path(os.getenv('MESHGEN_DATA_DIR', 
                                      BASE_PATH / "data"))
    OUTPUT_PATH = Path(os.getenv('MESHGEN_OUTPUT_DIR', 
                                        DATA_PATH / "output"))
    TMP_PATH: Path = Path(os.getenv('MESHGEN_TMP_DIR', 
                                     BASE_PATH / "tmp"))
    STL_FILE: Path = Path(os.getenv('MESHGEN_STL_FILE', 
                                     DATA_PATH / "Cylinder.stl"))


class Config:
    """Global application configuration
    
    This class manages all configuration aspects of the application,
    including printer settings, mesh parameters, and system paths.
    """
    _instance: ClassVar[Optional["Config"]] = None
    _initialized: ClassVar[bool] = False
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance
    
    def __init__(self):
        if not self._initialized:
            self.printing = PrintingConfig()
            self.mesh = MeshConfig()
            self.paths = PathConfig()

            self.SHOW_LOGS_IN_CONSOLE = True

            self._initialized = True
    
    def validate(self, logger: Logger):
        """Validate most important configuration parameters
        Args:
            logger: logger instance for validation messages
            
        Raises:
            ConfigurationError: If any configuration is invalid
        """

        if not logger:
            raise ValueError("Logger is required")
        
        self.logger = logger
        self.logger.info("Initializing configuration...")

        self.paths.OUTPUT_PATH.mkdir(parents=True, exist_ok=True)
        self.paths.TMP_PATH.mkdir(parents=True, exist_ok=True)
        
        if not self.paths.STL_FILE.exists():
            self.logger.error(f"STL file not found: {self.paths.STL_FILE}")
            raise
        
        if self.printing.EXTRUSION_WIDTH <= 0:
            self.logger.error("EXTRUSION_WIDTH must be greater than 0")
        
        if not self.mesh.PORE_AREA  and not self.mesh.PORE_RADIUS:
            self.logger.error("Either PORE_RADIUS or PORE_AREA must be provided")
            raise
        
        if self.SHOW_LOGS_IN_CONSOLE:
            self.logger.show_logs_in_console = self.SHOW_LOGS_IN_CONSOLE
            self.logger.info("Activated logs in console")
        else:
            self.logger.show_logs_in_console = self.SHOW_LOGS_IN_CONSOLE
            self.logger.info("Deactivated logs in console. Shown in log file only.")


config = Config()

