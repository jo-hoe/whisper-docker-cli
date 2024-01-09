# Whisper Docker CLI

[![Docker Build](https://github.com/jo-hoe/whisper-docker-cli/actions/workflows/docker-build-test.yml/badge.svg)](https://github.com/jo-hoe/whisper-docker-cli/actions?workflow=docker-build-test)

This repository wraps [whisper](https://github.com/openai/whisper) in a docker container.

## Start via Docker Compose

```bash
# start via docker compose
docker-compose up -d
# exec into the container
docker exec -it whisper bash
# use the whisper cli to transcribe an audio file
whisper /mnt/input/demo.mp3 --output_dir /mnt/output/ -f srt
```

The docker compose file will create an read only `input` folder and a writable `output` folder.
Models are downloaded automatically and stored in the `cache` folder.
