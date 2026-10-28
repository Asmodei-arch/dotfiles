# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
GITSTATUS_LOG_LEVEL=DEBUG


export PATH="$HOME/.local/bin:$PATH"
export QT_QPA_PLATFORMTHEME=qt6ct
export EDITOR="vim"
export LANG="en_US.UTF-8"
export HTTPS_PROXY="http://127.0.0.1:2080"
export HTTP_PROXY="http://127.0.0.1:2080"

alias cl="clear"
alias ls="eza -lh --icons=always"

eval "$(zoxide init zsh)"
alias cd="z"
alias vim="nvim"

HISTFILE=~/.histfile
HISTSIZE=999
SAVEHIST=1000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt autocd
setopt extendedglob

bindkey -v


autoload -U compinit; compinit
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^K' up-line-or-beginning-search
bindkey '^[[B' up-line-or-beginning-search
bindkey '^J' up-line-or-beginning-search

# End of lines configured by zsh-newuser-install
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}

if [[ $(tty) = /dev/tty1 ]]; then
    niri-session
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Fuzzy Directory Navigator Configuration
source "/home/arata/.local/lib/fzf-cd/fzf-cd-lib"
___fzf_cd() {
  __fzf_cd 
  zle accept-line
}
zle -N ___fzf_cd
bindkey '^f' ___fzf_cd


# Added by Antigravity CLI installer
export PATH="/home/arata/.local/bin:$PATH"
