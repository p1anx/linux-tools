#!/bin/bash
function p10k() {
  if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >>~/.zshrc
    echo 'source $ZSH/oh-my-zsh.sh' >>~/.zshrc
  else
    echo 'p10k error: you need to install "oh my zsh"'
  fi

}
