# OpnSOCKS
OpnSOCKS (Openvpn + MicroSOCKS) is a proxy server forward its traffic to an openvpn network without the need to connect your entier device to the VPN network it self. OpnSOCKS uses SOCKS5 to forward your traffic to an environment that are connected to the VPN instead! 

with this OpnSOCKS, you can create as many instances of OpnSOCKS as you please, and connect each of them to a seperate VPN network thus giving you the option to switch VPN network without actually turning on and off VPN. this, combined with [SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega) can be powerfull in certain situations, in where you are required to interact with multiple websites that are deployed behind multiple vpn. and so instead of each browser having their own SOCKS5 proxy you can have 1 browser with multiple VPN connection to each tabs!

## Usage
### docker run
to quickly run OpnSOCKS as default configuration you can use this command
```sh
sudo docker run  \
  -v ${PWD}/client.ovpn:/etc/openvpn/client.ovpn \
  --cap-add=NET_ADMIN -p 1080:1080 \
  --rm -it onixldlc/opnsocks:latest
```

### docker compose
or if you like to use compose, you can fill the docker-compose.yml file like so
```yml
services:
  opnsock:
    image: onixldlc/opnsocks:latest
    cap_add:
      - NET_ADMIN
    ports:
      - "1080:1080"
    volumes:
      - ./client.ovpn:/etc/openvpn/client.ovpn
      # - ./client.ovpn:/client.ovpn         # optional, if config path is used
    environment:
      - CONFIG_PATH=/client.ovpn           # optional
      - CONFIG_BASE64=${CONFIG_BASE64}     # optional
      - MICROSOCKS_USER=test               # optional
      - MICROSOCKS_PASSWORD=test           # optional
      - MICROSOCKS_AUTHONCE=true           # optional
      - MICROSOCKS_LISTEN_IP=0.0.0.0       # optional
      - MICROSOCKS_WHITELIST=10.10.10.10   # optional
      - MICROSOCKS_BINDIP=0.0.0.0          # optional
      - MICROSOCKS_PORT=1080               # optional
      - MICROSOCKS_QUIET=false             # optional
```
then run the compose by using
```
sudo docker compose up -d
```
