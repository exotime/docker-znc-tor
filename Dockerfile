# version 1.4-1
# docker-version 0.9.1
FROM        ubuntu:14.04
MAINTAINER  Xen "xen@shastafareye.net"

# We use a bootstrap script to avoid having temporary cache files and build
# dependencies being committed and included into the docker image.
ADD         bootstrap.sh /tmp/
RUN         chmod +x /tmp/bootstrap.sh
RUN         /tmp/bootstrap.sh

RUN         useradd znc
ADD         start-znc-tor /usr/local/bin/
ADD         znc.conf.default /src/
RUN         chmod 644 /src/znc.conf.default

EXPOSE      6667
ENTRYPOINT  ["/usr/local/bin/start-znc-tor"]
CMD         [""]
