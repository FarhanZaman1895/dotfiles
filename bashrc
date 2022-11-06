# My .bashrc file

# Environment Variables
EDITOR="nvim"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls -lAh --color=auto'
alias vim='nvim'
alias v='nvim'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias Syu='sudo pacman -Syu'

# VI MODE
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# Prompts
# PS1='[\w]\$ '
# Starship Prompt
eval "$(starship init bash)"

# Neofetch
neofetch
