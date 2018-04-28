# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend


# ---------------------------- zhs setup --------------------------------------------
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
set -o vi
PATH=$PATH:/sbin:/usr/sbin:$HOME/bin

# Use VIm as man pager
vman () {
    export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
                     vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
                     -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
		     -c 'set nonu' \
                     -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
    # invoke man page
    man $1
    # we muse unset the PAGER, so regular man pager is used afterwards
    unset PAGER
}
# ---------------------------- zhs setup --------------------------------------------

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\n\[\e[35;1m\][\u@\H]-\[\e[39;1m\]-\[\e[32;1m\][\t]\[\e[39;1m\]-\[\e[31;1m\][jobs:\j]\[\e[39;1m\]-\[\e[33;1m\][\w]\n\[\e[36;1m\][\!]-> \[\e[0m\]'
fi
unset color_prompt force_color_prompt

function git_branch {
   branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
   if [ "${branch}" != "" ];then
       if [ "${branch}" = "(no branch)" ];then
           branch="(`git rev-parse --short HEAD`...)"
       fi
	   echo "$branch"
   fi
}

PS1='\n\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;33m\]\h\[\e[0m\]|\[\e[1;32m\]\t\[\e[0m\]|\[\e[1;34m\]\j\[\e[0m\]|$(echo $?)\[\e[1;31m\] $(git_branch)\[\e[0m\] \[\e[1;34m\]\w\[\e[0m\]\n\[\e[1;46m\]-->\[\e[0m\] '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    eval "`dircolors -b`"
    alias ls='ls -F --color=always'
    alias ll='ls -l --color=always'
    alias la='ls -a --color=always'
    alias lt='ls -t --color=always | head'
    alias rm='rm -i '
    alias mv='mv -i'

    alias grep='grep --color=auto --exclude-dir=.git'
    alias fgrep='fgrep --color=auto --exclude-dir=.git'
    alias egrep='egrep --color=auto --exclude-dir=.git'

	alias less='less -r'
	alias diff='colordiff'
fi

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias less='less -N -R'
alias suredo='sudo !!'
alias dmesg='dmesg --human'
alias gotop='cd `git rev-parse --show-toplevel`'
alias hexdump='hexdump -C'
alias gcc='gcc -fdiagnostics-color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export KBDASHBOARD=$GOPATH/src/github.com/choueric/kbdashboard

source $HOME/.git-completion.bash
ulimit -c unlimited
export TMP=$HOME/tmp

case "$TERM" in
    xterm) export TERM=xterm-256color ;;
    screen) export TERM=screen-256color ;;
esac

export PATH=$HOME/usr/bin:$PATH
source $HOME/.workplacerc
