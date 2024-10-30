#!/bin/bash
function hypr_config() {
  local HYPR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  echo "hypr脚本所在的目录是: $HYPR"
  if [ -d ~/.config/hypr ]; then
    rm -rf ~/.config/hypr/*
  else
    mkdir -p ~/.config/hypr
  fi
  cp -r $HYPR/configs $HYPR/hyprland.conf $HYPR/wallpaper ~/.config/hypr/
  sudo pacman -S swww waybar --noconfirm

}
