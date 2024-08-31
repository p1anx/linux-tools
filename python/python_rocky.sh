#!/bin/bash
# python
python_dir=$HOME/python

function python_setup(){

sudo dnf install gcc openssl-devel bzip2-devel libffi-devel wget tar make -y
mkdir $python_dir
cd $python_dir
wget https://www.python.org/ftp/python/3.12.4/Python-3.12.4.tar.xz
tar -xvJf Python-3.12.4.tar.xz

cd Python-3.12.4
# ./configure --enable-optimizations
./configure --prefix=/usr/local/python3
sudo make -j $(nproc)
sudo make altinstall

sudo dnf install -y python3.12-pip

sudo ln -s /usr/local/python3/bin/python3.12 /usr/local/bin/python
sudo ln -s /usr/local/python3/bin/pip3.12 /usr/local/bin/pip

echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
echo 'alias pip="pip3.12"' >> ~/.zshrc

}
if [ ! -e "/usr/local/python3/bin/python3.12" ]; then
    python_setup
else
    echo "python3.12 is already installed!"
fi

if [ -e "$python_dir" ]; then
    sudo rm -rf $python_dir
    echo "python dir is deleted"
else
    echo "python directory is deleted"
fi
echo "=================================="
echo "    python3.12 setup done!"
echo "=================================="