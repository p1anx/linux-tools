#!/bin/bash

HYPRLAND="$(dirname "$(realpath "\$0")")"
source $HYPRLAND/aur/aur.sh
source $HYPRLAND/font_im/font_im.sh
source $HYPRLAND/waybar/waybar_config.sh
source $HYPRLAND/hypr/hypr_config.sh

aur
font_im
waybar_config
hypr_config
