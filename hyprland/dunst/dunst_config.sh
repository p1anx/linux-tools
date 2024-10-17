#!/bin/bash
function dunst_config() {
  local script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  echo "waybar_config.sh脚本所在的目录是: $script_dir"

  if [ ! -d ~/.config/dunst ]; then
    mkdir -p ~/.config/dunst
  else
    mv ~/.config/dunst ~/.config/dunst.bak
    echo "dunst is backed up"
  fi
  cp $script_dir/dunstrc2 ~/.config/dunst
}
