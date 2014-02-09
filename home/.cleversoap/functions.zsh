#---------------------------------------------------------------------[ SYSTEM ]

# Runs a subshell in a directory that will evaluate a string of commands.
function clever_exec_in {
    if [[ -d $1 ]]; then
        (cd $1 && eval ${2})
    else
        echo "Unable to find $1"
    fi
}

# Takes a colon (:) delimited string of paths and executes a command
# on each of them.
function clever_exec_paths {

    a=(${=${(s/:/)1}})
    
    for i in $a; do
        echo clever_exec_in $i \'${2}\'
        clever_exec_in $i ${2}
    done

}

#-------------------------------------------------------------[ SOURCE CONTROL ]

# Returns a lowercase string of the type of repository for a directory.
function clever_repo_type {
    dir=${1:-$PWD}

    if [[ -d $dir ]]; then

        # git
        if [[ $(clever_exec_in $dir 'git rev-parse --is-inside-work-tree 2> /dev/null') = 'true' ]]; then
            echo 'git'
            return 0
        fi

        # mercurial
        # NB: Tested with the cpython repo (mercurial) inside of pyenv (git)
        # and it turned out that git was reported. May need additional
        # logic to handle this edge case.
        hg --cwd $dir root &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo 'mercurial'
            return 0
        fi

        # subversion
        svn info $dir &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo 'subversion'
            return 0
        fi

        # Unknown
        echo "unknown"
        return 1
        
    else
        echo "Unable to find $dir"
        return 1
    fi
}

# This function will perform an update of a repository in a directory
# regardless of the type of repository it is
function clever_repo_update {

    case $(clever_repo_type $1) in

        "git")
            clever_exec_in $1 "git pull"
            ;;

        "mercurial")
            clever_exec_in $1 "hg pull && hg update"
            ;;

        "subversion")
            clever_exec_in $1 "svn update"
            ;;

        *) 
            echo "Cannot find repository to update"
            return 1
            ;;

    esac

}
