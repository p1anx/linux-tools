#!/bin/bash
function dependency() {

  if grep -q "ubuntu" /etc/os-release; then
    sudo apt update
    sudo apt install -y libfuse2 # for appimage
  elif grep -q "rocky" /etc/os-release; then
    sudo yum update
    sudo yum install -y libfuse2
  fi

}
