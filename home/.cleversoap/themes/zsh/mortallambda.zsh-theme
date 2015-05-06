function my_git_prompt() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return

  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""

  # is branch ahead?
  if $(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi

  # is anything staged?
  if $(echo "$INDEX" | command grep -E -e '^(D[ M]|[MARC][ MD]) ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi

  # is anything unstaged?
  if $(echo "$INDEX" | command grep -E -e '^[ MARC][MD] ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi

  # is anything untracked?
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi

  # is anything unmerged?
  if $(echo "$INDEX" | command grep -E -e '^(A[AU]|D[DU]|U[ADU]) ' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi

  if [[ -n $STATUS ]]; then
    STATUS=" $STATUS"
  fi

  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(my_current_branch)$STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function my_current_branch() {
  echo $(current_branch || echo "(no branch)")
}

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[red]%}(ssh) "
  fi
}

# Runtime versions
function _zsh_python_version {
    python -V 2>&1 | sed -e 's/Python //'
}

function _zsh_node_version {
    node --version | sed 's/v//g'
}

function _zsh_ruby_version {
    ruby --version | grep -o "ruby \([0-9]\.*\)\{1,3\}" --color=never | sed 's/ruby //g'
}

function _zsh_java_version {
    java -version 2>&1 | grep -o 'version "[^"-]*' --color=never | sed 's/version "//g; s/.0_/u/g'
}

# Runtime status lines
function _zsh_python_status {
    echo -n "%{$fg[yellow]%}$(basename $VIRTUAL_ENV 2>/dev/null) ⚕ $(_zsh_python_version)%{$reset_color%}"
}

function _zsh_node_status {
    echo -n "%{$fg[green]%}⬡ $(_zsh_node_version)%{$reset_color%}"
}

function _zsh_ruby_status {
    echo -n "%{$fg[red]%}♦ $(_zsh_ruby_version)%{$reset_color%}"
}

function _zsh_java_status {
    echo -n "%{$fg[blue]%}☕  $(_zsh_java_version)%{$reset_color%}"
}

local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})%?%{$reset_color%}"
PROMPT=$'\n$(ssh_connection)%{$fg_bold[green]%}%n@%m%{$reset_color%}$(my_git_prompt) : %~\n[${ret_status}] λ '

ZSH_THEME_PROMPT_RETURNCODE_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_PREFIX=" $fg[white]‹ %{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[magenta]%}↑"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[red]%}●"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[white]%}●"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}✕"
ZSH_THEME_GIT_PROMPT_SUFFIX=" $fg_bold[white]›%{$reset_color%}"

RPROMPT='$(_zsh_python_status) $(_zsh_node_status) $(_zsh_ruby_status) $(_zsh_java_status)'
