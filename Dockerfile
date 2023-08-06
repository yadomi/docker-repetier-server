FROM debian:bullseye-slim

ARG VERSION="1.4.10"

LABEL maintainer="felix.yadomi@gmail.com"
LABEL version="v${VERSION}"

ADD http://download.repetier.com/files/server/debian-amd64/Repetier-Server-${VERSION}-Linux.deb repetier-server.deb

# Install with dpkg and remove the deb after
RUN apt update \
    && apt install -y ffmpeg \
    && dpkg --unpack repetier-server.deb \
    && rm -f repetier-server.deb

# Create data directory at root and update configuration storage location with this path
RUN mkdir -p /data \
    && sed -i '/storage-directory/s%/var/lib/Repetier-Server%/data%' /usr/local/Repetier-Server/etc/RepetierServer.xml

EXPOSE 3344

CMD [ "/usr/local/Repetier-Server/bin/RepetierServer", "-c", "/usr/local/Repetier-Server/etc/RepetierServer.xml" ]
