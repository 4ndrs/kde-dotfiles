HISTFILE=~/.histfile
HISTSIZE=400000
SAVEHIST=$HISTSIZE

setopt appendhistory
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space

autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

autoload -Uz compinit
compinit

unsetopt prompt_cr prompt_sp

zstyle ':completion::complete:*'    use-cache 1
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings'     format '%BSorry, no matches'

unsetopt beep

bindkey -v
bindkey '^?' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^f' history-incremental-search-backward

# End of lines configured by zsh-newuser-install

PS1=" » ";

alias ls="ls --color"
alias ip="ip -c"
alias grep='grep --color=auto'
alias egrep='egrep --color'
alias diff='diff --color' # diff -u for usual patch diff
alias info='info --vi-keys'
alias pipex="$HOME/Scripts/pipes.sh"
alias get_window_id='xwininfo | sed -n "s/^.*id: \(\w*\).*$/\1/p"'

export EDITOR=vi
export GPG_TTY=$TTY
export LANG=en_US.UTF-8

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/andres/.bun/_bun" ] && source "/home/andres/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH:$HOME/.local/bin/"

eval $(thefuck --alias)
