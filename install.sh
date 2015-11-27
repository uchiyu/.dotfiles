#!/bin/bash

#tmux
ln -sin ~/.dotfiles/.tmux.conf ~/

#zsh
ln -sin ~/.dotfiles/.zshrc ~/
source ~/.zshrc

#emacs
cd ~
git clone https://github.com/uchiyu/.emacs.d.git
ln -sin ~/.emacs.d/init.el ~/

#vim
cd ~
git clone https://github.com/uchiyu/.vim.git
ln -sin ~/.vim/.vimrc ~/
sh ~/.vim/install.sh
