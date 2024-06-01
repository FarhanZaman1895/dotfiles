# My ZSHRC
# Farhan Zaman

# Disabled Features
unsetopt beep notify

# Vi Keybindings
bindkey -v

# Shell History
HISTFILE=~/.local/share/zshhistory
HISTSIZE=1000
SAVEHIST=1000

# Prompt
eval "$(starship init zsh)"

# Aliases
alias v="nvim"
alias vim="nvim"
alias sv="sudo nvim"
alias ls="exa -la --group-directories-first"
alias cat="bat"

# Exports
export EDITOR="nvim"

# Plugins

# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
export PATH=/home/fzaman/.local/bin:/home/fzaman/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
export PATH=/home/fzaman/.local/bin:/home/fzaman/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
