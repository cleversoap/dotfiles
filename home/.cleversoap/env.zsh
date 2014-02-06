# This script loads all the environment managers
# clever@cleversoap.com

#------------------------------------------------------------------[ FUNCTIONS ]

# Generic function to check for existence of *env
# and perform necessary means of adding it to path
# and initialising
function clever_env {
    if [[ -d $HOME/.$1 ]]; then
        env_root=$HOME/.$1
        export $1:u_ROOT=$env_root
        export PATH=$env_root/bin:$PATH
        eval "$($1 init -)"
        unset env_root
    fi
}

# This function, when called, will update all the env
# functions and updaters
function clever_env_update {
    eval "env_root=\$$1:u_ROOT"
    
    if [[ -d $env_root ]]; then
        # Git update
    else
        echo "Unable to update $1 - cannot find $env_root"
    fi

    unset env_root
}

#-------------------------------------------------------------------------------

# rbenv
clever_env rbenv

# pyenv
clever_env pyenv

# luanv
clever_env luaenv

# jenv
clever_env jenv
