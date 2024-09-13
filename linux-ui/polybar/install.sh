#!/bin/bash
sudo apt update
sudo apt install -y polybar

polybar_dir="$HOME/.config/polybar"
mkdir -p "$polybar_dir"
cp config.ini launch.sh "$polybar_dir"
