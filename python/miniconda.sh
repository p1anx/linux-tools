#!/bin/bash
conda_dir=~/miniconda3
if [ ! -e "$conda_dir" ]; then

    mkdir -p "$conda_dir"
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O "$conda_dir"/miniconda.sh
    bash "$conda_dir"/miniconda.sh -b -u -p "$conda_dir"
    rm -rf "$conda_dir"/miniconda.sh

    "$conda_dir"/bin/conda init bash
    "$conda_dir"/bin/conda init zsh
else
    echo "conda is already installed"
fi
#cancel "base"
conda config --set auto_activate_base false

echo "=================================="
echo "      conda setup done"
echo "=================================="

# mkdir -p ~/miniconda3
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
# bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
# rm -rf ~/miniconda3/miniconda.sh

# ~/miniconda3/bin/conda init bash
# ~/miniconda3/bin/conda init zsh
