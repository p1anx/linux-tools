#!/bin/bash
function fish_ubuntu() {
  sudo apt-add-repository ppa:fish-shell/release-4 -y
  sudo apt update -y
  sudo apt install fish -y
}
function fish_fedora() {
  sudo dnf install epel-release -y
  sudo dnf update -y
  sudo dnf install fish -y
}
function fish_arch() {
  sudo pacman -Syy
  sudo pacman -S --noconfirm fish
}
function fish_config() {
  if [[ -f $HOME/.config/fish/config.fish ]]; then
    tee -a $HOME/.config/fish/config.fish <<EOF
    # Install fisher if it isn't already
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
EOF

  fi

}
# function fish_tools() {
# curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# if [[ $? != 0 ]]; then
#   echo "${ERROR} failed to install fisher${RESET}"
#   exit 1
# fi
# fisher install jorgebucaran/nvm.fish
# if [[ $? != 0 ]]; then
#   echo "${ERROR} failed to install nvm.fish${RESET}"
#   exit 1
# fi
# }

function fish() {
  if grep -q "debian" /etc/os-release; then
    fish_ubuntu
  elif grep -q "rocky" /etc/os-release; then
    fish_fedora
  elif grep -q "arch" /etc/os-release; then
    fish_arch
  else
    echo "${ERROR}The system is not supported${RESET}"
    exit 1
  fi
  fish_config
  # fish_tools
}
