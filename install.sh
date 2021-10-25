#!/bin/bash

set -x # echo commands

DOTFILES_DIR=~/dotfiles

SCRIPT_PATH="${0%/*}"
# No matter where you are, the script always runs in this directory
cd "$SCRIPT_PATH" || exit

function makeDirectory() {
  mkdir -vp "$1"
}

function isDirectory() {
  if [ -d "$1" ]; then
    true
  else
    false
  fi
}

function makeLink() {
  ln -nsf "$1" "$2"
}

function installBashIt() {
  #install Bash-it
  BASH_IT_DIR=~/.bash_it
  if ! isDirectory "$BASH_IT_DIR"; then
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    cd $BASH_IT_DIR || { echo "cd $BASH_IT_DIR"; exit 127; }
    ./install.sh
  fi
}

function installTmux() {
  TMUX_DIR=~/.tmux
  if ! isDirectory "$TMUX_DIR"; then
    makeDirectory $TMUX_DIR/plugins/
    git clone https://github.com/tmux-plugins/tpm $TMUX_DIR/plugins/tpm
  fi

  makeLink "$DOTFILES_DIR"/tmux.conf ~/.tmux.conf
}

function installUrxvt() {
  # Install urxvrt-resize-font perl-lib
  URXVT_DIR=~/.urxvt
  if ! isDirectory "$URXVT_DIR"; then
    makeDirectory "$URXVT_DIR/ext"
    git clone https://github.com/simmel/urxvt-resize-font ~/tmp/urxvt-resize-font
    mv ~/tmp/urxvt-resize-font/resize-font $URXVT_DIR/ext/
  fi
}

function installPolybar(){
  POLYBAR_DIR=~/.config/polybar
  if ! isDirectory "$POLYBAR_DIR"; then
    makeDirectory "$POLYBAR_DIR"
  fi

  makeLink "$DOTFILES_DIR"/polybar/config ~/.config/polybar/config
  makeLink "$DOTFILES_DIR"/polybar/launch.sh ~/.config/polybar/launch.sh
}

function installVscode() {
  VSCODE_DIR=~/.config/Code/User
  if ! isDirectory "$VSCODE_DIR"; then
    makeDirectory "$VSCODE_DIR"
  fi

  makeLink "$DOTFILES_DIR"/vscode/settings.json $VSCODE_DIR/settings.json
}

function installRofi() {
  makeLink "$DOTFILES_DIR"/rofi/config.rasi ~/.config/config.rasi
}

function installXresources() {
  makeLink "$DOTFILES_DIR"/Xresources ~/.Xresources
}

function installI3() {
  makeLink "$DOTFILES_DIR"/i3/config ~/.config/i3/config
}

function installPsql() {
  makeLink "$DOTFILES_DIR"/psqlrc ~/.psqlrc
}

function installInputrc() {
  makeLink "$DOTFILES_DIR"/inputrc ~/.inputrc
}

function main() {
  installBashIt
  installTmux
  installUrxvt
  installPolybar
  installVscode
  installRofi
  installXresources
  installI3
}

main

