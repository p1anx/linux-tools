#!/bin/bash

function fzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install

  te -a ~/.zshrc <<EOF
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
    -o -type d -print 2>/dev/null | fzf +m) &&
  cd "$dir"
}
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --margin=1 --padding=1"
EOF

  echo "===================="
  echo "fzf is installed"
  echo "===================="
}
