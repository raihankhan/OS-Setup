#!/bin/bash

set -eo pipefail
set -x

sudo apt update && sudo apt upgrade -y

sudo apt install curl vim tldr git git-gui -y
tldr sed

sudo apt install -y ubuntu-restricted-extras \
 software-properties-common apt-transport-https \
 linux-tools-common linux-tools-generic linux-tools-$(uname -r) \
 build-essential automake \
 terminator fish curl tree rlwrap gnome-tweaks httpie graphviz \
 python-dev-is-python3 python3-pip