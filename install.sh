#!/bin/bash

# 打印菜单并处理用户选择
function print_menu {
  local cols=3 # 设置列数
  local num_options=${#options[@]}
  local rows=$(((num_options + cols - 1) / cols))

  echo "请选择要安装的软件（使用空格选择多个）："

  for ((i = 0; i < rows; i++)); do
    line=""
    for ((j = 0; j < cols; j++)); do
      index=$((i + j * rows))
      if [ $index -lt $num_options ]; then
        line+="$(printf "%-20s" "$((index + 1))) ${options[$index]}")"
      fi
    done
    echo "$line"
  done

  read -rp "输入选择的数字（如：1 2 3）: " -a choices
}

function handle_selection {
  for choice in "${choices[@]}"; do
    case $choice in
    1)
      alacritty
      docker
      lazygit

      ;;
    2)
      alacritty
      ;;
    3)
      docker
      ;;
    4)
      lazygit
      ;;
    5)
      nerd_fonts
      ;;
    6)
      tmux
      ;;
    7)
      nvim
      ;;
    8)
      vim
      ;;
    9)
      fzf
      ;;
    10)
      zsh
      ;;
    11)
      miniconda
      ;;
    12)
      p10k
      ;;
    99)
      echo "退出脚本。"
      exit 0
      ;;
    *)
      echo "无效选择：$choice"
      ;;
    esac
  done
}

function main() {

  DIR="$(pwd)"
  options=("All install" "Alacritty" "Docker" "Git and Lazygit" "Nerd fonts"
    "tmux" "neovim" "vim" "fzf" "zsh" "miniconda" "退出")
  source "$DIR"/alacritty/alacritty.sh
  source "$DIR"/docker/docker.sh
  source "$DIR"/nerd_fonts.sh
  source "$DIR"/tmux/tmux.sh
  source "$DIR"/editor/nvim.sh
  source "$DIR"/editor/vim.sh
  source "$DIR"/terminal/fzf.sh
  source "$DIR"/python/miniconda.sh
  source "$DIR"/p10k/p10k.sh

  # 指定包含脚本的目录
  git_dir="$DIR/git"
  # 遍历并加载目录中的所有脚本文件
  for script in "$git_dir"/*.sh; do
    if [ -f "$script" ]; then
      echo "加载脚本: $script"
      source "$script"
    fi
  done

  print_menu
  # 处理用户选择的函数
  handle_selection
}
main