#!/bin/bash

function get_basic_dir() {
  echo "$(cd "$(dirname "${BASH_SOURCE[1]}")" >/dev/null 2>&1 && pwd)"
}
SHELL_BASIC=$(get_basic_dir)

# 使用tput定义颜色
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)
# # 使用示例
# echo "${GREEN}错误信息${RESET}"
# echo "${RED}成功信息${RESET}"

function get_dir() {
  echo "$(cd "$(dirname "${BASH_SOURCE[1]}")" >/dev/null 2>&1 && pwd)"
}

get_caller_dir() {
  local src="${BASH_SOURCE[1]}"
  while [ -h "$src" ]; do
    local dir="$(cd -P "$(dirname "$src")" >/dev/null 2>&1 && pwd)"
    src="$(readlink "$src")"
    [[ $src != /* ]] && src="$dir/$src"
  done
  echo "$(cd -P "$(dirname "$src")" >/dev/null 2>&1 && pwd)"
}
# SCRIPT_DIR=$(get_script_dir)
# echo "main 脚本目录: $SCRIPT_DIR"
