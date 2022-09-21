# docker-repetier-server

[![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/yadomi/docker-repetier-server/ci/master)](https://github.com/yadomi/docker-repetier-server/actions/workflows/build-and-push-dockerhub.yml)
[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/yadomi/repetier-server?sort=semver)](https://hub.docker.com/r/yadomi/repetier-server/tags?page=1&ordering=name)

Repetier Server from [repetier-server.com](https://www.repetier-server.com/download-repetier-server/) in a Docker based on Debian.

Latest version of Repetier Server in this docker image is ![Docker Image Version (latest semver)](https://img.shields.io/docker/v/yadomi/repetier-server?label=%20&sort=semver)

[See Repetier Changelog](https://download3.repetier.com/files/server/changelog.txt)

## Summary

- Peristant data are located in `/data`. You can either use a **bind-mount** or create **a volume**.
- Port `3344` is the exposed port for the Web UI
- USB printers should be forwarded with `--device` argument

## Usage

Make sure to adapt `/dev/tyyUSB` for your use case in the examples below.

### With CLI

```bash
docker volume create repetier-data
docker run -it -p 3344:3344 -v repetier-data:/data --device=/dev/ttyUSB0 --name repetier-server yadomi/repetier-server
```

### With docker-compose

```yaml
version: "3.8"
services:
    repetier:
        image: yadomi/repetier-server:latest
        volumes:
            - repetier-data:/data
        ports:
            - 3344:3344
        devices:
            - "/dev/ttyUSB0"

volumes:
    repetier-data:
```
