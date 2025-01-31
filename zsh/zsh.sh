#!/bin/bash
function oh_my_zsh() {
  local proxy_check=$(env | grep proxy)
  if ! echo "$proxy_check" | grep -q "proxy"; then
    echo "=======please open proxy========"
  fi
  # sh -c "$(curl -fsSL https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh)" --unattended
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  sudo tee -a $HOME/.zshrc <<EOF
# source /etc/profile
#source ~/.bashrc
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
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --margin=1 --padding=1"
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
alias timeshift="sudo WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR timeshift-gtk"

EOF
  if [ -f "$HOME/.zshrc" ]; then
    echo 'ZSH_THEME="bira"' >>$HOME/.zshrc
    echo 'plugins=(git z extract web-search zsh-syntax-highlighting zsh-autosuggestions)' >>$HOME/.zshrc
    echo 'source $ZSH/oh-my-zsh.sh' >>$HOME/.zshrc
    echo 'alias sz="source $HOME/.zshrc"' >>$HOME/.zshrc
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
  elif grep -q "arch" /etc/os-release; then
    sudo pacman -S zsh curl --noconfirm
  else
    echo "[error]The system is not supported"
    exit 1
  fi
  oh_my_zsh
}
