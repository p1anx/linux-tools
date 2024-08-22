#!/bin/bash
#judge the system type
if grep -q "ubuntu" /etc/os-release; then
    OSType="ubuntu"
elif grep -q "rocky" /etc/os-release; then
    OSType="rocky"
elif grep -q "arch linux" /etc/os-release; then
    OSType="arch linux"
else
    echo "The system is not supported"
fi
# install docker for ubuntu
function docker_for_ubuntu(){

    sudo apt-get remove docker docker-engine docker.io -y
    sudo apt-get update
    sudo apt-get install apt-transport-https ca-certificates  curl gnupg lsb-release -y
    curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    # 官方源
    # $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # 官方源
    # echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
    sudo systemctl enable docker
    sudo systemctl start docker
    echo "==============================="
    echo "docker for ubuntu is installed"
    echo "==============================="
}

# install docker for rocky
function docker_for_rocky(){
    sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine -y
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
    sudo sed -i 's/download.docker.com/mirrors.aliyun.com\/docker-ce/g' /etc/yum.repos.d/docker-ce.repo
    sudo yum update
    sudo yum install docker-ce docker-ce-cli containerd.io -y
    sudo systemctl enable docker
    sudo systemctl start docker
    echo "==============================="
    echo "docker for rocky is installed"
    echo "==============================="

}
#according to ostype, install docker
case $OSType in
    "ubuntu")
        docker_for_ubuntu
        ;;
    "rocky")
        docker_for_rocky
        ;;
    *)
        echo "The system is not supported"
        exit
        ;;
esac
#config the proxy for docker

if [ ! -f "/etc/systemd/system/docker.service.d/http-proxy.conf" ]; then
  sudo mkdir -p /etc/systemd/system/docker.service.d
  sudo touch /etc/systemd/system/docker.service.d/http-proxy.conf
  sudo tee -a http-proxy.conf << EOF
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:10809/"
Environment="HTTPS_PROXY=http://127.0.0.1:10809/"
EOF
  echo "docker proxy is configured"
else
  echo "http-proxy.conf exist"
fi
sudo systemctl daemon-reload
sudo systemctl restart docker



