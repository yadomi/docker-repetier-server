# docker-repetier-server

Repetier Server from [repetier-server.com](https://www.repetier-server.com/download-repetier-server/) in a Docker based on Debian.

Latest version of Repetier Server Docker image is `v1.1.2` ([Changelog](https://download3.repetier.com/files/server/changelog.txt))

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
