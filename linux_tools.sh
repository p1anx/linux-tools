#!/bin/bash
echo "hello shell"
sudo apt update
sudo apt install curl -y
sudo apt install git -y
sudo apt install tmux -y

# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# download and install Node.js (you may need to restart the terminal)
# nvm install 20
# verifies the right Node.js version is in the environment
# node -v # should print `v20.14.0`
# verifies the right NPM version is in the environment
# npm -v # should print `10.7.0`
