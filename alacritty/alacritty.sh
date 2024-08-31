#!/bin/bash
local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function alacritty_install() {
  if grep -q "ubuntu" /etc/os-release; then
    sudo apt update
    sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
  elif grep -q "rocky" /etc/os-release; then
    sudo dnf update
    sudo dnf install cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel -y
    sudo dnf group install "Development Tools" -y
  else
    echo "The system is not supported"
    exit
  fi

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y
  source "$HOME/.cargo/env"

  local tmp_dir="$HOME/alacritty"
  # mkdir -p $tmp_dir
  git clone https://github.com/alacritty/alacritty.git $tmp_dir
  cd $tmp_dir

  cargo build --release

  #set desktop entry for alacritty
  sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
  sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
  sudo desktop-file-install extra/linux/Alacritty.desktop
  sudo update-desktop-database
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

function alacritty_config() {
  # change the icon of alacritty
  cd "$script_dir"
  sudo cp Alacritty.svg /usr/share/pixmaps/

  # set the configuration for alacritty
  mkdir -p ~/.config/alacritty/themes
  git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
  cp alacritty.toml ~/.config/alacritty/
  rm -rf $HOME/alacritty
}

function alacritty() {

  alacritty_install
  alacritty_config
  echo "=========================="
  echo "  alacritty is installed"
  echo "=========================="

}
