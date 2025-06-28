#!/bin/bash
function zsh_install() {
  if grep -q "ubuntu" /etc/os-release; then
    sudo apt install -y zsh
    sudo apt install -y curl
  elif grep -q "rocky" /etc/os-release; then
    sudo yum install -y util-linux-user # it's useful for "chsh" command in oh my zsh
    sudo yum install -y zsh
  elif grep -q "arch" /etc/os-release; then
    sudo pacman -S zsh curl --noconfirm
  else
    echo "${ERROR}The system is not supported${RESET}"
    exit 1
  fi
  # sh -c "$(curl -fsSL https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh)" --unattended
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  # for config zsh
  echo 'plugins=(git z extract web-search zsh-syntax-highlighting zsh-autosuggestions)' >>$HOME/.zshrc
  echo 'ZSH_THEME="ys"' >>$HOME/.zshrc
  echo 'source $HOME/.oh-my-zsh/oh-my-zsh.sh' >>$HOME/.zshrc
  echo 'alias sz="source $HOME/.zshrc"' >>$HOME/.zshrc
  sudo tee -a $HOME/.zshrc <<EOF
# source /etc/profile
#source ~/.bashrc
function pon(){
  export http_proxy="http://127.0.0.1:7890"
  export https_proxy="http://127.0.0.1:7890"
  echo "proxy is ON"
}

function poff(){
  unset https_proxy
  unset http_proxy
  echo "proxy is OFF"
}
EOF
}

function zsh() {
  zsh_install
}
