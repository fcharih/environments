######################## RUN AT SESSION START ##########################
clear
echo " /\\_/\\   DO IT FOR  /\\_/\\
( o.o )  ROSIE AND ( o.o )
 > ^ <   TESSIE.    > ^ <"
########################################################################

# General environment variables
#export LANG=en_US.UTF-8
#DEFAULT_USER=$USER
#HIST_STAMPS="dd/mm/yyyy"

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
export EDITOR=vim
export TERM=xterm-256color

# Aliases
alias vim='nvim'
alias vimo='vim $(fzf)'

# Functions
tunnel() {
    ssh -N -n -L localhost:"$2":localhost:"$2" $1
}

killallcontainers() {
	docker ps --all | awk '{if(NR>1) print $1}' | xargs -I{} docker kill {}
}

removeallcontainers() {
	docker ps --all | awk '{if(NR>1) print $1}' | xargs -I{} docker container rm {}
}

push_to_public() {
  if [ -z "$2" ]
  then
   scp -r $1 cubiccloud:/var/www/html/public/$2
  else
   scp -r $1 cubiccloud:/var/www/html/public
  fi
}

push_to_cubic() {
  scp -r $1 cubiccloud:$2
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"
export PATH=/usr/local/bin:$PATH
alias fd=fdfind

export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/usr/local/Cellar/python@3.8/3.8.6_2/bin:$PATH

alias ls='exa'

eval "$(starship init zsh)"
