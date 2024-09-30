#!/bin/bash
# install docker for ubuntu
function docker_for_ubuntu() {

  sudo apt-get remove docker docker-engine docker.io -y
  sudo apt-get update
  sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
  curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  # 官方源
  # $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

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
function docker_for_rocky() {
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

#config the proxy for docker
function docker_proxy() {

  if [ ! -f "/etc/systemd/system/docker.service.d/http-proxy.conf" ]; then
    sudo mkdir -p /etc/systemd/system/docker.service.d
    sudo touch /etc/systemd/system/docker.service.d/http-proxy.conf
    sudo tee -a /etc/systemd/system/docker.service.d/http-proxy.conf <<EOF
  [Service]
  Environment="HTTP_PROXY=http://127.0.0.1:10809/"
  Environment="HTTPS_PROXY=http://127.0.0.1:10809/"
EOF
  else
    echo "http-proxy.conf exist"
  fi
  sudo systemctl daemon-reload
  sudo systemctl restart docker
  sudo docker run hello-world
  echo "=============================="
  echo "docker and proxy is configured"
  echo "=============================="

}
function docker_mirror() {
  if [ ! -f "/etc/docker/daemon.json" ]; then
    sudo touch /etc/docker/daemon.json
    sudo tee -a /etc/docker/daemon.json <<EOF
{
    "registry-mirrors": [
        "https://docker.m.daocloud.io",
        "https://docker.1panel.live",
        "https://hub.rat.dev"
    ]
}
EOF
  else
    echo "daemon.json exists"
  fi
  sudo systemctl daemon-reload
  sudo systemctl restart docker
  sudo docker run hello-world
  echo "=============================="
  echo "docker and mirror is configured"
  echo "=============================="

}

function docker() {

  # whether enable the proxy for docker
  echo "Do you want to set the proxy or mirror for docker?"
  echo "(1) proxy"
  echo "(2) mirror"
  local PROXY
  read -p "Enter the number 1 or 2: " PROXY
  # 检查docker命令是否存在
  if command -v docker &>/dev/null; then
    echo "Docker 已安装"

    # 检查Docker服务是否正常运行
    if systemctl is-active --quiet docker; then
      echo "Docker 服务正在运行"
      exit 0
    else
      echo "Docker 服务未运行"
      #judge the system type
      if grep -q "ubuntu" /etc/os-release; then
        docker_for_ubuntu
      elif grep -q "rocky" /etc/os-release; then
        docker_for_rocky
      else
        echo "The system is not supported"
        exit
      fi
    fi
  else
    echo "Docker 未安装"
    #judge the system type
    if grep -q "ubuntu" /etc/os-release; then
      docker_for_ubuntu
    elif grep -q "rocky" /etc/os-release; then
      docker_for_rocky
    else
      echo "The system is not supported"
      exit
    fi
  fi

  if [ $PROXY -eq 1 ]; then
    docker_proxy
  elif [ $PROXY -eq 2 ]; then
    docker_mirror
  else
    echo "please run the script to choose again"
    exit
  fi
  #for current user, add the docker group to run "docker" without "sudo"
  sudo groupadd docker
  sudo usermod -aG docker $USER # after, maybe need to login out
  newgrp docker
}
#=========================
#=========================
