" Map escape to jj
imap jj <Esc>

" Syntax highlighting
syntax on

" Wrap vim around man command
runtime! ftplugin/man.vim

" Options viewable by using :options
" Set options viewable by using :set all
" Or help for individual configs can be accessed :help <name>
set nocompatible
set redrawtime=10000
set laststatus=2
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set nowrap
set expandtab
set smartindent
set number
set nobackup
set undodir=~/.vim/undordir
set undofile
set incsearch
set relativenumber

" Set winkey to Ctrl L
set termwinkey=<C-L>

"FINDING FILES:
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Set mapleader to space
let mapleader = " "

" Maps
nmap <leader>hk :vsplit ~/.vim/hotkeys<cr>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader><leader>g :GoFmt<cr>
nmap <leader><leader>b :Black<cr>
nmap <leader><leader>u :UndotreeToggle<cr>
nmap <leader>t :vertical :botright :term<cr>

" move block of code up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Set colorscheme
" colorscheme gruvbox
colorscheme ron
set background=dark

" Set transparent background
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
