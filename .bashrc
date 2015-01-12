# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

ignoreeof=1

# PS1 for git repos
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# aliases
alias l='ls -l --color=auto'
alias la='ls -a --color=auto'
alias l.='ls -d .* --color=auto'

# perlbrew
__perlbrew_ps1()
{
    if hash perlbrew; then
        local v="$( perlbrew list | perl -lane'print $F[1] if /^\*/' )"
        if [[ -n "$v" ]]; then
            printf "${1:- (%s)}" $v
        fi
    fi
}
if [ -f ~/.perl5/perlbrew/etc/bashrc ]; then
    . ~/.perl5/perlbrew/etc/bashrc
    . ~/.perl5/perlbrew/etc/perlbrew-completion.bash
    PS1='[\u@\h$(__perlbrew_ps1) \W$(__git_ps1 " (%s)")]\$ '
fi

unset command_not_found_handle
