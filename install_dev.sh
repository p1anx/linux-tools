#!/bin/bash

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
    if [[ $choice =~ ^[0-9]+$ ]] && [ $choice -le ${#options[@]} ]; then
      if [ "$choice" -eq 1 ]; then
        # load_all_scripts # 调用加载所有脚本的函数
        load_partial_scripts
      else
        script_name="${scripts[$((choice - 1))]}"
        function_name="${functions[$((choice - 1))]}"
        if [ -n "$script_name" ] && [ -n "$function_name" ]; then
          source "$DIR/$script_name"
          $function_name # 调用对应的函数
        else
          echo "无效选择：$choice"
        fi
      fi
    else
      echo "无效选择：$choice"
    fi
  done
}

function load_all_scripts {
  for i in "${!scripts[@]}"; do
    script="${scripts[$i]}"
    function_name="${functions[$i]}"

    echo "加载脚本: $DIR/$script"
    source "$DIR/$script"

    if [ -n "$function_name" ]; then
      echo "调用函数: $function_name"
      $function_name # 调用对应的函数
    fi
  done
}

function load_partial_scripts {
  # 定义需要加载的脚本和函数
  local partial_scripts=("alacritty/alacritty.sh" "docker/docker.sh" "git/lazygit.sh")
  local partial_functions=("alacritty" "docker" "lazygit")

  for i in "${!partial_scripts[@]}"; do
    script="${partial_scripts[$i]}"
    function_name="${partial_functions[$i]}"

    echo "加载脚本: $DIR/$script"
    source "$DIR/$script"

    if [ -n "$function_name" ]; then
      echo "调用函数: $function_name"
      $function_name # 调用对应的函数
    fi
  done
}

function load_scripts {
  options=("加载所有脚本") # 新增选项
  scripts=()         # 清空脚本数组
  functions=()       # 清空函数数组

  # 其他选项、脚本和函数的定义保持不变
  options+=("alacritty")
  scripts+=("alacritty/alacritty.sh")
  functions+=("alacritty")

  options+=("nerd fonts")
  scripts+=("nerd_fonts.sh")
  functions+=("nerd_fonts")

  options+=("docker")
  scripts+=("docker/docker.sh")
  functions+=("docker")

  options+=("lazygit github")
  scripts+=("git/lazygit.sh")
  functions+=("lazygit")

  options+=("tmux")
  scripts+=("tmux/tmux.sh")
  functions+=("tmux")

  options+=("nvim")
  scripts+=("editor/nvim.sh")
  functions+=("nvim")

  options+=("vim")
  scripts+=("editor/vim.sh")
  functions+=("vim")

  options+=("fzf")
  scripts+=("terminal/fzf.sh")
  functions+=("fzf")

  options+=("zsh")
  scripts+=("terminal/zsh.sh")
  functions+=("zsh")

  options+=("miniconda")
  scripts+=("python/miniconda.sh")
  functions+=("miniconda")

  options+=("p10k")
  scripts+=("p10k/p10k.sh")
  functions+=("p10k")

  options+=("fastfetch")
  scripts+=("terminal/fastfetch.sh")
  functions+=("fastfetch")

  options+=("frp")
  scripts+=("network/frp.sh")
  functions+=("frp")

  options+=("rofi")
  scripts+=("desktop/rofi/rofi.sh")
  functions+=("rofi")

  # 加载所有脚本并定义函数
  for script in "${scripts[@]}"; do
    echo "$DIR/$script"
    source "$DIR/$script"
  done
}

function main {
  DIR="$(pwd)"

  load_scripts
  print_menu
  handle_selection
}

main
