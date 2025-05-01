syntax on

""" Tab and indentation
set tabstop=8 softtabstop=4 shiftwidth=4
set noexpandtab
set autoindent
set smartindent

" Line number settings
set number
set relativenumber

set wildmenu     " Display all matching files when we tab complete
set nofoldenable " Disable folding by default
set incsearch    " Highlight search content
" set laststatus=2 " Set status bar
set nocompatible " Set compatibility to Vim only
set noerrorbells " Disable bell
set listchars=space:·,tab:→·,trail:~
set list         " Show whitespace

""" Key bindings
" Move block of code up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Remap in Normal mode
nnoremap <C-C> <esc>
" Remap in Insert and Replace mode
inoremap <C-C> <esc>
" Remap in Visual and Select mode

""" Plugins
""" https://junegunn.github.io/vim-plug/installation/
call plug#begin()
    Plug 'morhetz/gruvbox'    " Gruvbox colorscheme
    Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file finder
call plug#end()

""" Plugins key binding
let mapleader = " "

"" CtrlP
let g:ctrlp_map = '<leader>ff'

colorscheme blue " Setting this so gruvbox works correctly in kitty term for some reason
colorscheme gruvbox
