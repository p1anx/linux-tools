#!/bin/bash
#install nerd fonts
function nerd_fonts() {
  local FONTS=("JetBrainsMono" "Mononoki" "FiraCode" "Meslo" "Ubuntu" "UbuntuMono" "Agave" "ComicShannsMono")

  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts

  if ! command -v curl >/dev/null 2>&1; then
    sudo apt install curl
  fi
  for font in "${FONTS[@]}"; do
    curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/"${font}".tar.xz
    tar -xf "${font}".tar.xz
    rm -rf "${font}".tar.xz
    echo "${OK} ${font} is installed${RESET}"
  done
}
