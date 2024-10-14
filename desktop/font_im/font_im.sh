#!/bin/bash
function font() {
  sudo tee -a /etc/locale.gen <<EOF
en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8
zh_SG.UTF-8 UTF-8
EOF
  sudo local-gen
  if [ ! -f ~/.xinitrc ]; then
    touch ~/.xinitrc
  fi
  if [ ! -f ~/.xprofile ]; then
    touch ~/.xprofile
  fi
  tee -a ~/.xinitrc <<EOF
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
EOF
  tee -a ~/.xprofile <<EOF
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
EOF
  if grep -q "arch" /etc/os-release; then
    sudo pacman -S noto-fonts-cjk --noconfirm
  fi

}
function im() {
  #sudo pacman -S --noconfirm fcitx5-rime fcitx5-im fcitx5-chinese-addons fcitx5-material-color fcitx5-pinyin-moegirl fcitx5-pinyin-zhwiki
  sudo pacman -S --noconfirm fcitx5-rime fcitx5-im fcitx5-material-color
  yay -S --noconfirm rime-ice-git
  tee -a ~/.bashrc <<EOF
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
EOF

}
