#!/bin/bash
#if ! command -v yay > /dev/null 2>&1; then
#  echo "[error]yay is not installed, please install it"
#  exit 1
#fi
#yay -S sddm-theme-corners-git
git clone https://github.com/aczw/sddm-theme-corners.git ~/sddm-theme-corners
cd ~/sddm-theme-corners/
sudo cp -r corners/ /usr/share/sddm/themes/

if [ ! -d /etc/sddm.conf.d ]; then
  sudo mkdir -p /etc/sddm.conf.d
  sudo touch /etc/sddm.conf.d/theme.conf
fi
if [ ! -f /etc/sddm.conf.d/theme.conf ]; then
  sudo touch /etc/sddm.conf.d/theme.conf
fi
sudo tee /etc/sddm.conf.d/theme.conf << EOF
[Theme]
Current=corners
EOF
