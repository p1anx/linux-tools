#!/bin/bash
function arm_toolchain_install() {
  sudo apt install wget -y
  sudo apt install cmake ninja-build clang-tools -y
  wget https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi.tar.xz
  tar xf arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi.tar.xz
  sudo cp -r arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi /usr/local/arm-gnu-toolchain
  sudo rm -rf arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi.tar.xz
  echo 'PATH=$PATH:/usr/local/arm-gnu-toolchain/bin' >>$HOME/.bashrc
  echo 'PATH=$PATH:/usr/local/arm-gnu-toolchain/bin' >>$HOME/.zshrc

}
function arm_toolchain() {
  arm_toolchain_install
  if [[ $? -eq 0 ]]; then
    echo "${GREEN}[${OK}] arm_toolchain install${RESET}"
  else
    echo "${RED}[${ERROR}] arm_toolchain install${RESET}"
    exit 1
  fi
}
