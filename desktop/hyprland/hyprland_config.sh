#!/bin/bash

function hyprland_config() {
  local HYPRLAND="$(dirname "$(realpath "\$0")")"
  source $HYPRLAND/desktop/hyprland/aur/aur.sh
  source $HYPRLAND/desktop/hyprland/font_im/font_im.sh
  source $HYPRLAND/desktop/hyprland/waybar/waybar_config.sh
  source $HYPRLAND/desktop/hyprland/hypr/hypr_config.sh
  source $HYPRLAND/nerd_fonts.sh
  source $HYPRLAND/desktop/hyprland/rofi/rofi_config.sh

  aur
  font_im
  waybar_config
  hypr_config
  nerd_fonts
  rofi_config

}
