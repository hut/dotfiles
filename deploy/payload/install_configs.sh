#!/bin/sh
echo "${0%/*}"
cd "${0%/*}" || exit
cp --backup=numbered -v vimrc ~/.vimrc
cp --backup=numbered -v screenrc ~/.screenrc
cp --backup=numbered -v tmux.conf ~/.tmux.conf
cp --backup=numbered -v bashrc ~/.bashrc_hut
t='source ~/.bashrc_hut'
grep -q -F "$t" ~/.bashrc || echo "$t" >> ~/.bashrc
