#!/bin/bash
function hypr_config() {
  local CWD="$(dirname "$(realpath "\$0")")"
  if [ -d ~/.config/hypr ]; then
    rm -rf ~/.config/hypr/*
  else
    mkdir -p ~/.config/hypr
  fi
  local HYPR=$CWD/desktop/hyprland/hypr
  cp -r $HYPR/configs $HYPR/hyprland.conf ~/.config/hypr/

}
