FROM jupyter/scipy-notebook

USER root
RUN apt-get update && apt-get install -y \
    build-essential \
    openjdk-17-jdk \
    ca-certificates-java \
    libx11-dev \
    libxcursor1 \
    libxrandr2 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    xvfb \
    libcairo2-dev \
    curl \
    pkg-config \
    python3-dev \
    git && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH="$JAVA_HOME/bin:$PATH"
ENV JAVA_OPTS="-Djava.awt.headless=false"

RUN pip install --upgrade pip setuptools wheel && \
    pip install jupyterlab py5jupyter 

RUN python -m py5jupyter.kernels.py5.install --sys-prefix
RUN python -m py5jupyter.kernels.py5bot.install --sys-prefix 

EXPOSE 8888

CMD ["xvfb-run", "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''"]
