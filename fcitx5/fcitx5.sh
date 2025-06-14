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
  return 0
}

function fcitx5_config() {
  local script_dir=$(get_dir)
  git clone https://github.com/thep0y/fcitx5-themes.git $HOME/fcitx5-themes
  # cd fcitx5-themes
  if [[ ! -f $HOME/.local/share/fcitx5/themes ]]; then
    mkdir -p $HOME/.local/share/fcitx5/themes
  fi
  cp $HOME/fcitx5-themes/* $HOME/.local/share/fcitx5/themes -r
  if [[ ! -d $HOME/.config/fcitx5 ]]; then
    mdkir -p $HOME/.config/fcitx5
  fi
  cp $script_dir/config/* $HOME/.config/fcitx5/ -r
  rm -rf $HOME/fcitx5-themes

  return 0
}

function fcitx5() {
  fcitx5_install
  if [[ $? -eq 0 ]]; then
    echo "${GREEN}[${OK}] fcitx5 install${RESET}"
  else
    echo "${RED}[${ERROR}] fcitx5 install${RESET}"
    exit 1
  fi

  fcitx5_config
  if [[ $? -eq 0 ]]; then
    echo "${GREEN}[${OK}] fcitx5 config${RESET}"
  else
    echo "${RED}[${ERROR}] fcitx5 config${RESET}"
    exit 1
  fi
}
