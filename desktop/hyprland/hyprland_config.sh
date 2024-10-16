#!/bin/bash

function hyprland_config() {
  # 获取脚本文件所在的目录
  local script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  echo "脚本所在的目录是: $script_dir"
  exit 1
  source $script_dir/aur/aur.sh
  source $script_dir/font_im/font_im.sh
  source $script_dir/waybar/waybar_config.sh
  source $script_dir/hypr/hypr_config.sh
  source $script_dir/nerd_fonts.sh
  source $script_dir/rofi/rofi_config.sh

  aur
  font_im
  waybar_config
  hypr_config
  nerd_fonts
  rofi_config

}
