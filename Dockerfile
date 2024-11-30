FROM xcimer/pymesh:latest-amd64

WORKDIR /mesh-gen

COPY . /mesh-gen

RUN pip install --no-cache-dir -e .

CMD ["/bin/bash"]
