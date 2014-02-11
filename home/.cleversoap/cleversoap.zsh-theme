# ZSH Theme

# User name - no host for sake of simplicity
# as I know the host I am on
local prompt_user="[%{$terminfo[bold]$fg[white]%}%n$reset_color%}]"

# Full directory - takes up the rest of the top line
local prompt_dir="%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}"

# Last command status - if failure then turn red and show exit code
function prompt_status {

    local arrow='▸'
    local colour='green'

    if [[ $RETVAL -ne 0 ]]; then
        colour='red'
        arrow="[$RETVAL]${arrow}"
    fi

    echo -n "%{$terminfo[bold]$fg[${colour}]${arrow}%{$reset_color%}"
}

# Git branch and change status
# Only shown IF there is a git branch
function prompt_git {
    if $(git rev-parse --is-inside-work-tree > /dev/null 2>&1); then
        
        local dirty=$(parse_git_dirty)
        local ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
        #ref="${ref/refs\/heads\//± }"

        local colour='green'

        if [[ -n $dirty ]]; then
            colour='yellow'
        fi            

        echo -n "[${ref/refs\/heads\//$fg[$colour]± }%{$reset_color%}]"

    fi
}

# Builds and stores the variables for the prompt
function build_prompt {
    RETVAL=$?
    echo ╭─$prompt_user $prompt_dir
    echo -n ╰─
    prompt_git
    prompt_status
    echo "%{$reset_color%} "

}


PROMPT='$(build_prompt)'
