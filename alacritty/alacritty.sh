#!/bin/bash
local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function alacritty_install() {
  sudo apt update

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source "$HOME/.cargo/env"

  git clone https://github.com/alacritty/alacritty.git $HOME

  sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
  cargo build --release

  local tmp_dir="$HOME/alacritty"
  #set desktop entry for alacritty
  sudo cp "$tmp_dir"/target/release/alacritty /usr/local/bin # or anywhere else in $PATH
  sudo cp "$tmp_dir"/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
  sudo desktop-file-install "$tmp_dir"/extra/linux/Alacritty.desktop
  sudo update-desktop-database

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
