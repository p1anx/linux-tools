#!/bin/bash
function qemu(){

  sudo apt update -y
  sudo apt install qemu-kvm libvirt-daemon-system virt-manager virt-viewer virtinst bridge-utils -y
  sudo apt install libguestfs-tools -y
  sudo systemctl enable libvirtd.service
  sudo systemctl start libvirtd.service
  newgrp libvirt 
  sudo usermod -aG libvirt $USER
  sudo systemctl restart libvirtd.service
  # 临时启用 kvm_intel 嵌套虚拟化
  sudo modprobe -r kvm_intel
  sudo modprobe kvm_intel nested=1
  # 修改配置，永久启用嵌套虚拟化
  echo "options kvm-intel nested=1" | sudo tee /etc/modprobe.d/kvm-intel.conf
  cat /sys/module/kvm_intel/parameters/nested 
  echo "qemu is installed successfully"

}
