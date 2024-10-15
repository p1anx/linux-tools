#!/bin/bash
function hypr_config() {
  CWD="$(dirname "$(realpath "\$0")")"
  if [ -d ~/.config/hypr ]; then
    rm -rf ~/.config/hypr/*
  else
    mkdir -p ~/.config/hypr
  fi
  cp -r $CWD/configs hyprland.conf ~/.config/hypr/

}
