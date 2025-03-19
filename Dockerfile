FROM onixldlc/microsocks:latest

RUN apk update && apk upgrade --update --no-cache

RUN apk add --no-cache \
    openvpn \
    bridge-utils \
    easy-rsa \
    iptables

RUN apk add --no-cache \
    bash

WORKDIR /openvpn
COPY . .
RUN chmod u+x ./*.sh

ENTRYPOINT ["bash"]
CMD ["./entrypoint.sh"]