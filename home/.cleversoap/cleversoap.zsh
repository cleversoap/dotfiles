
# Root of scripts
CLEVERSOAP_ROOT=$HOME/.cleversoap

#-------------------------------------------------------------------------------

# Global functions to be used by all
source $CLEVERSOAP_ROOT/functions.zsh

# Env settings (eg. rbenv, pyenv, luaenv, etc...)
source $CLEVERSOAP_ROOT/env.zsh

# VIM Keybindings
export KEYTIMEOUT=10

bindkey -M vicmd 'gg' beginning-of-line
bindkey -M vicmd 'G' end-of-line
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line

bindkey -a '^y' redo
bindkey '^r' history-incremental-search-backward

bindkey -M viins 'jk' vi-cmd-mode

bindkey -M viins '^[[A' history-substring-search-up
bindkey -M viins '^[[B' history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
