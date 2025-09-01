#!/bin/bash
ARM_TOOLCHAIN="arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi"
arm_toolchain_debian_install() {
  sudo apt install wget -y
  sudo apt install cmake ninja-build clang-tools -y

}

arm_toolchain_arch_install() {
  sudo pacman -S --noconfirm wget cmake ninja clang
}

arm_toolchain_install() {
  echo "Installing arm toolchain $ARM_TOOLCHAIN"
  echo ""
  wget https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi.tar.xz
  sudo tar xf $ARM_TOOLCHAIN.tar.xz -C /usr/local/
  sudo rm $ARM_TOOLCHAIN.tar.xz
  if [[ -f $HOME/.zshrc ]]; then
    echo "PATH=\$PATH:/usr/local/$ARM_TOOLCHAIN/bin" >>$HOME/.zshrc
    echo "[ok] write PATH to .zshrc"
  fi
  if [[ -f $HOME/.bashrc ]]; then
    echo "PATH=\$PATH:/usr/local/$ARM_TOOLCHAIN/bin" >>$HOME/.bashrc
    echo "[ok] write PATH to .bashrc"
  fi
  if [[ -f $HOME/.config/fish/config.fish ]]; then
    echo "set -g PATH \$PATH /usr/local/$ARM_TOOLCHAIN/bin" >>$HOME/.config/fish/config.fish
    echo "[ok] write PATH to config.fish"
  fi
}
arm_toolchain() {
  if grep -q "debian" /etc/os-release; then
    arm_toolchain_debian_install
  elif grep -q "arch" /etc/os-release; then
    arm_toolchain_arch_install
  fi
  arm_toolchain_install
  if [[ $? -eq 0 ]]; then
    echo "${GREEN}[${OK}] arm_toolchain install${RESET}"
  else
    echo "${RED}[${ERROR}] arm_toolchain install${RESET}"
    exit 1
  fi
}
