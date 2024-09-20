#!/bin/bash
#
function cmake_install_0(){
  sudo apt purge cmake -y
  VERSION=3.30.3
  sudo apt install -y libssl-dev
  wget "https://github.com/Kitware/CMake/releases/download/v$VERSION/cmake-$VERSION.tar.gz" -P $HOME/
  tar -zxvf $HOME/cmake-$VERSION.tar.gz -C $HOME/
  cd $HOME/cmake-$VERSION
  ./bootstrap

}

function cmake_install_1(){
  sudo apt purge cmake -y
  wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
  sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
  sudo apt-get update
  sudo apt install cmake
}
cmake_install_0
