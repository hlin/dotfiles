# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

ignoreeof=1

# aliases
alias l='ls -l --color=auto'
alias la='ls -a --color=auto'
alias l.='ls -d .* --color=auto'

unset command_not_found_handle
