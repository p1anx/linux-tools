#!/bin/bash 
function copyq(){
  local script_dir=$(dirname $(realpath $0))
  local copyq_dir="$HOME/.config/copyq"
  sudo apt install copyq -y

  if [ ! -f $copyq_dir ]; then
    mkdir -p $copyq_dir
  fi
  cp $script_dir/copyq.conf $copyq_dir
}
