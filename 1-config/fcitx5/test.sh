#!/bin/bash
script_dir=$(dirname $(realpath $0))
function dir() {
  local script_dir0=$(dirname $(realpath $0))
  echo "$script_dir0"
}
echo "$script_dir"
dir
