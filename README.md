# docker-repetier-server

Repetier Server from [repetier-server.com](https://www.repetier-server.com/download-repetier-server/) in a Docker based on Debian.

## Summary

- Peristant data are located in `/data`. You can either use a bind-mount or create a volume.
- Port `3344` is the exposed port for the Web UI
- USB printers should be forwarded with `--device` argument

## Usage

```bash
docker volume create repetier-data
docker run -it --rm -p 3344:3344 -v repetier-data:/data --device=/dev/ttyUSB0 yadomi/repetier-server
```
