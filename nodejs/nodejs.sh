#!/bin/bash
function nodejs() {
  if [[ ! command -v curl > /dev/null 2>&1 ]];then
    sudo apt install curl -y
  fi
  curl -o- https://fnm.vercel.app/install | bash
  if [[ $? != 0 ]]; then
    echo "${ERROR} failed to install fnm for nodejs${RESET}"
    exit 1
  fi
}
