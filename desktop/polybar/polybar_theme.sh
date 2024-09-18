#!/bin/bash
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git ~/polybar-themes
cd ~/polybar-themes
chmod +x setup.sh
bash setup.sh

bash ~/.config/polybar/launch.sh --forest
