#!/bin/bash

function wezterm_install() {
  curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
  echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
  sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
  sudo apt update -y
  sudo apt install wezterm -y
}

function wezterm_config() {
  # On Windows and Unix systems
  git clone https://github.com/KevinSilvester/wezterm-config.git ~/.config/wezterm
}

function wezterm() {
  wezterm_install
  if [[ $? -eq 0 ]]; then
    echo "${GREEN}[${OK}] wezterm install${RESET}"
  else
    echo "${RED}[${ERROR}] wezterm install${RESET}"
    exit 1
  fi

  wezterm_config
  if [[ $? -eq 0 ]]; then
    echo "${GREEN}[${OK}] wezterm config${RESET}"
  else
    echo "${RED}[${ERROR}] wezterm config${RESET}"
    exit 1
  fi

}
