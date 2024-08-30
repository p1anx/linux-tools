#!/bin/bash
mkdir -p "$HOME"/oh_my_tmux
OH_MY_TMUX_DIR="$HOME/oh_my_tmux"
git clone https://github.com/p1anx/.tmux.git $OH_MY_TMUX_DIR
mkdir -p ~/.config/tmux
ln -s $OH_MY_TMUX_DIR/.tmux.conf ~/.config/tmux/tmux.conf
cp $OH_MY_TMUX_DIR/.tmux.conf.local ~/.config/tmux/tmux.conf.local
