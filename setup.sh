#!/bin/bash

ARGC=$#
ARGV=$@
PROC_NAME=$0
declare -a TARGET=()

usage() {
    echo "[USAGE]:"
    echo "    $PROC_NAME <target>"

    echo "[TARGET]:"
    for target in ${TARGET[@]}; do
	echo "    $target"
    done
}

backup_and_remove() {
    if [ $# -ne 1 ]; then
	echo "[ERROR]: Must provide only 'destination' path"
	exit 1
    fi
    backup_path="./backup"
    dst=$1

    if [ ! -d "$backup_path" ]; then
	echo "[INFO]: Creating folder '$backup_path'"
	mkdir "$backup_path"
    fi
    echo "[INFO]: Copy '$dst' to '$backup_path'"
    cp -Lr "$dst" "$backup_path"
    echo "[INFO]: Removing '$dst'"
    rm -r "$dst"
}

link_src_to_dst() {
    if [ $# -ne 2 ]; then
	echo "[ERROR]: Must provide 'source' and 'destination'"
	exit 1
    fi
    src=$1
    dst=$2

    if [ -d "$dst" ]; then
	echo "[INFO]: Folder '$dst' exist. Backing up..."
	backup_and_remove "$dst"
    elif [ -f "$dst" ]; then
	echo "[INFO]: File '$dst' exist. Backing up..."
	backup_and_remove "$dst"
    fi

    echo "[INFO]: Creating symlink for '$1' -> '$2'"
    ln -sf "$1" "$2"
}

setup_dotfiles() {
    if [ $# -ne 1 ]; then
	echo "[ERROR]: Expected only one target"
	exit 1
    fi
    target=$1

    case $target in
	'i3')    link_src_to_dst "$(pwd)/$target/"           "$HOME/.config/$target";;
	'kitty') link_src_to_dst "$(pwd)/$target/"           "$HOME/.config/$target";;
	'rofi')  link_src_to_dst "$(pwd)/$target/"           "$HOME/.config/$target";;
	'nvim')  link_src_to_dst "$(pwd)/$target/"           "$HOME/.config/$target";;
	'vim')   link_src_to_dst "$(pwd)/$target/.vimrc"     "$HOME/.vimrc";;
	'emacs') link_src_to_dst "$(pwd)/$target/README.org" "$HOME/.emacs.el";;
	'tmux')  link_src_to_dst "$(pwd)/$target/tmux.conf"  "$HOME/.tmux.conf";;
	'all') : ;;
	*) 
	    echo "[ERORR]: unimplemented target '$target'"
	    exit 1
	    ;;
    esac
}

TARGET+=('all')
for f in $(ls -d */); do
    folder=$(basename $f)
    if [ "$folder" != "backup" ]; then
	TARGET+=($folder)
    fi
done

if [ $ARGC -lt 1 ]; then
    echo "[ERROR]: Must provide at least one target"
    usage
    exit 1
fi

for arg in $ARGV; do
    found='false'
    for target in ${TARGET[@]}; do
	if [ "$arg" = "$target" ]; then
	    found='true'
	    break
	fi
    done
    if [ "$found" = "false" ]; then
	echo "[ERROR: Invalid arguments '$arg'"
	usage
	exit 1
    fi
done

for arg in $ARGV; do
    if [ "$arg" != "all" ]; then
	setup_dotfiles $arg
    else
	for target in ${TARGET[@]}; do
	    setup_dotfiles $target
	done
	break
    fi
done
