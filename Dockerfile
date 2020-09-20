FROM debian:buster-slim

ARG VERSION="0.94.3"

LABEL maintainer="felix.yadomi@gmail.com"
LABEL version="v${VERSION}"

ADD http://download.repetier.com/files/server/debian-amd64/Repetier-Server-${VERSION}-Linux.deb repetier-server.deb

RUN dpkg --unpack repetier-server.deb \
    && rm -rf repetier-server.deb \
    && rm -f /var/lib/dpkg/info/repetier-server.postinst

RUN mkdir -p /data \
    && sed -i "s/var\/lib\/Repetier-Server/data/g" /usr/local/Repetier-Server/etc/RepetierServer.xml

EXPOSE 3344

CMD [ "/usr/local/Repetier-Server/bin/RepetierServer", "-c", "/usr/local/Repetier-Server/etc/RepetierServer.xml" ]
