#!/bin/bash
function fcitx5_install() {
  sudo apt install fcitx5 -y
  sudo apt install fcitx5-chinese-addons -y
  sudo apt install fcitx5-material-color -y
  sudo apt install fcitx5-frontend-gtk3 fcitx5-frontend-gtk2 -y
  sudo apt install fcitx5-frontend-qt5 kde-config-fcitx5 -y
  if [ -f "$HOME/.zshrc" ]; then
    tee -a $HOME/.zshrc <<EOF
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
EOF
  elif [ -f "$HOME/.bashrc" ]; then
    tee -a $HOME/.bashrc <<EOF
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
EOF
  else
    echo 'fcitx5 needs to write"export GTK_IM_MODULE=fcitx5;export QT_IM_MODULE=fcitx5;export XMODIFIERS=@im=fcitx5" in .zshrc or .bashrc'
    exit 1
  fi
  sudo tee -a /etc/environment <<EOF
GTK_IM_MODULE=fcitx5
QT_IM_MODULE=fcitx5
XMODIFIERS=@im=fcitx5
EOF
}
