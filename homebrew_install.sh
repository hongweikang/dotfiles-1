#!/bin/sh
#
# Useful packages managed by Homebrew

DOTFILES_ROOT="`pwd`"
source $DOTFILES_ROOT/_bashrc

# Check for Homebrew
if ! check_command brew; then
    echo "  x You need to install Homebrew first before running this script:"
    echo "    https://github.com/mxcl/homebrew/wiki/installation"
    exit
fi

# Install handy homebrew packages
brew install ack
brew install bash-completion
brew install cmake
brew install cscope
brew install csshx
brew install ctags
brew install fasd
brew install git
brew install macvim
brew install the_silver_searcher
brew install tmux
brew install vim
brew install wget
brew install zsh
brew install zsh-completions

