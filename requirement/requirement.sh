#!/bin/bash

function ubuntu_requiremnet() {
  sudo apt update
  sudo apt install -y libfuse2 # for appimage
  sudo apt install -y build-essential curl wget git vim openssh-server flameshot fd-find
  sudo /etc/init.d/ssh start
}

function requirement() {

  if grep -q "ubuntu" /etc/os-release; then
    ubuntu_requiremnet
  elif grep -q "rocky" /etc/os-release; then
    sudo yum update
    sudo yum install -y libfuse2
  fi

}
