#!/bin/bash

#install nerd fonts
mkdir -p ~/.local/share/fonts

cd ~/.local/share/fonts && curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz

x JetBrainsMono.tar.xz

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Mononoki.tar.xz

x Mononoki.tar.xz

