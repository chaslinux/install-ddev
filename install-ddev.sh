#!/bin/bash
# script to install ddev

if [ ! /usr/bin/docker ]; then
    echo "Docker is not installed...please install it"
else
    echo "Docker is installed"
    sudo sh -c 'echo ""'
    sudo apt-get update && sudo apt-get install -y curl
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://pkg.ddev.com/apt/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/ddev.gpg > /dev/null
    sudo chmod a+r /etc/apt/keyrings/ddev.gpg
    sudo sh -c 'echo ""'
    echo "deb [signed-by=/etc/apt/keyrings/ddev.gpg] https://pkg.ddev.com/apt/ * *" | sudo tee /etc/apt/sources.list.d/ddev.list >/dev/null
    sudo sh -c 'echo ""'
    sudo apt-get update && sudo apt-get install -y ddev
    ddev -v
    mkcert -install
fi
