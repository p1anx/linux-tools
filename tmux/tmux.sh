#!/bin/bash
function tmux() {

  if grep -q "ubuntu" /etc/os-release; then
    sudo apt update
    sudo apt install tmux -y
  elif grep -q "rocky" /etc/os-release; then
    sudo yum update
    sudo yum install tmux -y
  else
    echo "The system is not supported"
    exit
  fi

  local OH_MY_TMUX_DIR="$HOME/oh_my_tmux"
  mkdir -p $OH_MY_TMUX_DIR
  git clone https://github.com/p1anx/.tmux.git $OH_MY_TMUX_DIR
  mkdir -p ~/.config/tmux
  ln -s $OH_MY_TMUX_DIR/.tmux.conf ~/.config/tmux/tmux.conf
  cp $OH_MY_TMUX_DIR/.tmux.conf.local ~/.config/tmux/tmux.conf.local

}
