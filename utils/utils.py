import os, pytz
from datetime import datetime

def parse_ouput_folfer(file_path, output_folder):
    file_name = os.path.basename(file_path)
    tz = pytz.timezone("Europe/Madrid")
    current_time = datetime.now(tz).strftime("%d-%m-%H-%M")
    folder_name = f"{os.path.splitext(file_name)[0]}_{current_time}"
    output_path = os.path.join(parsed_path(output_folder),folder_name)
    if not os.path.exists(output_path):
        os.mkdir(output_path)
    print(f"Output folder: {output_path}")
    
    return output_path

def parsed_path(path):
    return os.path.abspath(os.path.join(os.path.dirname(__file__), "..", path))