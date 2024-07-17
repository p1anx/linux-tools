#!/bin/bash

sudo apt update

sudo apt install curl -y
# ********************************************
# git config
sudo apt install git -y

git config --global user.name "xwj"
git config --global user.mail 2514034568@qq.com

# ********************************************
# zsh
sudo apt install zsh -y

sh -c "$(curl -fsSL https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo 'ZSH_THEME="bira"' >>.zshrc
echo "plugins=(git z extract web-search zsh-syntax-highlighting zsh-autosuggestions)" >>.zshrc
source $ZSH/oh-my-zsh.sh

# ********************************************
#install nerd fonts
mkdir -p ~/.local/share/fonts

cd ~/.local/share/fonts && curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz

x JetBrainsMono.tar.xz

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Mononoki.tar.xz

x Mononoki.tar.xz

# ********************************************
# vim
sudo apt install vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# ********************************************
# nvim and lazyvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >>~/.zshrc

source ~/.zshrc

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim

# ********************************************
# ssh
sudo apt install openssh-server -y
sudo /etc/init.d/ssh start
ssh-keygen -t rsa #-t表示类型选项，这里采用rsa加密算法
# ssh-copy-id ldz@192.168.0.1 #使用ssh-copy-id命令将公钥复制到远程主机

# ********************************************
# pythoh and pip
sudo add-apt-repository ppa:deadsnakes/ppasudo
sudo apt update
sudo apt install python3.12 -y

sudo apt install python3-pip -y

# ********************************************
# sublime-text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg >/dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# node and npm
sudo apt install nodejs -y
sudo apt install npm -y
