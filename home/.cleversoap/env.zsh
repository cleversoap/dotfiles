# This script loads all the environment managers
# clever@cleversoap.com

#------------------------------------------------------------------[ FUNCTIONS ]

# Generic function to check for existence of *env
# and perform necessary means of adding it to path
# and initialising it. An optional build plugin can be
# passed as the second parameter so that it can be updated.
function clever_env {

    if [[ -d $HOME/.$1 ]]; then

        local env_root=$HOME/.$1
        export $1:u_ROOT=$env_root
        export PATH=$env_root/bin:$PATH
        eval "$($1 init -)"
        export ENV_PATH=$env_root:$ENV_PATH

        if [[ ! -z $2 ]]; then
            export ENV_BUILD_PLUGIN_PATH=$env_root/plugins/$2:$ENV_BUILD_PLUGIN_PATH
        fi

    fi
}

# This function, when called, will update all the env
# functions and updaters
function clever_env_update {

    clever_exec_paths $ENV_PATH 'clever_repo_update .'
    clever_exec_paths $ENV_BUILD_PLUGIN_PATH 'clever_repo_update .'


#    a=(${=${(s/:/)ENV_PATH}})
#    
#    for i in $a; do
#        clever_repo_update ${i}
#    done
}

#-------------------------------------------------------------------------------

# Clear exported env variables
ENV_PATH=
ENV_BUILD_PLUGIN_PATH=

# rbenv
clever_env rbenv ruby-build

# pyenv
# NB: pyenv comes with python-build but we'll update it all the same
clever_env pyenv python-build

# luanv
clever_env luaenv lua-build

# nodenv
clever_env nodenv node-build

# jenv
clever_env jenv
