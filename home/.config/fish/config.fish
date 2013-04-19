set fish_git_dirty_color red
set fish_git_not_dirty_color green

function parse_git_branch
	set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
	set -l git_diff (git diff)

	if test -n "$git_diff"
		echo (set_color $fish_git_dirty_color)$branch(set_color normal)
	else
		echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
	end
end

function fish_prompt
	if test -d .git
		printf '%s%s%s@%s%s%s:%s$ ' (set_color purple) (whoami) (set_color normal) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)
	else
		printf '%s%s%s@%s%s%s$ ' (set_color purple) (whoami) (set_color normal) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
	end
end

set fish_greeting ""
set BROWSER 'open'
set -x CLICOLOR 1

# Set the PATH with basic control
# over directories that may or may not exist
# as not existing results in an error

# Global paths that should ALWAYS exist
set -x PATH /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# Autoconf
set -x PATH /usr/local/share/aclocal $PATH

# X11
set -x PATH /usr/X11R6/bin /opt/X11/bin $PATH

# Node executables
set -x PATH /usr/local/share/npm/bin $PATH

# Flex Compilers
set -x PATH /usr/local/Cellar/flex_sdk/4.6.0.23201/libexec/bin $PATH

# Ruby (RVM and Gems)
set -x PATH /usr/local/rvm/bin $PATH

# Fish
set -x PATH /usr/local/Cellar/fishfish/OpenBeta_r2/bin $PATH

