##################### COMPUTE CANADA CONFIGS ######################################
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Environment variables
export TERM=screen-256color
export LS_OPTIONS='--color=auto'
#export SLURM_ACCOUNT=ctb-jrgreen
#export SBATCH_ACCOUNT=$SLURM_ACCOUNT
#export SALLOC_ACCOUNT=$SLURM_ACCOUNT

# Modules
module load openmpi/2.1.1
module load boost
module load gcc
module load scipy-stack/2019a
module load python/3.8

# Paths
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cvmfs/soft.computecanada.ca/easybuild/software/2017/Core/python/3.8.0/lib
export LIBRARY_PATH="/usr/lib/nvidia-current:$LIBRARY_PATH"
export PATH=$HOME/.local/neovim/bin:$HOME/local/bin:$PATH

# Aliases
alias ls='ls $LS_OPTIONS'
alias vim="nvim"
alias time="/cvmfs/soft.computecanada.ca/nix/var/nix/profiles/16.09/bin/time"

# Other
eval "$(dircolors -b)"
###################################################################################

# Path to your oh-my-bash installation.
export OSH=/home/fcharih/.oh-my-bash
OSH_THEME="agnoster"
completions=(
  git
  composer
  ssh
)

aliases=(
  general
)

plugins=(
  git
  bashmarks
)

source $OSH/oh-my-bash.sh
export PATH=$PATH:$HOME/environments/computecanada
