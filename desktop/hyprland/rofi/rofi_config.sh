#https://github.com/p1anx/linux-tools.git!/bin/bash
function rofi_config() {
  if ! command -v rofi >/dev/null 2>&1; then
    if grep -q "arch" /etc/os-release; then
      sudo pacman -S rofi-wayland
    fi
  fi

  if [ ! -d ~/.config/rofi ]; then
    mkdir ~/.config/rofi
  else
    mv ~/.config/rofi ~/.config/rofi.bak
    mkdir ~/.config/rofi
  fi
  # 获取脚本文件所在的目录
  local script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  echo "脚本所在的目录是: $script_dir"
  cp $script_dir/config.rasi ~/.config/rofi/
}
