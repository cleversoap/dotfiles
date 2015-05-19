
# Root of scripts
CLEVERSOAP_ROOT=$HOME/.cleversoap

#-------------------------------------------------------------------------------

# Global functions to be used by all
source $CLEVERSOAP_ROOT/functions.zsh

# Env settings (eg. rbenv, pyenv, luaenv, etc...)
source $CLEVERSOAP_ROOT/env.zsh

# VIM Keybindings
typeset -A key
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

export KEYTIMEOUT=10
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a '^y' redo
bindkey '^r' history-incremental-search-backward
bindkey -M viins 'jk' vi-cmd-mode

bindkey -M viins '^[[A' history-substring-search-up
bindkey -M viins '^[[B' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
