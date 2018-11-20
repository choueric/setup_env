is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

gitst() {
  # "Nothing to see here, move along"
  is_in_git_repo || return

  local cmd="${FZF_CTRL_T_COMMAND:-"command git status -s"}"

  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" fzf -m "$@" | while read -r item; do
    printf '%q ' "$item" | cut -d " " -f 2
  done
  echo
}


gitbranch() {
  # "Nothing to see here, move along"
  is_in_git_repo || return

  local cmd="${FZF_CTRL_T_COMMAND:-"command git branch --no-color"}"

  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" fzf -m "$@" | while read -r item; do
  if [[ ${item:0:1} == "*" ]]; then
      echo "$item" | sed 's/^..//'
  else
      echo "$item"
  fi
  done
  echo
}

if [[ ! -o vi ]]; then
  # CTRL-G - list files of git status
  bind '"\C-g": " \C-u \C-a\C-k$(gitst)\e\C-e\C-y\C-a\C-y\ey\C-h\C-e\er \C-h"'

  # CTRL-L - list files of git branches
  bind '"\C-l": " \C-u \C-a\C-k$(gitbranch)\e\C-e\C-y\C-a\C-y\ey\C-h\C-e\er \C-h"'
else
  # CTRL-G - list files of git status
  bind '"\C-g": "\C-x\C-a$a \C-x\C-addi$(gitst)\C-x\C-e\C-x\C-a0Px$a \C-x\C-r\C-x\C-axa "'

  # CTRL-L - list files of git branches
  bind '"\C-l": "\C-x\C-a$a \C-x\C-addi$(gitbranch)\C-x\C-e\C-x\C-a0Px$a \C-x\C-r\C-x\C-axa "'
fi
