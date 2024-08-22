#!/bin/bash
if [ ! -f "/etc/systemd/system/docker.service.d/http-proxy.conf" ]; then
  sudo mkdir -p /etc/systemd/system/docker.service.d
  sudo touch /etc/systemd/system/docker.service.d/http-proxy.conf
  cat > http-proxy.conf << EOF
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
