#!/bin/bash

#tmux
ln -s -f ~/.dotfiles/.tmux.conf ~/

#zsh
ln -s -f ~/.dotfiles/.zshrc ~/

#emacs
cd ~
git clone https://github.com/uchiyu/.emacs.d.git
ln -s -f ~/.emacs.d/init.el ~/

#vim
cd ~
git clone https://github.com/uchiyu/.vim.git
sh ~/.vim/install.sh
