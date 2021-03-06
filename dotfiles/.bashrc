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
export EDITOR="nvim"
#export SLURM_ACCOUNT=ctb-jrgreen
#export SBATCH_ACCOUNT=$SLURM_ACCOUNT
#export SALLOC_ACCOUNT=$SLURM_ACCOUNT
export INPUTS="$SCRATCH/data/inputs"
export OUTPUTS="$SCRATCH/data/outputs"

# Modules
module load openmpi
module load singularity
module load mpi4py
module load boost
module load scipy-stack/2019a
module load python/3.8

# Paths
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cvmfs/soft.computecanada.ca/easybuild/software/2017/Core/python/3.8.0/lib
export LD_LIBRARY_PATH="$HOME/usr/lib:$HOME/usr/lib64:$HOME/rpm/usr/lib"
export LIBRARY_PATH="/usr/lib/nvidia-current:$LIBRARY_PATH"
export PATH=$HOME/local/bin:$PATH
export PATH="$HOME/usr/sbin:$PATH"
export PATH="$HOME/software/neovim/bin:$PATH"
export PATH="$HOME/software/node/bin:$PATH"


# Aliases
alias ls='ls $LS_OPTIONS'
alias vim="nvim"
alias time="/cvmfs/soft.computecanada.ca/nix/var/nix/profiles/16.09/bin/time"
alias exa="ls"

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
