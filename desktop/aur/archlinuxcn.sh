#!/bin/bash
sudo tee -a /etc/pam.conf <<EOF
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch
EOF
sudo pacman -Sy archlinuxcn-keyring
sudo pacman -S yay --noconfirm
