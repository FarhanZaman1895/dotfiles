# My .bashrc file

# Environment Variables
EDITOR="nvim"
HOME="/home/fzaman"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls -gAh --group-directories-first --color=auto'
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

# Created by `pipx` on 2022-12-18 06:09:05
export PATH="$PATH:/home/fzaman/.local/bin"
