#!/bin/bash
source $SHELL_BASIC/basic.sh
INSTALL_DIR=$(get_dir)
echo "install dir = $INSTALL_DIR"

function load_scripts_install() {
  options=()   # 新增选项
  scripts=()   # 清空脚本数组
  functions=() # 清空函数数组

  # 其他选项、脚本和函数的定义保持不变
  options+=("fcitx5")
  scripts+=("fcitx5/fcitx5_install.sh")
  functions+=("fcitx5_install")

  # 加载所有脚本并定义函数
  for script in "${scripts[@]}"; do
    #    echo "$INSTALL_DIR/$script"
    source "$INSTALL_DIR/$script"
  done
}

function print_menu_install {
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

function handle_selection_install {
  for choice in "${choices[@]}"; do
    if [[ $choice =~ ^[0-9]+$ ]] && [ $choice -le ${#options[@]} ]; then
      if [ "$choice" -eq 1 ]; then
        # load_all_scripts # 调用加载所有脚本的函数
        load_partial_scripts
      else
        script_name="${scripts[$((choice - 2))]}"
        function_name="${functions[$((choice - 2))]}"
        if [ -n "$script_name" ] && [ -n "$function_name" ]; then
          source "$INSTALL_DIR/$script_name"
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

function main_install() {
  # INSTALL_DIR=$(get_dir)
  # echo "install $INSTALL_DIR"

  load_scripts_install
  print_menu_install
  handle_selection_install
}

# main_install
