#!/bin/bash

set -eo pipefail
set -x

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install curl vim git -y

sudo apt-get install -y ubuntu-restricted-extras \
 software-properties-common apt-transport-https \
 linux-tools-common linux-tools-generic linux-tools-$(uname -r) \
 build-essential automake \
 terminator fish curl tree rlwrap gnome-tweaks httpie graphviz \
 python-dev-is-python3 python3-pip

./cloudflare-warp-client.sh