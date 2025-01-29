from pathlib import Path
from dataclasses import dataclass
from utils.logger import Logger
from typing import ClassVar, Optional

@dataclass
class PrintingConfig:
    """Parámetros de impresión 3D"""
    EXTRUSION_WIDTH: float = 0.8    # mm
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
    """Mesh generation parameters"""
    INITIAL_SPHERE_RADIUS: float = 2
    INITIAL_CYLINDER_RADIUS: float = 2
    PORE_RADIUS: float = None  # mm
    PORE_AREA: int = 80

@dataclass
class PathConfig:
    """Paths configuration"""
    BASE_PATH: Path = Path(__file__).parent
    DATA_PATH: Path = Path("data")
    OUTPUT_PATH: Path = BASE_PATH / DATA_PATH / "output"
    TMP_PATH: Path = Path("tmp")
    STL_FILE: Path = BASE_PATH/ DATA_PATH / "Part.stl"


class Config:
    """Global configuration"""
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
        """Validate paths"""
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