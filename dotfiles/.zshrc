source $HOME/.bashrc
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
DEFAULT_USER=fcharih

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

########################### GENERAL SETTINGS ###########################
# Environment variables
export EDITOR=vim
export TERM=xterm-256color

# Path 

# Aliases
alias vim='nvim'
alias ls='exa'
alias vimo='vim $(fzf)'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs "$@" -nw'
alias ed='/Applications/Emacs.app/Contents/MacOS/Emacs "$@" --daemon'
alias ec='emacsclient -ct'

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

# Docker fix for container name completion after adding a flag
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Other
#[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session } # launch tmux by default
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

########################################################################

############################ MACOS SETTINGS ############################
if [[ "$OSTYPE" == *"darwin"* ]]; then
    DEFAULT_USER=$USER
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
	export PATH=$PATH:$HOME/opt/anaconda3/bin:$HOME/.emacs.d/bin
fi
########################################################################

############################ LINUX SETTINGS ############################
if [[ "$OSTYPE" == *"linux"* ]]; then
email() {
	sendmail -t < $1
}
export PATH="$HOME/anaconda3/bin:$PATH"
alias zotero="bash /home/fcharih/Software/Zotero/zotero &> /dev/null &"
alias saans-tablet="$HOME/Android/Sdk/emulator/emulator -avd saans-tablet"

	export ANDROID_HOME=$HOME/Library/Android/sdk
	export PATH=$PATH:$ANDROID_HOME/tools
	export PATH=$PATH:$ANDROID_HOME/tools/bin
	export PATH=$PATH:$ANDROID_HOME/platform-tools
	export PATH=$PATH:$ANDROID_HOME/emulator
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules'
fi
########################################################################


######################## RUN AT SESSION START ##########################
clear
echo " /\\_/\\   DO IT FOR  /\\_/\\
( o.o )  ROSIE AND ( o.o )
 > ^ <   TESSIE.    > ^ <"
########################################################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/sbin:$PATH"
export PATH=/usr/local/bin:$PATH
export PYTHONPATH="/home/fcharih/opt/anaconda3/bin/python3.7"

eval "$(starship init zsh)"

alias fd=fdfind
