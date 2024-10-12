#!/bin/bash
if [ ! -d ~/.config/waybar ]; then
  mkdir -p ~/.config/waybar
fi

CWD="$(dirname "$(realpath "\$0")")"
cd "$CWD"
cp theme0/* ~/.config/waybar/
