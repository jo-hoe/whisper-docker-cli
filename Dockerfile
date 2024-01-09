FROM python:3.11-slim

WORKDIR /opt/app

RUN apt-get update && \
    apt-get install -y git ffmpeg && \
    rm -rf /var/lib/apt/lists/*

RUN pip install git+https://github.com/openai/whisper.git

# No ENTRYPOINT nor CMD is defined on purpose