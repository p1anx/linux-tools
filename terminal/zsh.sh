#!/bin/bash
function oh_my_zsh() {
  local proxy_check=$(env | grep proxy)
  if ! echo "$proxy_check" | grep -q "proxy"; then
    echo "=======please open proxy========"
  fi
  sh -c "$(curl -fsSL https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  sudo tee -a ~/.zshrc <<EOF
function von(){
  export http_proxy="http://127.0.0.1:10809"
  export https_proxy="http://127.0.0.1:10809"
  echo "v2ray proxy is ON"
}

function voff(){
  unset https_proxy
  unset http_proxy
  echo "v2ray proxy is OFF"
}
EOF
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

function zsh() {

  if grep -q "ubuntu" /etc/os-release; then
    sudo apt install -y zsh
    sudo apt install -y curl
  elif grep -q "rocky" /etc/os-release; then
    sudo yum install -y util-linux-user # it's useful for "chsh" command in oh my zsh
    sudo yum install -y zsh
  else
    echo "The system is not supported"
    exit
  fi
  oh_my_zsh
}
