#!/bin/bash
function fzf_install() {
  if grep -q "arch" /etc/os-release; then
    sudo pacman -S fzf --noconfirm
  else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
  fi
  return 0

}
function fzf_config() {
  if [ ! -f "$HOME/.zshrc" ]; then
    touch $HOME/.zshrc
  fi
  cat <<EOF | tee -a $HOME/.zshrc
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

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --margin=1 --padding=1"
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
# Set up fzf key bindings and fuzzy completion
# source <(fzf --zsh)
EOF
  return 0

}

function fzf() {
  fzf_install
  if [[ $? != 0 ]]; then
    echo "${ERROR} failed to install fzf${RESET}"
    exit 1
  fi
  echo "${OK} fzf install${RESET}"
  # fzf_config
  if [[ $? != 0 ]]; then
    echo "${ERROR} failed to confg fzf${RESET}"
    exit 1
  fi
  echo "${OK} fzf config${RESET}"
}
