#https://github.com/p1anx/linux-tools.git!/bin/bash
function rofi_config() {
  if ! command -v rofi >/dev/null 2>&1; then
    if grep -q "arch" /etc/os-release; then
      sudo pacman -S rofi-wayland
    fi
  fi

  if [ ! -d ~/.config/rofi ]; then
    mkdir ~/.config/rofi
  else
    mv ~/.config/rofi ~/.config/rofi.bak
    mkdir ~/.config/rofi
  fi
  local rofi_dir=$(pwd)
  echo "rofi dir is $rofi_dir"
  cp $rofi_dir/config.rasi ~/.config/rofi/
}
rofi_config
