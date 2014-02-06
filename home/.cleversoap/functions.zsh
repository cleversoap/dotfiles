#---------------------------------------------------------------------[ SYSTEM ]

# Runs a subshell in a directory that will evaluate a string of commands.
function clever_exec_in {
    if [[ -d $1 ]]; then
        (cd $1 && eval ${2})
    else
        echo "Unable to find $1"
    fi
}

#-------------------------------------------------------------[ SOURCE CONTROL ]

# Returns a lowercase string of the type of repository for a directory.
function clever_repo_type {
    dir=${1:-$PWD}

    if [[ -d $dir ]]; then

        # git
        echo $dir
        (cd $dir && eval -- 'git rev-parse --is-in-working-tree')
        #echo $(clever_exec_in $dir 'git rev-parse --is-in-working-tree')

        # mercurial

        # subversion

        # Unknown
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
            echo "Updating a git repository"
            clever_exec_in $1 "git pull"
            ;;

        "mercurial")
            echo "Updating a mercurial repository"
            clever_exec_in $1 "hg pull && hg update"
            ;;

        "subversion")
            echo "Updating a subversion repository"
            clever_exec_in $1 "svn update"
            ;;

        *) 
            echo "Cannot find repository to update"
            return 1
            ;;

    esac

}
