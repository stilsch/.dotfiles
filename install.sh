#!/bin/bash 
set -e

echo "link dotfiles to ~"
DOTFILESDIR=~/.dotfiles/dotfiles
for DOTFILE in $(find $DOTFILESDIR -type f)
do
  echo ln -s ${DOTFILE} ~/
done

echo "install additional software"

hash sudo || {
  echo "sudo not installed"
  exit 1
}


echo "install ansible"
sudo apt install ansible


# add steffen@dell ssh-key to .ssh/authorizised_key via Ansible

# install standard apps via ansible
