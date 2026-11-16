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

# Read by plugins at load/setup time, so must come before `antidote load`
zstyle ':prompt:pure:host' show yes

# Antidote
source "$HOME/.antidote/antidote.zsh"
antidote load

# Ctrl+W: kill only one path component (stop at `/`).
# zsh's default WORDCHARS contains `/`, so plain `backward-kill-word` eats the whole path.
# Removing `/` locally makes the widget delete up to the previous directory separator.
backward-kill-dir() {
  local WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
  zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^W' backward-kill-dir

# Pure prompt: always show username@host (not only over SSH/root/container)
zstyle ':prompt:pure:user' color cyan
zstyle ':prompt:pure:host' color cyan
psvar[13]=1

# Pure prompt colors
zstyle ':prompt:pure:path' color 39                # path: DeepSkyBlue
zstyle ':prompt:pure:git:branch' color 208         # git branch: orange
zstyle ':prompt:pure:git:branch:cached' color 172  # git branch when data is cached: dim orange
zstyle :prompt:pure:git:dirty detailed yes         # differentiate between unstaged (*), staged (+), and untracked (?) changes

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

# Extra config
if [ -f $HOME/.zshrc.custom ]; then
    source ~/.zshrc.custom
fi
