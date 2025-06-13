#!/bin/bash
function fish_ubuntu() {
  sudo apt-add-repository ppa:fish-shell/release-4
  sudo apt update -y
  sudo apt install fish -y
}
function fish_fedora() {
  sudo dnf install epel-release -y
  sudo dnf update -y
  sudo dnf install fish -y
}
function fish_arch() {
  sudo pacman -Syy
  sudo pacman -S --noconfirm fish
}

function fish() {
  if grep -q "debian" /etc/os-release; then
    fish_ubuntu
  elif grep -q "rocky" /etc/os-release; then
    fish_fedora
  elif grep -q "arch" /etc/os-release; then
    fish_arch
  else
    echo "[error]The system is not supported"
    exit 1
  fi
}
