# command history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=~/.cache/zsh/history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

bindkey '^h' backward-char
bindkey '^l' forward-char
bindkey '^b' backward-word
bindkey '^f' forward-word
# bindkey '^j' autosuggest-accept
# bindkey '^k' autosuggest-execute
# bindkey '^a' beginning-of-line
# bindkey '^e' end-of-line

# aliases
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -la"
alias cd..="cd .."

zstyle ':autocomplete:*' add-semicolon no
# zstyle ':completion:*' menu select

# plugins
eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
