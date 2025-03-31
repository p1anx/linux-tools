#!/bin/bash
function nvim_x86_64(){
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
        sudo rm -rf /opt/nvim
        sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
        if [ -f "$HOME/.zshrc" ]; then
          echo "export PATH=$PATH:/opt/nvim-linux-x86_64/bin" >>~/.zshrc
        fi
        if [ -f "$HOME/.bashrc" ]; then
          echo "export PATH=$PATH:/opt/nvim-linux-x86_64/bin" >>~/.bashrc
        fi
        if [ -f "$HOME/.config/fish/config.fish" ]; then
          echo "set PATH /opt/nvim-linux-x86_64/bin $PATH" >> "$HOME/.config/fish/config.fish"
        fi

}
function nvim_aarch64(){
    wget "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz"
    sudo rm -rf /opt/nvim-linux-arm64
    tar xzf nvim-linux-arm64.tar.gz
    sudo mv nvim-linux-arm64 /opt
    if [ -f "$HOME/.zshrc" ]; then
      echo "export PATH=$PATH:/opt/nvim-linux-arm64/bin" >>~/.zshrc
    fi
    if [ -f "$HOME/.bashrc" ]; then
      echo "export PATH=$PATH:/opt/nvim-linux-arm64/bin" >>~/.bashrc
    fi
}

function nvim_install() {
  #================================================
  # nvim and lazyvim
  #================================================
    local ARCH=$(uname -m)
    case "$ARCH" in 
      "x86_64")
        nvim_x86_64
        ;;
    "aarch64")
        nvim_aarch64
        ;;
      *)
        echo "the arch is not supported"
        ;;
    esac
}

function nvim() {

    if grep -q "arch" /etc/os-release; then
      sudo pacman -S neovim --noconfirm
    else
        nvim_install
    fi

  # git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim
  git clone https://github.com/p1anx/nvim-xwj.git ~/.config/nvim

  if [ -e "nvim-linux-x86_64.tar.gz" ]; then
    sudo rm -rf nvim-linux-x86_64.tar.gz
  elif [ -f "nvim-linux-arm64.tar.gz" ]; then
    sudo rm -rf nvim-linux-arm64.tar.gz
  fi

  echo "=================================="
  echo "      neovim config done"
  echo "=================================="

}
