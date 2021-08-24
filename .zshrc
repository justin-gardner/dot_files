# Path to your oh-my-zsh installation.
export ZSH="/Users/jgardner/.oh-my-zsh"

# Theme to load
ZSH_THEME="strug"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# List of plugins to load
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Aliases
alias ll="ls -la"
alias please="sudo"
