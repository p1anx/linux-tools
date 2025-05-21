# Feature


# usage
## Install 
1. pip install bypy, then author
use bypy download the config file of network
2. download the 'v2ray.sh' file
3. 'bash v2ray.sh'
  In v2ray.sh, 'zsh' and 'oh my zsh' will be install
# Installation
## docker
`bash docker.sh` to install docker


## frp
frp在物理机上可用，在虚拟机中不可用('frpc' is tested)

## bat
### for debian
```bash
sudo apt install bat -y
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```
and,
```bashrc
export PATH=$HOME/.local/bin:$PATH
```

# get directory of local script
```shell
local script_dir=$(dirname $(realpath $0))
```
