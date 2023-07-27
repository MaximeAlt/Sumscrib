#!/bin/bash

# Check if the Docker container with the same image is running
if [ "$(docker ps -q -f ancestor=docwhisper)" ]; then
  # If it's running, stop and remove it
  docker stop $(docker ps -q -f ancestor=docwhisper)
  docker rm $(docker ps -aq -f ancestor=docwhisper)
fi

# Run the Docker container in detached mode

docker run -it -p 8888:8888 -v /path/to/jupyter_files:/home/maximalt/DocWhisper/Sumscrib/jupyterwork docwhisper

docker logs docwhisper
