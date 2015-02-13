local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%}%s)"

PROMPT=$'%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m%{$reset_color%}:%{$fg[white]%}%~%{$reset_color%} $(git_prompt_info)\
${ret_status}%#>%{$reset_color%} '

local default_color="%{$fg[blue]%}"
local remote_status=$(git_remote_status)
if [ -z "${remote_status}" ]; then
    local remote_status="%{$fg[green]%}"
fi

ZSH_THEME_GIT_PROMPT_PREFIX="${default_color}["
ZSH_THEME_GIT_PROMPT_SUFFIX="*${default_color}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*${remote_status}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}*${remote_status}"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg[orange]%}"
