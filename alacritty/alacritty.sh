#!/bin/bash

DIR="$(pwd)"

function alacritty_install() {
  sudo apt update

  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source "$HOME/.cargo/env"

  git clone https://github.com/alacritty/alacritty.git $HOME
  cd $HOME/alacritty

  sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
  cargo build --release

  #set desktop entry for alacritty
  sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
  sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
  sudo desktop-file-install extra/linux/Alacritty.desktop
  sudo update-desktop-database

  rm -rf $HOME/alacritty
}

function alacritty_config() {
  # change the icon of alacritty
  cd "$DIR"
  sudo cp Alacritty.svg /usr/share/pixmaps/

  # set the configuration for alacritty
  mkdir -p ~/.config/alacritty/themes
  git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
  cp alacritty.toml ~/.config/alacritty/
}

function main() {

  alacritty_install
  alacritty_config
  echo "=========================="
  echo "  alacritty is installed"
  echo "=========================="

}

main
