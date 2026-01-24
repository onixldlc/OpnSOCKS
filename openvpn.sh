#!/bin/bash

CONFIG_PATH="${CONFIG_PATH}"
CONFIG_BASE64="${CONFIG_BASE64}"

if [ -z "$CONFIG_BASE64" ]; then
    echo "No config file specified!"
else
    echo "Config file specified!"
    echo "$CONFIG_BASE64" | base64 -d > /etc/openvpn/client.ovpn
fi

if [ -z "$CONFIG_PATH" ]; then
    echo "No config file specified! using default config path!"
    CONFIG_PATH="/etc/openvpn/client.ovpn"
else
    echo "Config file specified!"
fi

if [ "$CONFIG_PATH" == "/etc/openvpn/client.ovpn" ]; then
    echo "Using default config path!"
else
    echo "Using custom config path!"
fi
echo "config file: [$CONFIG_PATH]"


if [ -f "$CONFIG_PATH" ]; then
    cp "$CONFIG_PATH" /etc/openvpn/client.ovpn
else
    echo "No config file found at [$CONFIG_PATH] !"
    exit 1
fi

echo "setting up /dev/net/tun..."
mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

openvpn --config /etc/openvpn/client.ovpn &
echo "[+] openvpn started!"