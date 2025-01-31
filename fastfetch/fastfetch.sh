#!/bin/bash

function fastfetch() {
  if grep -q "ubuntu" /etc/os-release; then
    #for ubuntu
    sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
    sudo apt update
    sudo apt install fastfetch -y
  elif grep -q "rocky" /etc/os-release; then
    #for red hat
    sudo dnf install -y fastfetch
  else
    echo "The system is not supported"
    exit
  fi

}
