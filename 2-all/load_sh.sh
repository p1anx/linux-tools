#!/bin/bash
source $G_MAIN_DIR/0-install/fcitx5/*.sh
source $G_MAIN_DIR/1-config/fcitx5/*.sh

source $G_MAIN_DIR/0-install/fzf/*.sh
source $G_MAIN_DIR/1-config/fzf/*.sh

function fcitx5_all() {
  fcitx5_install
  fcitx5_config
}
function fzf_all() {
  fzf_install
  fzf_config
}
