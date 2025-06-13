#!/bin/bash
function fcitx5_config() {
  local script_dir=$(dirname $(realpath $0))
  git clone https://github.com/thep0y/fcitx5-themes.git $HOME/fcitx5-themes
  # cd fcitx5-themes
  if [[ ! -f $HOME/.local/share/fcitx5/themes ]]; then
    mkdir -p $HOME/.local/share/fcitx5/themes
  fi
  cp $HOME/fcitx5-themes/* $HOME/.local/share/fcitx5/themes -r
  cp $script_dir/../fcitx5 $HOME/.config/ -r
  rm -rf $HOME/fcitx5-themes
}
