#!/bin/bash

#tmux
ln -si ~/.dotfiles/.tmux.conf ~/

#zsh
ln -si ~/.dotfiles/.zshrc ~/
source ~/.zshrc

#emacs
cd ~
git clone https://github.com/uchiyu/.emacs.d.git

#vim
cd ~
git clone https://github.com/uchiyu/.vim.git
