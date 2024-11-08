#!/bin/bash
function kitty_config() {
  local script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  if [ -d ~/.config/kitty ]; then
    rm -rf ~/.config/kitty
  else
    cp -r $script_dir/../kitty ~/.config
  fi

}
