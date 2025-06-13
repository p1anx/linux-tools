#!/bin/bash
source $SHELL_BASIC/basic.sh
ALL_DIR=$(get_dir)
source $ALL_DIR/load_sh.sh

source $SHELL_BASIC/basic.sh

function load_scripts_all() {
  options=("default all") # 新增选项
  scripts=()              # 清空脚本数组
  functions=()            # 清空函数数组

  # 其他选项、脚本和函数的定义保持不变
  options+=("fcitx5 all")
  functions+=("fcitx5_all")

  options+=("fzf all")
  functions+=("fzf_all")
  # 加载所有脚本并定义函数
  # for script in "${scripts[@]}"; do
  #   #    echo "$INSTALL_DIR/$script"
  #   source "$INSTALL_DIR/$script"
  # done
}

function default_all() {
  # 定义需要加载的脚本和函数
  local partial_scripts=()
  local partial_functions=()

  # partial_scripts+=("fcitx5/fcitx5_install.sh")
  partial_functions+=("fcitx5_all")

  for i in "${!partial_functions[@]}"; do
    # script="${partial_scripts[$i]}"
    function_name="${partial_functions[$i]}"

    echo "加载脚本: $INSTALL_DIR/$script"
    # source "$INSTALL_DIR/$script"

    if [ -n "$function_name" ]; then
      echo "调用函数: $function_name"
      $function_name # 调用对应的函数
    fi
  done
}
function print_menu_all {
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

function handle_selection_all {
  for choice in "${choices[@]}"; do
    if [[ $choice =~ ^[0-9]+$ ]] && [ $choice -le ${#options[@]} ]; then
      if [ "$choice" -eq 1 ]; then
        # load_all_scripts # 调用加载所有脚本的函数
        default_all
      else
        function_name="${functions[$((choice - 2))]}"
        if [ -n "$function_name" ]; then
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

function main_all() {
  # INSTALL_DIR=$(get_dir)
  # echo "install $INSTALL_DIR"

  load_scripts_all
  print_menu_all
  handle_selection_all
}

# main_install
