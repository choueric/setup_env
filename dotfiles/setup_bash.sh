        RED="\[\033[0;31m\]"
     YELLOW="\[\033[0;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[0;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

# prompt
function git_branch {
   branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
   if [ "${branch}" != "" ];then
       if [ "${branch}" = "(no branch)" ];then
           branch="(`git rev-parse --short HEAD`...)"
       fi
	   echo "$branch "
   fi
}

# Set the full bash prompt.
function set_bash_prompt {
    _result=$?
    if test ${_result} -ne 0 ; then
        result=" ${RED}[err: ${_result}]${COLOR_NONE} "
    else
        result=" "
    fi
    local user='\[\e[1;32m\]\u\[\e[0m\]'
    local host='\[\e[1;33m\]\h\[\e[0m\]'
    local time='\[\e[1;32m\]\t\[\e[0m\]'
    local jobsnum='\[\e[1;34m\]\j\[\e[0m\]'
    local gitbranch='\[\e[1;31m\]$(git_branch)\[\e[0m\]'
    local path='\[\e[1;34m\]\w\[\e[0m\]'
    local prompt='\[\e[1;46m\]-->\[\e[0m\]'
    PS1="\n${user}@${host}|${time}|${jobsnum}${result}${gitbranch}${path}\n${prompt} "
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt

# alias
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias less='less -N -R'
alias suredo='sudo !!'
alias gotop='cd `git rev-parse --show-toplevel`'
alias hexdump='hexdump -C'
alias gcc='gcc -fdiagnostics-color=auto'
alias cat='bat --theme=zenburn'
alias minicom='minicom -c on'
alias grep='grep --color=auto --exclude-dir=.git -I'
alias fgrep='fgrep --color=auto --exclude-dir=.git'
alias egrep='egrep --color=auto --exclude-dir=.git'
alias ag="ag --color-match '1;31' --nobreak"
alias less='less -r'
alias diff='colordiff'
alias rm='trash -i '
alias mv='mv -i'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    eval "`dircolors -b`"
    alias ls='ls -F --color=always'
    alias ll='ls -l --color=always'
    alias la='ls -a --color=always'
    alias lt='ls -tl --color=always | head'
	# sudo apt install trash-cli
fi

# golang
export GOPATH=$HOME/usr/go
export PATH=$PATH:$GOPATH/bin
export KBDASHBOARD=$GOPATH/src/github.com/choueric/kbdashboard
export XGB=$GOPATH/src/github.com/choueric/xgb

# path
export PATH=$HOME/usr/bin:$PATH
export PATH=$HOME/workspace/flutter/bin:$PATH
export PATH=$HOME/android-studio/bin:$PATH
export PATH=$HOME/workspace/flutter/bin/cache/dart-sdk/bin:$PATH
export EDITOR=vim

# key map
if [ -e $HOME/.xmodmaprc ]; then
	xmodmap $HOME/.xmodmaprc
fi

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add an "alert" alias for long running commands. Use like so:
# $ sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# misc
source $HOME/.git-completion.bash
ulimit -c unlimited

case "$TERM" in
    xterm) export TERM=xterm-256color ;;
    screen) export TERM=screen-256color ;;
esac

