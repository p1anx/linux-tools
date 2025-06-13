#!/bin/bash
G_MAIN_DIR=$(dirname $(realpath $0))
source $G_MAIN_DIR/shell_scripts/basic.sh
source $G_MAIN_DIR/0-install/install.sh
source $G_MAIN_DIR/1-config/config.sh
source $G_MAIN_DIR/2-all/all.sh
test_dir=$(get_dir)
echo "main dir $test_dir"

function show_help() {
  echo "Usage: $0 [options]"
  echo "Options:"
  echo "  -h, --help     Show this help"
  echo "  -a, --all      Install and Config"
  echo "  -i install     For Install"
  echo "  -c config      For Config"
}
# 解析参数
if [[ "$#" -gt 0 ]]; then
  case $1 in
  -h | --help)
    show_help
    ;;
  -v | --version)
    echo "v1.0.0"
    exit 0
    ;;
  -a | --all)
    main_all
    ;;
  -i | --install)
    echo "run install function"
    main_install
    # if [ -n "$2" ]; then #-n mean non-empty
    #   FILE="$2"
    #   shift
    # else
    #   echo "错误: --file 需要参数值" >&2
    #   exit 1
    # fi
    ;;
  *)
    echo "未知参数: $1" >&2
    show_help
    exit 1
    ;;
  esac
  echo "${GREEN}It's completed!!!${RESET}"
  # shift
fi
