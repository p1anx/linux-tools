#!/bin/bash
if [ ! -f ~/.config/kitty/kitty.conf ]; then
  touch ~/.config/kitty/kitty.conf
fi
tee -a ~/.config/kitty/kitty.conf << EOF
font_family firacode nerd font 
font_size 12
background #282828

EOF
