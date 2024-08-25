#!/bin/bash

echo "Which is you want to install and config:"
echo "(1) frp client"
echo "(2) frp server"
read -p "To choose the option, enter 1 or 2" FRP

function frp_client(){
    read -p "input the frp server's IP:" FRP_SERVER_IP
    read -p "input the frp's remotePort:6000-6100" REMOTE_PORT
    wget -O frp.tar.gz "https://github.com/fatedier/frp/releases/download/v0.60.0/frp_0.60.0_linux_amd64.tar.gz"

    tar -zxvf frp.tar.gz
    sudo mv frp_0.60.0_linux_amd64 /usr/local/frpc
    tee frpc.toml << EOF
serverAddr = "$FRP_SERVER_IP"
serverPort = 7000

[[proxies]]
name = "ssh"
type = "tcp"
localIP = "127.0.0.1"
localPort = 22
remotePort = $REMOTE_PORT


EOF

    FRP_SERVICE_DIR="/etc/systemd/system"
    touch "$FRP_SERVICE_DIR"/frpc.service
    tee -a "$FRP_SERVICE_DIR"/frpc.service << EOF
[Unit]
Descripton=FRP Client
After=network.target

[Service]
ExecStart=/usr/local/frpc/frpc -c /usr/local/frpc/frpc.toml
WorkingDirectory=/usr/local/frpc
Restart=always
Enviroment=PATH=/usr/bin:/usr/local/bin

[Install]
WantedBy=multi-usr.target

EOF
sudo systemctl daemon-reload
sudo systemctl start frpc
}

function frp_server(){
    wget -O frp.tar.gz "https://github.com/fatedier/frp/releases/download/v0.60.0/frp_0.60.0_linux_amd64.tar.gz"

    tar -zxvf frp.tar.gz
    sudo mv frp_0.60.0_linux_amd64 /usr/local/frps

    FRP_SERVICE_DIR="/etc/systemd/system"
    touch "$FRP_SERVICE_DIR"/frps.service
    tee -a "$FRP_SERVICE_DIR"/frps.service << EOF
[Unit]
Descripton=FRP Server
After=network.target

[Service]
ExecStart=/usr/local/frps/frps -c /usr/local/frps/frps.toml
WorkingDirectory=/usr/local/frps
Restart=always
Enviroment=PATH=/usr/bin:/usr/local/bin

[Install]
WantedBy=multi-usr.target

EOF

sudo systemctl daemon-reload
sudo systemctl start frps
}

if [ $FRP -eq 1 ]; then
    frp_client

elif [ $FRP -eq 2 ]; then
    frp_server

else
    echo "restart the script,please enter 1 or 2 "
fi
