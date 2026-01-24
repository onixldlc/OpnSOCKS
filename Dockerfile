FROM onixldlc/microsocks:latest

ARG S6_OVERLAY_VERSION=3.1.6.2

RUN apk update && apk upgrade --update --no-cache

RUN apk add --no-cache \
    openvpn \
    bridge-utils \
    easy-rsa \
    iptables \
    bash

RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
    base64

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz

WORKDIR /openvpn
COPY . .
RUN chmod u+x ./*.sh

# Copy s6-overlay config (cont-init.d + services.d)
COPY s6-config/ /

ENTRYPOINT ["/init"]