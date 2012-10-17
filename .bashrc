# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

unset command_not_found_handle

ignoreeof=1

# PS1 for git repos
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# aliases
alias l='ls -l --color=auto'
alias la='ls -a --color=auto'
alias l.='ls -d .* --color=auto'

