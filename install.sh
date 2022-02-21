#!/bin/bash 
set -e

echo "link dotfiles to ~"
echo " "
DOTFILESDIR=~/.dotfiles/dotfiles

[[ -d ~/.dotfilesbackup ]] || mkdir  ~/.dotfilesbackup

for DOTFILE in $(find $DOTFILESDIR -type f)
do
  #echo $(basename $DOTFILE)
  ([ -f ~/$(basename $DOTFILE) ] && [ ! -L ~/$(basename $DOTFILE) ]) \
     && echo "  create backup to of ~/$(basename $DOTFILE) to ~/.dotfilesbackup/$(basename $DOTFILE)" \
     && mv ~/$(basename $DOTFILE) ~/.dotfilesbackup/

  echo " "
  echo "  ln -fs ${DOTFILE} ~/"
  ln -fs ${DOTFILE} ~/
done

echo "install additional software"

