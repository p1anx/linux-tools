#!/bin/bash 
function install_gtk3(){
  wget https://github.com/dracula/gtk/archive/master.zip
  unzip master.zip 
  sudo cp -r gtk-master /usr/share/themes/Dracula
  mkdir $HOME/.themes
  sudo cp -r gtk-master $HOME/.themes/Dracula 
  mkdir $HOME/.config/gtk-3.0
  mkdir $HOME/.config/gtk-4.0

  touch $HOME/.config/gtk-3.0/settings.ini
  tee -a $HOME/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-theme-name = Dracula
gtk-font-name = Sans 14
EOF
  cp $HOME/.themes/Dracula/assets $HOME/.config -r
  cp $HOME/.themes/Dracula/gtk-4.0/gtk.css $HOME/.config/gtk-4.0
  cp $HOME/.themes/Dracula/gtk-4.0/gtk-dark.css $HOME/.config/gtk-4.0
}
