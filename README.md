# Whisper CLI in Docker

[![Docker Build](https://github.com/jo-hoe/whisper-docker-cli/actions/workflows/docker-build-test.yml/badge.svg)](https://github.com/jo-hoe/whisper-docker-cli/actions?workflow=docker-build-test)

This repository wraps [whisper](https://github.com/openai/whisper) in a docker container.

## Stare via Docker

In `bash` or run the following command to start the container to transcribe an audio file (e.g. `demo.mp3`) in the `input` folder.

```bash
docker run --rm -it \
  -v $(pwd)/input:/mnt/input:ro \
  -v $(pwd)/output:/mnt/output \
  -v $(pwd)/cache:/root/.cache/whisper/ \
  ghcr.io/jo-hoe/whisper-docker-cli:latest \
  whisper /mnt/input/demo.mp3 --output_dir /mnt/output/ -f srt
```

In `PowerShell` you can use the following command.

```PowerShell
docker run --rm -it `
  -v ${PWD}/input:/mnt/input:ro `
  -v ${PWD}/output:/mnt/output `
  -v ${PWD}/cache:/root/.cache/whisper/ `
  ghcr.io/jo-hoe/whisper-docker-cli:latest `
  whisper /mnt/input/demo.mp3 --output_dir /mnt/output/ -f srt
```

Both commands will store the transcription in a directory called `output` and cache any downloaded models in a directory called `cache` on the same level as the input folder.

## Start via Docker Compose

```bash
# start via docker compose
docker-compose up -d
# exec into the container
docker exec -it whisper bash
# use the whisper cli to transcribe an audio file
whisper /mnt/input/demo.mp3 --output_dir /mnt/output/ -f srt
```

The docker compose file will create an read only `input` directory and a writable `output` directory.
Models are downloaded automatically and stored in a directory called `cache`.

## Start with CUDA Support

If you have and NVIDIA graphics card with [CUDA](https://developer.nvidia.com/cuda-downloads) support and drivers installed, you can speed up the transcription. For this use the `docker-compose.cuda.yaml` to utilize your GPU.

```bash
docker compose -f .\docker-compose.yaml -f .\docker-compose.cuda.yaml up -d
```

If you do not want to type this long command you can also the the [COMPOSE_FILE](https://docs.docker.com/compose/environment-variables/envvars/#compose_file) variable to specify both compose files.

On Linux and MacOS:

```bash
export COMPOSE_FILE=docker-compose.yaml:docker-compose.cuda.yaml
docker compose up -d
```

and on Windows:

```PowerShell
$env:COMPOSE_FILE="docker-compose.yaml;docker-compose.cuda.yaml"
docker compose up -d
```
