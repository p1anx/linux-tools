#!/bin/bash
function aur() {
  sudo tee -a /etc/pacman.conf <<EOF
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch
EOF
  sudo pacman -Sy archlinuxcn-keyring
  sudo pacman -S yay --noconfirm

}
