#!/bin/bash
source $G_MAIN_DIR/shell_scripts/basic.sh

function fcitx5_config() {
  local script_dir=$(get_dir)
  git clone https://github.com/thep0y/fcitx5-themes.git $HOME/fcitx5-themes
  # cd fcitx5-themes
  if [[ ! -f $HOME/.local/share/fcitx5/themes ]]; then
    mkdir -p $HOME/.local/share/fcitx5/themes
  fi
  cp $HOME/fcitx5-themes/* $HOME/.local/share/fcitx5/themes -r
  cp $script_dir $HOME/.config/ -r
  rm -rf $HOME/fcitx5-themes
}
