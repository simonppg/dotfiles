#!/bin/bash

#install Bash-it
BASH_IT_DIR=~/.bash_it
if [ ! -d "$BASH_IT_DIR" ]; then
	git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
	cd $BASH_IT_DIR || { echo "cd $BASH_IT_DIR"; exit 127; }
	./install.sh
fi

#copy dotfiles
TMUX_DIR=~/.tmux
if [ ! -d "$TMUX_DIR" ]; then
    mkdir -vp $TMUX_DIR/plugins/
    git clone https://github.com/tmux-plugins/tpm $TMUX_DIR/plugins/tpm
fi

ln -nsf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -nsf ~/dotfiles/Xresources ~/.Xresources
ln -nsf ~/dotfiles/i3/config ~/.config/i3/config
ln -nsf ~/dotfiles/inputrc ~/.inputrc
