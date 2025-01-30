FROM python:3.10-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    MESHGEN_BASE_DIR=/app \
    MESHGEN_DATA_DIR=/app/data \
    MESHGEN_OUTPUT_DIR=/app/data/output \
    MESHGEN_TMP_DIR=/app/tmp

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -e .

COPY . .

RUN mkdir -p /app/data/output /app/tmp \
    && chmod -R 777 /app/data /app/tmp

VOLUME ["/app/data", "/app/tmp"]


CMD ["python", "main.py"]