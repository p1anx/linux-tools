#!/bin/bash
function lazygit() {
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin
  if [[ -f "lazygit.tar.gz" && -f "lazygit" ]]; then
    rm lazygit.tar.gz
    rm lazygit
    echo "lazygit download file is deleted"
  else
    echo "no file of lazygit"
  fi

}
