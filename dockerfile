# Use the onerahmet/openai-whisper-asr-webservice image as the base image
FROM onerahmet/openai-whisper-asr-webservice:latest-gpu AS whisper_asr

RUN pip install jupyterlab
RUN pip install numpy
RUN pip install pandas

WORKDIR /home/maximalt/DocWhisper/Work

# Add the line to start Jupyter Lab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
