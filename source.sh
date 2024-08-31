#!/bin/bash

function source() {
  if grep -q "ubuntu" /etc/os-release; then
    sudo bash <(curl -sSL https://linuxmirrors.cn/main.sh)
  elif grep -q "rocky" /etc/os-release; then
    sudo dnf install -y epel-release
    echo "without"
  else
    echo "The system is not supported"
    exit
  fi

}
