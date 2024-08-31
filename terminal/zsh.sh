#!/bin/bash
function zsh_ubuntu() {

  #================================================
  # zsh for ubuntu
  #================================================
  source $HOME/.bashrc

  sudo apt install -y zsh
  sudo apt install -y curl
  local proxy_check=$(env | grep proxy)
  if ! echo "$proxy_check" | grep -q "proxy"; then
    echo "=======please open proxy========"
    pon
  fi
  sh -c "$(curl -fsSL https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  if [ -f "$HOME/.zshrc" ]; then
    echo 'ZSH_THEME="bira"' >>~/.zshrc
    echo 'plugins=(git z extract web-search zsh-syntax-highlighting zsh-autosuggestions)' >>~/.zshrc
    echo 'source $ZSH/oh-my-zsh.sh' >>~/.zshrc
    echo "zsh 已成功安装。"
  else
    echo "zsh install failed"
    exit 1
  fi
}
#================================================
# zsh for rocky
#================================================
function zsh_rocky() {

  source $HOME/.bashrc

  sudo yum install -y util-linux-user # it's useful for "chsh" command in oh my zsh
  sudo yum install -y zsh
  local proxy_check=$(env | grep proxy)
  if ! echo "$proxy_check" | grep -q "proxy"; then
    echo "=======please open proxy========"
    pon
  fi
  sh -c "$(curl -fsSL https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  if [ -f "$HOME/.zshrc" ]; then
    echo 'ZSH_THEME="bira"' >>~/.zshrc
    echo 'plugins=(git z extract web-search zsh-syntax-highlighting zsh-autosuggestions)' >>~/.zshrc
    echo 'source $ZSH/oh-my-zsh.sh' >>~/.zshrc
    echo "zsh 已成功安装。"
  else
    echo "zsh failed"
  fi
}
function zsh() {

  if grep -q "ubuntu" /etc/os-release; then
    zsh_ubuntu
  elif grep -q "rocky" /etc/os-release; then
    zsh_rocky
  else
    echo "The system is not supported"
    exit
  fi
}
