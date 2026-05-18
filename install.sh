#!/bin/bash

#claude
mkdir -p ~/.claude
ln -s -f ~/.dotfiles/claude/settings.json ~/.claude/settings.json
ln -s -f ~/.dotfiles/claude/statusline.sh ~/.claude/statusline.sh

#tmux
ln -s -f ~/.dotfiles/.tmux.conf ~/

#zsh
ln -s -f ~/.dotfiles/.zshrc ~/

#emacs
cd ~
dir=~/.emacs.d
if [ -e $dir ]; then
  cd ~/.emacs.d
  git pull origin master
else
  git clone https://github.com/uchiyu/.emacs.d.git
  ln -s -f ~/.emacs.d/init.el ~/
fi

#vim
cd ~
dir=~/.vim
if [ -e $dir ]; then
  cd ~/.vim
  git pull origin master
else
  git clone https://github.com/uchiyu/.vim.git
  ln -s -f ~/.vim/.vimrc ~/
  cd ~/.vim
fi
sh install.sh
cd ~
