### Description

A place to store all those dotfiles

### Usage

You can move config individually or you can use `setup.sh` file to create symlink to default location.


| Target | Location         |
| ------ | ---------------- |
| emacs  | ~/.emacs.el      |
| i3     | ~/.config/i3/    |
| kitty  | ~/.config/kitty/ |
| nvim   | ~/.config/nvim/  |
| rofi   | ~/.config/rofi/  |
| tmux   | ~/.tmux.conf     |
| vim    | ~/.vimrc         |


``` bash
./setup all
./setup vim i3 kitty
```
