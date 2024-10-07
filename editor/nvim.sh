#!/bin/bash
function nvim_install() {
  #================================================
  # nvim and lazyvim
  #================================================
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
        sudo rm -rf /opt/nvim
        sudo tar -C /opt -xzf nvim-linux64.tar.gz

        echo "export PATH=$PATH:/opt/nvim-linux64/bin" >>~/.zshrc

  git clone https://github.com/LazyVim/starter ~/.config/nvim
}

function nvim() {
    if [ ! -e "/opt/nvim-linux64/bin/nvim" ]; then
    nvim_install
    else
    echo "[ok]nvim is install"
    fi

  if [ -e "nvim-linux64.tar.gz" ]; then
    sudo rm -rf nvim-linux64.tar.gz
    # echo "nvim-linux64.tar.gz is deleted"
  else
    echo "nvim-linux64 download is deleted"
  fi

  echo "=================================="
  echo "      neovim config done"
  echo "=================================="

}
