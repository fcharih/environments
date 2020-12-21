######################## RUN AT SESSION START ##########################
clear
echo " /\\_/\\   DO IT FOR  /\\_/\\
( o.o )  ROSIE AND ( o.o )
 > ^ <   TESSIE.    > ^ <"
########################################################################

# oh-my-zsh config
export ZSH=~/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git docker)
autoload -U compinit && compinit

# Docker fix for container name completion after adding a flag
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
source ~/.oh-my-zsh/oh-my-zsh.sh

# Program-related environment variables
export EDITOR=nvim
export TERM=xterm-256color

# Command aliases
alias vim='nvim'
alias emacs='emacs -nw'
alias vimo='vim $(fzf)'
alias ls='exa'

# Load my custom functions/commands
source $HOME/environments/dotfiles/commands.sh

# Shortcut aliases
alias notebook='cd $HOME/Dropbox/Grad\ School/PhD/Notebook && emacs -client'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"
export PATH=/usr/local/bin:$PATH
alias fd=fdfind

export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=/Applications/Emacs.app/Contents/MacOS/:$PATH

eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/fcharih/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/fcharih/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/fcharih/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/fcharih/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

