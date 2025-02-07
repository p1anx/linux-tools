#!/bin/bash
function fish_ubuntu(){
  sudo apt-add-repository ppa:fish-shell/release-3
  sudo apt update -y
  sudo apt install fish -y
}
function fish_fedora(){
  sudo dnf install epel-release -y
  sudo dnf update -y
  sudo dnf install fish -y
}
function fish_arch(){
  sudo pacman -Syy
  sudo pacman -S --noconfirm fish
}
