#!/bin/bash

function wlroots_install() {
  sudo apt update -y
  sudo apt install -y meson wayland-protocols libpcre2-dev libjson-c-dev libpango-1.0-0 libcairo2-dev wget libxcb-res0-dev
  # wlroots 完整构建依赖
  sudo apt install -y \
    build-essential \
    meson \
    ninja-build \
    pkg-config \
    libwayland-dev \
    wayland-protocols \
    libegl-dev \
    libgles2-mesa-dev \
    libgbm-dev \
    libinput-dev \
    libxkbcommon-dev \
    libdrm-dev \
    libpixman-1-dev \
    libseat-dev \
    libsystemd-dev \
    libxcb-composite0-dev \
    libxcb-xfixes0-dev \
    libxcb-present-dev \
    libxcb-dri3-dev \
    libxcb-randr0-dev \
    libxcb-xinput-dev \
    libvulkan-dev \
    libx11-xcb-dev \
    libxcb-icccm4-dev \
    libxcb-ewmh-dev \
    xwayland
  cd ~/build/wlroots-0.16.2
  meson setup build
  ninja -C build
  sudo ninja -C build install
}
function swayfx_install() {
  sudo apt update -y
  sudo apt install -y libpango1.0-dev
  cd ~/build/swayfx-0.3.2
  meson setup build
  ninja -C build
  sudo ninja -C build install
}

function sway_install() {
  mkdir ~/build
  cd ~/build # Or whatever you have named it
  # Downloading Wlroots
  wget https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.16.2/wlroots-0.16.2.tar.gz
  tar -xf wlroots-0.16.2.tar.gz
  rm wlroots-0.16.2.tar.gz

  # Downloaing Swayfx
  wget https://github.com/WillPower3309/swayfx/archive/refs/tags/0.3.2.tar.gz
  tar -xf 0.3.2.tar.gz
  rm 0.3.2.tar.gz

  wlroots_install
  swayfx_install
}
function sway_config() {
  local SCRIPT_DIR="$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)"
  mkdir $HOME/.config/sway
  cp $SCRIPT_DIR/config/config $HOME/.config/sway/config

}
function swayfx() {
  sway_install
  sway_config
}
