#!/bin/bash
function waybar_config() {
  if ! command -v waybar >/dev/null 2>&1; then
    if grep -q "arch" /etc/os-release; then
      sudo pacman -S waybar --noconfirm
    else
      echo "[error]System is not supported for waybar"
      exit 1
    fi
  fi

  if [ ! -d ~/.config/waybar ]; then
    mkdir -p ~/.config/waybar
  fi

  local CWD="$(dirname "$(realpath "\$0")")"
  cd $CWD
  cp $CWD/desktop/hyprland/waybar/theme0/* ~/.config/waybar/
}
