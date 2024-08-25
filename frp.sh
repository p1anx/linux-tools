#!/bin/bash

wget -O frp.tar.gz "https://github.com/fatedier/frp/releases/download/v0.60.0/frp_0.60.0_linux_amd64.tar.gz"

tar -zxvf frp.tar.gz
sudo mv frp_0.60.0_linux_amd64 /usr/local/frp

FRP_SERVICE_DIR="/etc/systemd/system"
touch "$FRP_SERVICE_DIR"/frpc.service
tee -a "$FRP_SERVICE_DIR"/frpc.service << EOF
[Unit]
Descripton=FRP Server
After=network.target

[Service]
ExecStart=/usr/local/frpc/frpc -c /usr/local/frpc/frpc.toml
WorkingDirectory=/usr/local/frpc
Restart=always
Enviroment=PATH=/usr/bin:/usr/local/bin

[Install]
WantedBy=multi-usr.target

EOF
