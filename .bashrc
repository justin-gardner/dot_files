#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="vim"

alias ls='ls --color=auto'
alias please="sudo" # for a wholesome Linux experience
PS1='\n\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:$PWD\n> '

alias ll='ls -l -a'
