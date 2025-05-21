#!/bin/bash

function grub(){
  local script_dir=$(dirname $(realpath $0))
  tar -xf $script_dir/Elegant-wave-window-grub-themes.tar.xz
  cd "$script_dir/Elegant-wave-window-grub-themes/left-dark-4k"
  bash install.sh
}
