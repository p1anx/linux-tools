#!/bin/bash
function ssh_arch(){
    sudo pacman -S openssh
    sudo systemctl start sshd
    sudo systemctl enable sshd
}
function ssh_install(){
    if grep -q "ubuntu" /etc/os-release; then
        echo "waiting..."
    elif grep -q "arch" /etc/os-release; then
        ssh_arch
    else
        echo "ssh install failed"
    fi

}
