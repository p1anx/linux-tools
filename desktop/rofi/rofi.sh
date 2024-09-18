#!/bin/bash
function rofi() {
  sudo apt update
  sudo apt install -y rofi
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
