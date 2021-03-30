" VIMprove yourself, this is required 
syntax on
filetype on                  
filetype indent on

set expandtab
set autoindent
set smartindent
set nowrap
set nocompatible              
set hidden
set nu rnu
set backspace=indent,eol,start
set clipboard=unnamed
set incsearch
set rtp+=/usr/local/opt/fzf
set splitbelow
set splitright
set encoding=utf-8

set colorcolumn=63
highlight ColorColumn ctermbg=0 guibg=blue

"Maps
let mapleader= " "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap kj <Esc>
inoremap jj <Esc>
inoremap jk <Esc>

"Enable Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"Tagbar 
nmap <C-d> :TagbarToggle<CR>

"Adds spellcheck on commit messages
autocmd Filetype gitcommit setlocal spell textwidth=66

"Pathogen
execute pathogen#infect()

"Include Vimplug and initialize
call plug#begin('~/.vim/plugged')

"General
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

"Appearance
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'mbbill/undotree'

"Language and Highlights
Plug 'ap/vim-css-color'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1
Plug 'tpope/vim-markdown'

"Calling Nerdtree and its settings
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-f> :NERDTreeToggle<CR>

"Goyo (zen mode)
Plug 'junegunn/goyo.vim'
let g:goyo_linenr = 1
map <C-g> :Goyo<CR>

" required for vim plug
call plug#end()  

"GUI fixes
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  set background=dark
  colorscheme zenburn
endif
