#!/bin/bash

#install Bash-it
BASH_IT_DIR=~/.bash_it
if [ ! -d "$BASH_IT_DIR" ]; then
	git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
	cd $HOME/.bash_it
	./install.sh
fi

#copy dotfiles
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
echo "if [ -f $HOME/dotfiles/dockerfunc ]; then" >> $HOME/.bashrc
echo "  . $HOME/dotfiles/dockerfunc" >> $HOME/.bashrc
echo "fi" >> $HOME/.bashrc
