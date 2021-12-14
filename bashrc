# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LANG=en_US.utf8

export EDITOR=vim

# Color support for less
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

alias ls='ls --color=auto'
alias l='ls -alh --color=auto'
alias grep='grep --color -n'
alias t='tree'
alias compile='gcc -Wall -Wextra -std=c99 -pedantic -Werror -g -fsanitize=address'
alias i3lock="i3lock -i $(wallpaper)"
alias untar='tar -xvf'
alias ta='tree -a -I .git'

PS1='\[\e[90m\][\[\e[36m\]\u \[\e[1;32m\]\W\[\e[0;90m\]]\[\e[35m\]\$\[\e[0m\]\[\e[97m\] '

term_size 14
