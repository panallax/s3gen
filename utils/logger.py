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
        self.logger.setLevel(logging.INFO)
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
        self.logger.error(self._colored(message, "ERROR"), stacklevel=2)

    def finalize(self):
        execution_time = datetime.now() - self.start_time
        minutes = int(execution_time.total_seconds() // 60)
        seconds = int(execution_time.total_seconds() % 60)
        self.success(f"Finished! Execution time: {minutes} minutes and {seconds} seconds")
