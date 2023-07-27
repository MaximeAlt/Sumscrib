# Use the nvidia/cuda as the base image
FROM nvidia/cuda:12.2.0-devel-ubuntu20.04 AS base

ARG DEBIAN_FRONTEND=noninteractive

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip
    
# Install ffmpeg
RUN apt-get install -y ffmpeg

# Install additional Python packages from requirements.txt
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# Set the working directory to /home/maximalt/DocWhisper/Sumscrib
WORKDIR /home/maximalt/DocWhisper/Sumscrib/jupyterwork

# start Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

