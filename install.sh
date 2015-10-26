#!/bin/bash

#tmux
ln -si ~/.dotfiles/.tmux.conf ~/

#zsh
ln -si ~/.dotfiles/.zshrc ~/
source ~/.zshrc

#emacs
cd ~
git clone https://github.com/uchiyu/.emacs.d.git
ln -si ~/.emacs.d/init.el ~/

#vim
cd ~
git clone https://github.com/uchiyu/.vim.git
ln -si ~/.vim/.vimrc ~/
