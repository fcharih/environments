#! /usr/bin/env python3

import os

# Global variables
HOME = os.getenv("HOME")
EMAIL = "francoischarih@sce.carleton.ca"

try:
    os.symlink(f"{HOME}/environments/dotfiles/.zshrc", f"{HOME}/.zshrc")
except:
    pass

# Neovim setup
NEOVIM_INSTALL = (
"""
brew install neovim;
pip3 install neovim;
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim';
"""
)
os.system(NEOVIM_INSTALL)

try:
    config_dir = f"{HOME}/.config"
    os.mkdir(config_dir)
except FileExistsError:
    print(f"{config_dir} already exists; continue...")
    pass

try:
    nvim_config_dir = f"{HOME}/.config/nvim"
	os.mkdir(nvim_config_dir)
except FileExistsError:
    print(f"{nvim_config_dir} already exists; continue...")
    pass

try:
    vim_init = f"{HOME}/.config/nvim/init.vim"
    os.symlink(f"{HOME}/environments/dotfiles/vim/init.vim", vim_init)
except:
    print(f"{vim_init} already exists... skipping...")

# Node.js
os.system("brew install node")

# Pandoc
os.system("brew install pandoc")

# Rust
os.system("curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh")
os.system("rustup install nightly")

# Starship
os.system("brew install starship")


# Configure git
os.system('git config --global user.email {EMAIL}')
os.system('git config --global user.name Francois Charih')

