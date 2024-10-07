#!/bin/bash

function fzf() {
  #   tee -a ~/.zshrc <<EOF
  # fd() {
  #   local dir
  #   dir=$(find ${1:-.} -path '*/\.*' -prune \
  #     -o -type d -print 2>/dev/null | fzf +m) &&
  #   cd "$dir"
  # }
  # export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --margin=1 --padding=1"
  # EOF

  if command -v fzf > /dev/null 2>&1; then
      echo -e "\e[32m[ok]\e[0mfzf is installed"
      return 0
  else
      echo -e "\e[33m[note]\e[0mfzf is installing..."
  fi

  if grep -q "arch" /etc/os-release; then
      sudo pacman -S fzf --noconfirm
  else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  fi
  if [ -f "~/.zshrc" ]; then
      tee -a ~/.zshrc << EOF
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
    -o -type d -print 2>/dev/null | fzf +m) &&
  cd "$dir"
}

fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
# export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
# export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --margin=1 --padding=1"
EOF
    fi
  if [ -f "~/.bashrc" ]; then
      tee -a ~/.bashrc << EOF
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
    -o -type d -print 2>/dev/null | fzf +m) &&
  cd "$dir"
}

fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
# export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
# export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --margin=1 --padding=1"
EOF
    fi
  echo -e "\e[31m=======================================\e[0m"
  echo -e "****\e[31m[ok]\e[0mfzf is installed****"
  echo -e "\e[31m=======================================\e[0m"
}
