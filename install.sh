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
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
