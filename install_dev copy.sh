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
    if [[ $choice =~ ^[0-9]+$ ]] && [ $choice -le ${#options[@]} ]; then
      script_name="${scripts[$((choice - 1))]}"
      function_name="${functions[$((choice - 1))]}"
      if [ -n "$script_name" ] && [ -n "$function_name" ]; then
        source "$DIR/$script_name"
        $function_name  # 调用对应的函数
      else
        echo "无效选择：$choice"
      fi
    else
      echo "无效选择：$choice"
    fi
  done
}

function load_scripts {
  # 定义选项、对应的脚本和函数
  # options=("all install" "alacritty" "docker" "lazygit github" "nerd fonts"
  #          "tmux" "neovim" "vim" "fzf" "zsh" "miniconda"
  #          "p10k" "fastfetch" "source_cn" "frp" "sublime" "rofi")

  # scripts=("dependency.sh" "alacritty/alacritty.sh" "docker/docker.sh"
  #          "git/lazygit.sh" "nerd_fonts.sh" "tmux/tmux.sh"
  #          "editor/nvim.sh" "editor/vim.sh" "terminal/fzf.sh"
  #          "terminal/zsh.sh" "python/miniconda.sh" "p10k/p10k.sh"
  #          "terminal/fastfetch.sh" "source.sh" "network/frp.sh"
  #          "desktop/rofi/rofi.sh")

  # functions=("install_all" "install_alacritty" "install_docker"
  #            "install_lazygit" "nerd_fonts" "install_tmux"
  #            "install_nvim" "install_vim" "install_fzf"
  #            "install_zsh" "install_miniconda" "install_p10k"
  #            "install_fastfetch" "install_source_cn" "install_frp"
  #            "install_sublime" "install_rofi")

    options=("all install")
    scripts=("dependency.sh")
    functions=("install_all")

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

    # options+=("source")
    # scripts+=("source.sh")
    # functions+=("source")

    options+=("frp")
    scripts+=("network/frp.sh")
    functions+=("frp")

    options+=("rofi")
    scripts+=("desktop/rofi/rofi.sh")
    functions+=("rofi")

    # options+=("test")
    # scripts+=("t.sh")
    # functions+=("test")

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