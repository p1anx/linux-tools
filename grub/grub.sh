#!/bin/bash

function grub() {
  local script_dir=$(dirname $(realpath $0))
  cd "$script_dir"
  wget https://github.com/p1anx/linux-tools/releases/download/grub-theme/Elegant-wave-window-grub-themes.tar.xz
  tar -xf $script_dir/Elegant-wave-window-grub-themes.tar.xz
  # cd "$script_dir/Elegant-wave-window-grub-themes/left-dark-4k"
  cd "$script_dir/Elegant-wave-window-grub-themes/left-dark-1080p"
  sudo bash install.sh
}
