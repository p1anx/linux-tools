#!/bin/bash

function github_ssh() {
  # 1. 设置 GitHub 用户名和邮箱
  GITHUB_USER="p1anx"
  GITHUB_EMAIL="2514034568@qq.com"

  # 2. 检查是否已存在 SSH 密钥
  SSH_KEY="$HOME/.ssh/id_rsa"
  if [ -f "$SSH_KEY" ]; then
    echo "SSH 密钥已存在：$SSH_KEY"
  else
    # 3. 生成 SSH 密钥对（跳过提示）
    echo "生成新的 SSH 密钥..."
    ssh-keygen -t rsa -b 4096 -C "$GITHUB_EMAIL" -N "" -f "$SSH_KEY"
  fi

  # 4. 启动 SSH 代理并添加密钥到代理
  eval "$(ssh-agent -s)"
  ssh-add "$SSH_KEY"

  # 5. 提取公钥
  PUB_KEY=$(cat "$SSH_KEY.pub")

  # 6. 上传公钥到 GitHub
  echo "正在上传公钥到 GitHub..."
  read -p "请输入 GitHub 的个人访问令牌（GitHub Token）： " GITHUB_TOKEN
  curl -u "$GITHUB_USER:$GITHUB_TOKEN" \
    -X POST \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/user/keys \
    -d "{\"title\":\"$(hostname)_$(date +%Y%m%d%H%M%S)\",\"key\":\"$PUB_KEY\"}"

  echo "SSH 密钥已成功上传到 GitHub。"

  # 7. 测试 SSH 连接
  echo "测试 SSH 连接..."
  ssh -T git@github.com

  echo "设置完成！"

}
