#!/bin/bash

basedir="$(pwd)"

link () {
    dirname="$(dirname "$2")"
    if ! [ -d "$dirname" ]; then
        set -x
        mkdir -p "$dirname"
        { set +x; } 2> /dev/null
    fi
    if [ -f "$2" ]; then
        echo -n "target $2 exists. overwrite? [Y/n] "
        read answer
        if [[ "$answer" =~ no? ]]; then
            return
        fi
    fi
    set -x
    ln -sf "$1" "$2"
    { set +x; } 2> /dev/null
}

link "$basedir/bashrc" ~/.bashrc
link "$basedir/gitconfig" ~/.config/git/config
link "$basedir/ncmpcpp/bindings" ~/.ncmpcpp/bindings
link "$basedir/ncmpcpp/config" ~/.ncmpcpp/config
link "$basedir/pylintrc" ~/.pylintrc
link "$basedir/ranger/rc.conf" ~/.config/ranger/rc.conf
link "$basedir/screenrc" ~/.screenrc
link "$basedir/subversion_config" ~/.subversion/config
link "$basedir/vim/colors" ~/.vim/colors
link "$basedir/vim/snippets" ~/.vim/snippets
link "$basedir/vim/vimrc" ~/.vimrc
link "$basedir/zathurarc" ~/.config/zathura/zathurarc
