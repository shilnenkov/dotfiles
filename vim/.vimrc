" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'dikiaap/minimalist'

" Initialize plugin system
call plug#end()

" highlighting
set t_Co=256
syntax on
colorscheme minimalist

" Global preferences
set nu
set termencoding=utf-8
set clipboard=unnamedplus
"set clipboard=unnamed

" Remember info about open buffers on close
set viminfo^=%

" Backup
set undofile
set noswapfile
set nobackup

" Sounds
set noerrorbells
set novisualbell

" Search
set smartcase
set ignorecase
set incsearch
set showmatch
set hlsearch

" indention
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" enable mouse
set mouse=a

filetype indent on

