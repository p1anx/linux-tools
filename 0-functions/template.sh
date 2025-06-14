#!/bin/bash
function fcitx5_tmp() {
  fcitx5_install
  if [[ $? -eq 0 ]]; then
    echo "${GREEN}[${OK}] fcitx5 install${RESET}"
  else
    echo "${RED}[${ERROR}] fcitx5 install${RESET}"
    exit 1
  fi

  fcitx5_config
  if [[ $? -eq 0 ]]; then
    echo "${GREEN}[${OK}] fcitx5 config${RESET}"
  else
    echo "${RED}[${ERROR}] fcitx5 config${RESET}"
    exit 1
  fi
}
