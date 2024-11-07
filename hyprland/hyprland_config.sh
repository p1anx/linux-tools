#!/bin/bash

function hyprland_config() {
  # 获取脚本文件所在的目录
  local script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  echo "hyprland_config.sh脚本所在的目录是: $script_dir"
  source $script_dir/aur/aur.sh
  source $script_dir/font_im/font_im.sh
  source $script_dir/waybar/waybar_config.sh
  source $script_dir/hypr/hypr_config.sh
  source $script_dir/../../nerd_fonts.sh
  source $script_dir/rofi/rofi_config.sh
  source $script_dir/sddm/sddm_config.sh
  source $script_dir/dunst/dunst_config.sh
  source $script_dir/foot/foot_config.sh

  aur
  font_im
  waybar_config
  hypr_config
  nerd_fonts
  rofi_config
  sddm_config
  dunst_config
  foot_config

}
