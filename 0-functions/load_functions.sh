#!/bin/bash
# load_functions.sh

# 防止重复加载
if [[ -n "$__FUNCTIONS_LOADED__" ]]; then
  return 0
fi
__FUNCTIONS_LOADED__=1

FUNCTIONS_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$FUNCTIONS_DIR/basic.sh"
# 加载脚本1
# source "$(dirname "${BASH_SOURCE[0]}")/fun/func1.sh"
# # 加载脚本2
# source "$(dirname "${BASH_SOURCE[0]}")/fun/func2.sh"

# 导出所有需要共享的函数
export -f get_dir
# export -f func2 get_dir
