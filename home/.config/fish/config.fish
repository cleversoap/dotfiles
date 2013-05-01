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

if test -d /usr/local/sbin
	set -x PATH /usr/local/sbin $PATH
end

# Autoconf
if test -d /usr/local/share/aclocal
	set -x PATH /usr/local/share/aclocal $PATH
end

# X11
if test -d /usr/X11R6/bin and test -d /opt/X11/bin
	set -x PATH /usr/X11R6/bin /opt/X11/bin $PATH
end

# Node executables
if test -d /usr/local/share/npm/bin
	set -x PATH /usr/local/share/npm/bin $PATH
end

# Flex Compilers
if test -d /usr/local/Cellar/flex_sdk/4.6.0.23201/libexec/bin
	set -x PATH /usr/local/Cellar/flex_sdk/4.6.0.23201/libexec/bin $PATH
end

# Ruby (RVM and Gems)
if test -d /usr/local/rvm/bin
	set -x PATH /usr/local/rvm/bin $PATH
end

# Fish
set -x PATH /usr/local/Cellar/fishfish/OpenBeta_r2/bin $PATH

