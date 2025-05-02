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
set termguicolors
set nowrap

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
    Plug 'cocopon/iceberg.vim'            " Colorscheme
    Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy file finder
    Plug 'vim-airline/vim-airline'        " Status line
    Plug 'fladson/vim-kitty'              " Syntax highlight for Kitty terminal configuration
    Plug 'junegunn/vim-easy-align'
call plug#end()

""" Plugins key binding
let mapleader = " "

"" CtrlP
let g:ctrlp_map = '<leader>ff'
let g:ctrlp_show_hidden=1

" https://github.com/kovidgoyal/kitty/blob/master/docs/faq.rst#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''

colorscheme iceberg
