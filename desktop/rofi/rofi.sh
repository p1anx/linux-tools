#!/bin/bash
function rofi() {
    if [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
        if grep -q "ubuntu" /etc/os-release; then
          sudo apt update
          sudo apt install -y rofi
      else
            echo -e "\e[31m[error]\e[0mrofi is not suitable for this system"
        fi
    elif [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
        if grep -q "arch" /etc/os-release; then
            sudo pacman -S rofi-wayland --noconfirm
        else
            echo -e "\e[31m[error]\e[0mthe system is not supported"
        fi
    else
        echo -e "\e[31m[error]\e[0mDE is not supported"
    fi
  mkdir -p ~/.config/rofi
  rofi -dump-config >~/.config/rofi/config.rasi

  git clone https://github.com/lr-tech/rofi-themes-collection.git ~/rofi-themes-collection
  cd ~/rofi-themes-collection
  mkdir -p ~/.local/share/rofi/themes/
  cp * ~/.local/share/rofi/themes/
}
# cp themes/rounded-common.rasi themes/rounded-nord-dark.rasi ~/.local/share/rofi/themes/
function rofi_default() {
  sudo apt update
  sudo apt install -y rofi
  mkdir -p ~/.config/rofi
  rofi -dump-config >~/.config/rofi/config.rasi

  git clone https://github.com/lr-tech/rofi-themes-collection.git
  cd rofi-themes-collection
  mkdir -p ~/.local/share/rofi/themes/
  cp * ~/.local/share/rofi/themes/
}
