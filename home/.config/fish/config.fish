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
set PATH /usr/local/bin /usr/local/sbin ~/bin /usr/local/share/npm/bin /usr/local/share/aclocal /opt/local/bin /opt/local/sbin /sbin /usr/local/Cellar/fishfish/OpenBeta_r2/bin /usr/X11R6/bin /usr/bin /bin /usr/sbin /sbin opt/X11/bin /usr/local/Cellar/flex_sdk/4.6.0.23201/libexec/bin /Users/mattclever/Code/depot_tools

