ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="*%{$fg_bold[blue]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}*"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg[orange]%}"

local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%}%s)"

PROMPT=$'%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m%{$reset_color%}:%{$fg_no_bold[white]%}%~%{$reset_color%} $(git_prompt_info)\
${ret_status}%#>%{$reset_color%} '

theme_precmd()
{
    local remote_status=$(git_remote_status)
    if [[ -z "$remote_status" ]]; then
        local remote_status="%{$fg_bold[green]%}"
    fi
    ZSH_THEME_GIT_PROMPT_SUFFIX="${remote_status}*%{$fg_bold[blue]%}]%{$reset_color%}"
}

autoload -U add-zsh-hook
add-zsh-hook precmd theme_precmd
