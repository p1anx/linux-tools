#!/bin/bash
sudo apt update
sudo install bspwm sxhkd -y
mkdir -p $HOME/.config/bspwm
mkdir -p $HOME/.config/sxhkd
sudo cp /usr/share/doc/bspwm/examples/bspwmrc $HOME/.config/bspwm/
sudo cp /usr/share/doc/bspwm/examples/sxhkdrc $HOME/.config/sxhkd/
