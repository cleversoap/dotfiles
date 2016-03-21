# This script loads all the environment managers
# clever@cleversoap.com

#------------------------------------------------------------------[ FUNCTIONS ]

# Generic function to check for existence of *env
# and perform necessary means of adding it to path
# and initialising it. An optional build plugin can be
# passed as the second parameter so that it can be updated.
function clever_env {

    if [[ -d $HOME/.$1 ]]; then

        # Get the *env root
        local env_root=$HOME/.$1
        export ${1:u}_ROOT=$env_root
        export PATH=$env_root/bin:$PATH
        eval "$($1 init -)"
        export ENV_PATH=$env_root:$ENV_PATH

        # Get plugins associated with it and update them too
        if [[ -d $env_root/plugins ]]; then
            for plugin in $env_root/plugins/*; do
                export ENV_PLUGINS=$plugin:$ENV_PLUGINS
            done
        fi

    fi

}

# This function, when called, will update environments as well as all plugins
function clever_env_update {
    clever_exec_paths $ENV_PATH 'clever_repo_update .'
    clever_exec_paths $ENV_PLUGINS 'clever_repo_update .'
}

#-------------------------------------------------------------------------------

# Clear exported env variables
ENV_PATH=
ENV_PLUGINS=

# rbenv
clever_env rbenv

# pyenv
clever_env pyenv

if [[ -d $HOME/.pyenv/plugins/pyenv-virtualenv ]]; then
    eval "$(pyenv virtualenv-init -)"
fi

# luanv
clever_env luaenv

# nodenv
clever_env nodenv

# jenv
clever_env jenv

# Setup haxe
export HAXE_STD_PATH=/usr/local/lib/haxe/std
