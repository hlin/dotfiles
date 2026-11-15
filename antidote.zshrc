# Antidote zsh config
# Install Antidote
# git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

# Delete key
bindkey '^[[3~' delete-char

# Completion
zstyle ':completion:*' matcher-list \
  'm:{a-z}={A-Z}' \
  'r:|[._-]=* r:|=*' \
  'm:{a-z}={A-Z} l:|=* r:|=*'
autoload -Uz compinit
compinit -C

# Git branch
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'

# Prompt
#setopt PROMPT_SUBST
#PROMPT='%F{green}%n@%m%f: %F{blue}%~%f ${vcs_info_msg_0_} %# '

# Extra config
if [ -f $HOME/.zshrc.custom ]; then
    source ~/.zshrc.custom
fi

# Read by plugins at load/setup time, so must come before `antidote load`
zstyle ':prompt:pure:host' show yes

# Antidote
source "$HOME/.antidote/antidote.zsh"
antidote load

# Pure prompt: always show username@host (not only over SSH/root/container)
zstyle ':prompt:pure:user' color cyan
zstyle ':prompt:pure:host' color cyan
psvar[13]=1

# Pure prompt colors
zstyle ':prompt:pure:path' color 39              # path: DeepSkyBlue
zstyle ':prompt:pure:git:branch' color 208       # git branch: orange
zstyle ':prompt:pure:git:branch:cached' color 172  # git branch when data is cached: dim orange

# Alias
alias reload="source ~/.zshrc && echo ~/.zshrc reloaded"
alias zshrc="vim ~/.zshrc && reload"
alias l="ls"
alias ll="ls -lh"
alias la="ls -a"
alias lla="ls -lah"
alias cls="clear"
alias vi="nvim"
alias pm="podman"
