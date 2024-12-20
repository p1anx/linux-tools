#!/bin/bash

function eza_install(){
  if command -v cargo >/dev/null; then
    cargo install eza
  else
    echo "you need to install cargo firstly, and install again"
    exit 1
  fi
  if [ -f "$HOME/.zshrc" ]; then
    tee -a $HOME/.zshrc <<EOF
alias ll='eza -l --icons --group-directories-first'
alias ls='eza -G --color=always --group-directories-first'
alias la='eza -al --icons --color=auto --group-directories-first'
EOF
  fi

}
