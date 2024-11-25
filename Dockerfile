FROM  pymesh/pymesh:py3.7

WORKDIR /workspace

COPY . /workspace

RUN pip install --no-cache-dir -e .

CMD ["/bin/bash"]