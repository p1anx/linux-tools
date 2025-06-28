#!/bin/bash
function rofi_install() {
  if [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
    if grep -q "ubuntu" /etc/os-release; then
      sudo apt update
      sudo apt install -y rofi
    elif grep -q "arch" /etc/os-release; then
      sudo pacman -S rofi --noconfirm
    else
      echo -e "${ERROR}rofi is not suitable for this system${RESET}"
    fi
  elif [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    if grep -q "arch" /etc/os-release; then
      sudo pacman -S rofi-wayland --noconfirm
    else
      echo -e "${ERROR}the system is not supported${RESET}"
    fi
  else
    echo -e "${ERROR}DE is not supported${RESET}"
  fi
  return 0
}
function rofi_config() {
  git clone https://github.com/p1anx/rofi-themes.git $HOME/rofi-themes
  bash $HOME/rofi-themes/setup.sh
  rm -rf $HOME/rofi-themes
  return 0

}
function rofi() {
  sudo apt install rofi -y
  # rofi_install
  if [[ $? != 0 ]]; then
    echo "${ERROR}rofi install${RESET}"
  fi
  rofi_config
  if [[ $? != 0 ]]; then
    echo "${ERROR}rofi config${RESET}"
  fi
}
# cp themes/rounded-common.rasi themes/rounded-nord-dark.rasi ~/.local/share/rofi/themes/
# function rofi_default() {
#   sudo apt update
#   sudo apt install -y rofi
#   mkdir -p ~/.config/rofi
#   rofi -dump-config >~/.config/rofi/config.rasi
#
#   git clone https://github.com/lr-tech/rofi-themes-collection.git
#   cd rofi-themes-collection
#   mkdir -p ~/.local/share/rofi/themes/
#   cp * ~/.local/share/rofi/themes/
# }
