!#/bin/bash
function fzf_install() {
  if grep -q "arch" /etc/os-release; then
    sudo pacman -S fzf --noconfirm
  else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
  fi
  echo "${GREEN}[ok] fzf install${RESET}"

}
