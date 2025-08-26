#!/bin/bash

function debian_requirement() {
  sudo apt update
  sudo apt install -y libfuse2 # for appimage
  sudo apt install -y build-essential curl wget git vim openssh-server flameshot fd-find
  sudo /etc/init.d/ssh start
}
function arch_requirement{
  sudo pacman -Sy
  sudo pacman -S --noconfirm curl wget git vim openssh fd base-devel

}
function fedora_requirement{
    sudo yum update
    sudo yum install -y libfuse2
}


function requirement() {
  if grep -q "debian" /etc/os-release; then
    debian_requirement
  elif grep -q "fedora" /etc/os-release; then
    fedora_requirement
  elif grep -q "arch" /etc/os-release; then 
    arch_requirement
  fi

}
