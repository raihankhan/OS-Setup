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

# Since there is no repo for noble yet the variable $(lsb_release -cs) which returns noble for ubuntu 24.04, will cause issues, use jammy release and it works fine
# ref:https://community.cloudflare.com/t/warp-on-ubuntu-24-04-lts/652275/3
VERSION_CODENAME=$(lsb_release -cs)
if [ "$VERSION_CODENAME" = "noble" ]; then
  VERSION_CODENAME="jammy"
fi

# Add cloudflare gpg key
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg


# Add this repo to your apt repositories
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $VERSION_CODENAME main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list


# Install
sudo apt-get update && sudo apt-get install cloudflare-warp -y

# To connect for the very first time
warp-cli --accept-tos registration new