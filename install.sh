#!/bin/bash

set -x # echo commands

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

# Install urxvrt-resize-font perl-lib
URXVT_DIR=~/.urxvt
if [ ! -d "$URXVT_DIR" ]; then
  mkdir -vp "$URXVT_DIR/ext"
  git clone https://github.com/simmel/urxvt-resize-font ~/tmp/urxvt-resize-font
  mv ~/tmp/urxvt-resize-font/resize-font $URXVT_DIR/ext/
fi

# Install polybar config
POLYBAR_DIR=~/.config/polybar
if [ ! -d "$POLYBAR_DIR" ]; then
  mkdir -vp "$POLYBAR_DIR"
fi

# Install vscode config
VSCODE_DIR=~/.config/Code/User
if [ ! -d "$VSCODE_DIR" ]; then
  mkdir -vp "$VSCODE_DIR"
fi

ln -nsf ~/dotfiles/rofi/config.rasi ~/.config/config.rasi
ln -nsf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -nsf ~/dotfiles/Xresources ~/.Xresources
ln -nsf ~/dotfiles/i3/config ~/.config/i3/config
ln -nsf ~/dotfiles/inputrc ~/.inputrc
ln -nsf ~/dotfiles/psqlrc ~/.psqlrc
ln -nsf ~/dotfiles/polybar/config ~/.config/polybar/config
ln -nsf ~/dotfiles/polybar/launch.sh ~/.config/polybar/launch.sh
ln -nsf ~/dotfiles/vscode/settings.json $VSCODE_DIR/settings.json
