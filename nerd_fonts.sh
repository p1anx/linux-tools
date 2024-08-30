#!/bin/bash

#install nerd fonts
mkdir -p ~/.local/share/fonts

cd ~/.local/share/fonts && curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar -xJvf JetBrainsMono.tar.xz

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Mononoki.tar.xz
tar -xJvf Mononoki.tar.xz

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.tar.xz
tar -xJvf FiraCode.tar.xz
