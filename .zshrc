# ============================================================
# Powerlevel10k Instant Prompt (MUST BE AT TOP)
# ============================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================
# ZSH Configuration
# ============================================================

# ------------------------------------------------------------
# Vi Mode
# ------------------------------------------------------------
bindkey -v
export KEYTIMEOUT=1

bindkey '^?' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# Cursor shape: beam for insert, block for normal
if [[ $- == *i* ]]; then
    function zle-keymap-select zle-line-init {
        case $KEYMAP in
            vicmd)      echo -ne '\e[2 q' ;;
            viins|main) echo -ne '\e[6 q' ;;
        esac
    }
    zle -N zle-keymap-select
    zle -N zle-line-init
    echo -ne '\e[6 q'
fi

# Edit command in nvim (v in normal mode)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Double-tap Esc for sudo
sudo-command-line() {
    [[ -z $BUFFER ]] && BUFFER=$(fc -ln -1)
    BUFFER="sudo $BUFFER"
    zle end-of-line
}
zle -N sudo-command-line
bindkey '\e\e' sudo-command-line

# ------------------------------------------------------------
# Environment Variables & PATH
# ------------------------------------------------------------
export GOPATH="$HOME/go"
export EDITOR="nvim"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-18.jdk/Contents/Home"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
export PATH="$HOME/.nvm/versions/node/v20.11.1/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

. "$HOME/.local/bin/env"

# ------------------------------------------------------------
# SSH Agent (fast version)
# ------------------------------------------------------------
_ssh_env="$HOME/.ssh/environment"
[[ -z "$SSH_AGENT_PID" && -f "$_ssh_env" ]] && source "$_ssh_env" > /dev/null
if [[ -z "$SSH_AGENT_PID" ]] || ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
    ssh-agent -s | sed 's/^echo/#echo/' > "$_ssh_env"
    chmod 600 "$_ssh_env"
    source "$_ssh_env" > /dev/null
fi

# ------------------------------------------------------------
# pyenv (lazy-loaded on first use)
# ------------------------------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"

pyenv() {
    unfunction pyenv 2>/dev/null
    eval "$(command pyenv init --path)"
    eval "$(command pyenv init -)"
    pyenv "$@"
}

# ------------------------------------------------------------
# opam (OCaml)
# ------------------------------------------------------------
[[ -f "$HOME/.opam/opam-init/init.zsh" ]] && source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2>&1

# ------------------------------------------------------------
# Conda (lazy-loaded on first use)
# ------------------------------------------------------------
conda() {
    unfunction conda 2>/dev/null
    __conda_setup="$('/Users/shy/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [[ $? -eq 0 ]]; then
        eval "$__conda_setup"
    else
        if [[ -f "/Users/shy/opt/miniconda3/etc/profile.d/conda.sh" ]]; then
            . "/Users/shy/opt/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/Users/shy/opt/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    conda "$@"
}

# ------------------------------------------------------------
# Aliases
# ------------------------------------------------------------
alias ls='eza'
alias ll='eza -la'
alias la='eza -a'
alias lt='eza --tree'
alias cat='bat'

# ------------------------------------------------------------
# Powerlevel10k Theme
# ------------------------------------------------------------
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ------------------------------------------------------------
# Completions (cached)
# ------------------------------------------------------------
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# ------------------------------------------------------------
# History
# ------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE INC_APPEND_HISTORY

# ------------------------------------------------------------
# Zoxide (smarter cd)
# ------------------------------------------------------------
eval "$(zoxide init zsh)"

# ------------------------------------------------------------
# fzf (fuzzy finder)
# ------------------------------------------------------------
source <(fzf --zsh)

# ------------------------------------------------------------
# Colored man pages
# ------------------------------------------------------------
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# ------------------------------------------------------------
# Atuin (better shell history)
# ------------------------------------------------------------
eval "$(atuin init zsh)"

# ------------------------------------------------------------
# Syntax Highlighting & Autosuggestions (must be near end)
# ------------------------------------------------------------
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
