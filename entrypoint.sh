#!/bin/bash

# start microsocks
echo "[+] Starting microsocks..."
source ./microsocks.sh

# start openvpn
echo "[+] Starting OpenVPN..."
source ./openvpn.sh

echo "both services started!"
tail -f /dev/null