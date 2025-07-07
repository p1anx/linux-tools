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
function rofi_install_from_source() {

  local ROFI_VERSION="1.7.9.1"
  sudo apt update
  sudo apt install -y build-essential meson ninja-build pkg-config \
    flex bison check libpango1.0-dev libcairo2-dev libglib2.0-dev \
    libgdk-pixbuf2.0-dev libstartup-notification0-dev \
    libxkbcommon-dev libxkbcommon-x11-dev \
    libxcb-util-dev libxcb-ewmh-dev libxcb-icccm4-dev \
    libxcb-cursor-dev libxcb-xinerama0-dev libxcb-randr0-dev \
    libxcb-xkb-dev libx11-xcb-dev xcb-proto \
    libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev \
    libwayland-dev wayland-protocols
  sudo apt install -y \
    libxcb-keysyms1-dev \
    libxcb-util0-dev \
    libxcb-icccm4-dev \
    libxcb-ewmh-dev \
    libxcb-cursor-dev \
    libxcb-xinerama0-dev \
    libxcb-xkb-dev \
    libxkbcommon-dev \
    libxkbcommon-x11-dev \
    libpango1.0-dev \
    libcairo2-dev \
    libglib2.0-dev \
    libgdk-pixbuf-2.0-dev \
    libstartup-notification0-dev \
    libwayland-dev \
    wayland-protocols
  wget https://github.com/davatorium/rofi/releases/download/1.7.9.1/rofi-"$ROFI_VERSION".tar.gz
  tar xf rofi-"$ROFI_VERSION".tar.gz
  cd rofi-"$ROFI_VERSION"
  meson setup build
  ninja -C build
  sudo ninja -C build install

}
function rofi_config() {
  git clone https://github.com/p1anx/rofi-themes.git
  cd rofi-themes || exit
  bash setup.sh
  cd .. && rm -rf rofi-themes
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
