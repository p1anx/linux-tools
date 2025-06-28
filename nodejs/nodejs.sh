#!/bin/bash
function nodejs() {
  curl -o- https://fnm.vercel.app/install | bash
  if [[ $? != 0 ]]; then
    echo "${ERROR} failed to install fnm for nodejs${RESET}"
    exit 1
  fi
}
nodejs
