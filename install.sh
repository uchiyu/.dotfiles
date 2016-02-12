#!/bin/bash

#tmux
ln -s -f ~/.dotfiles/.tmux.conf ~/

#zsh
ln -s -f ~/.dotfiles/.zshrc ~/

#emacs
cd ~
dir=~/.emacs.d
if [ -e $dir ]; then
  git pull origin master
else
  git clone https://github.com/uchiyu/.emacs.d.git
  ln -s -f ~/.emacs.d/init.el ~/
fi

#vim
cd ~
dir=~/.emacs.d
if [ -e $dir ]; then
  git pull origin master
else
  git clone https://github.com/uchiyu/.vim.git
  sh ~/.vim/install.sh
fi
