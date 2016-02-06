#!/bin/bash

#tmux
ln -sin ~/.dotfiles/.tmux.conf ~/

#zsh
ln -sin ~/.dotfiles/.zshrc ~/

#emacs
cd ~
git clone https://github.com/uchiyu/.emacs.d.git
ln -sin ~/.emacs.d/init.el ~/

#vim
cd ~
git clone https://github.com/uchiyu/.vim.git
sh ~/.vim/install.sh
