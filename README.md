# OpnSOCKS
OpnSOCKS (Openvpn + MicroSOCKS) is a proxy server forward its traffic to an openvpn network without the need to connect your entier device to the VPN network it self. OpnSOCKS uses SOCKS5 to forward your traffic to an environment that are connected to the VPN instead! 

with this OpnSOCKS, you can create as many instances of OpnSOCKS as you please, and connect each of them to a seperate VPN network thus giving you the option to switch VPN network without actually turning on and off VPN. this, combined with [SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega) can be powerfull in certain situations, in where you are required to interact with multiple websites that are deployed behind multiple vpn. and so instead of each browser having their own SOCKS5 proxy you can have 1 browser with multiple VPN connection to each tabs!

### Usage
to quickly run OpnSOCKS as default configuration you can use this command
```sh
sudo docker run  \
  -v ${PWD}/client.ovpn:/etc/openvpn/client.ovpn \
  --cap-add=NET_ADMIN -p 1080:1080 \
  --rm -it onixldlc/opnsocks:latest
```
