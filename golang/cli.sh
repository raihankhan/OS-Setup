#!/bin/bash
# Copyright 2024 Raihan Khan
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


go_version=1.23.1
wget https://go.dev/dl/go${go_version}.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go${go_version}.linux-amd64.tar.gz
sudo chown -R $(id -u):$(id -g) /usr/local/go
rm go${go_version}.linux-amd64.tar.gz

if [[ ! -d "$HOME/go" ]]; then
    mkdir $HOME/go
fi

# Check if the lines already exist in .bashrc
if ! grep -q 'export GOPATH=$HOME/go' ~/.bashrc && ! grep -q 'export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH' ~/.bashrc; then
  echo "export GOPATH=$HOME/go" >> ~/.bashrc
  echo "export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH" >> ~/.bashrc
fi

source ~/.bashrc
go version || exit

