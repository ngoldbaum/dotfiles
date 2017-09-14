function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function hg_repo {
    r=1
    d=.hg
    for i in $(seq 0 $(pwd|tr -cd '/'|wc -c)); do
        if [ -d "$d" ]; then
            r=0
        fi
        d=../$d
    done
    return r
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    if $(hg_repo)
    then
        echo '☿'
        return
    fi
    echo '○'
}

#function battery_charge {
#    echo `/usr/local/bin/batcharge.py` 2>/dev/null
#}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function hg_prompt_info {
    if $(hg_repo)
    then
        chg prompt --angle-brackets "\
< on %{$fg[magenta]%}<branch>%{$reset_color%}>\
< at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}\
< 📑  %{$fg[cyan]%}<bookmark>%{$reset_color%} >\
<patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
    fi
}


PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}$(git_prompt_info)$(hg_prompt_info)
$(virtualenv_info)$(prompt_char) '

#RPROMPT='$(battery_charge)'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
