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

# Homebrew: among other things this adds $HOMEBREW_PREFIX/share/zsh/site-functions
# to fpath, where formula completions live (_uv, _kubectl, _helm, _rg, ...).
# It must run before compinit, otherwise those completions are not found.
if [ -d "/opt/homebrew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # Homebrew auto update every week
    export HOMEBREW_AUTO_UPDATE_SECS=604800
fi

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

# Non-local shell marker: tag the preprompt when this is not the local machine.
# Detected once at startup, since these flags do not change for a given shell.
typeset -g PROMPT_ENV_TAG=
if [[ -n ${KUBERNETES_SERVICE_HOST-} ]]; then
    PROMPT_ENV_TAG=k8s                                    # pod
elif [[ -f /.dockerenv ]]; then
    PROMPT_ENV_TAG=docker                                 # docker container
elif [[ -f /run/.containerenv || -n ${container-} ]]; then
    PROMPT_ENV_TAG=${${container:-podman}:t}              # podman / systemd-nspawn
elif [[ -n ${SSH_CONNECTION-}${SSH_TTY-}${PROMPT_PURE_SSH_CONNECTION-} ]]; then
    PROMPT_ENV_TAG=ssh                                    # ssh, also in nested shells
elif [[ -n ${WSL_DISTRO_NAME-} ]]; then
    PROMPT_ENV_TAG=wsl
fi
[[ -n $PROMPT_ENV_TAG ]] && PROMPT_ENV_TAG="[$PROMPT_ENV_TAG]"

# Pure renders psvar[22] as the custom prefix on the preprompt line.
prompt_pure_precustom() {
    psvar[22]=$PROMPT_ENV_TAG
}
# Color can also be set per environment, e.g. 214=ssh, 45=docker, 33=k8s.
zstyle ':prompt:pure:custom:prefix' color 214              # orange: stands out on dark backgrounds

# ls colors: macOS / Linux
if [[ "$OSTYPE" == darwin* ]]; then
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad

    alias ls='ls -G'
    alias ll='ls -lhG'
    alias la='ls -lahG'

elif [[ "$OSTYPE" == linux* ]]; then
    if command -v dircolors >/dev/null 2>&1; then
        eval "$(dircolors -b)"
    fi

    alias ls='ls --color=auto'
    alias ll='ls -lh --color=auto'
    alias la='ls -lah --color=auto'
fi

# Alias
alias reload="source ~/.zshrc && echo ~/.zshrc reloaded"
alias zshrc="vim ~/.zshrc && reload"
alias cls="clear"
alias vi="nvim"
alias pm="podman"

# Extra config
if [ -f $HOME/.zshrc.custom ]; then
    source ~/.zshrc.custom
fi
