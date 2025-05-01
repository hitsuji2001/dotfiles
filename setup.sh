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

TARGET+='all'
for f in $(ls -d */); do
    folder=$(basename $f)
    TARGET+=($folder)
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

set -xe

for arg in $ARGV; do
    case $arg in
	'emacs') ln -sf "$(pwd)/$arg/README.org" "$HOME/.emacs.el" ;;
	'i3') ln -sf "$(pwd)/$arg/" "$HOME/.config/" ;;
	'kitty') ln -sf "$(pwd)/$arg/" "$HOME/.config/" ;;
	'vim') ln -sf "$(pwd)/$arg/.vimrc" "$HOME/.vimrc" ;;
	'nvim') ln -sf "$(pwd)/$arg/" "$HOME/.config/" ;;
	'tmux') ln -sf "$(pwd)/$arg/tmux.conf" "$HOME/.tmux.conf" ;;
	*) echo "[ERORR]: unimplemented target '$arg'" ;;
    esac
done
