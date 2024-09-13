#!/bin/bash

### 下载v2ray-core，并保存到tmp目录
#wget -O /tmp/v2ray-linux-64.zip https://ghproxy.net/https://github.com/v2fly/v2ray-core/releases/download/v5.13.0/v2ray-linux-64.zip
#
## 将其解压到/usr/local/v2ray-core， 需要root权限
#sudo unzip /tmp/v2ray-linux-64.zip -d /usr/local/v2ray-core
#
## 将.dat文件拷贝到/usr/local/share/v2ray/
#sudo mkdir -p /usr/local/share/v2ray/
#sudo mv /usr/local/v2ray-core/*dat /usr/local/share/v2ray/

# 下载debian安装包, 针对不同的硬件架构以下下载命令稍做调整即可.
# 所有安装包可以在这里找到https://github.com/v2rayA/v2rayA/releases/
wget -O /tmp/installer_debian_x64_2.2.4.6.deb https://ghproxy.net/https://github.com/v2rayA/v2rayA/releases/download/v2.2.4.6/installer_debian_x64_2.2.4.6.deb

# 安装v2rayA
sudo apt install /tmp/installer_debian_x64_2.2.4.6.deb
