FROM debian:stable-slim

RUN apt update && apt install -y dnsmasq wireless-tools curl && apt clean -y

WORKDIR /usr/src
ARG ARCH="amd64"
ARG VERSION="4.4.6"
RUN curl -Ls "https://github.com/balena-os/wifi-connect/releases/download/v$VERSION/wifi-connect-v$VERSION-linux-$ARCH.tar.gz" \
  | tar -xvz -C /usr/src

RUN mkdir /usr/src/redirect

COPY start.sh .
CMD ["bash", "start.sh"]

