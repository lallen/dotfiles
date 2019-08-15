set nocompatible              " be iMproved, required
filetype on                  " required

" activates filetype detection
filetype plugin indent on

"Activates syntax highlighting among other things
syntax on

"Adds spellcheck on commit messages"
autocmd Filetype gitcommit setlocal spell textwidth=72

"Activates Line Numbers"
set number
map <C-l> :set number <CR>

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

"Pathogen too"
execute pathogen#infect()

"Set the runtime path to include Vimplug and initialize
call plug#begin('~/.vim/plugged')
	

"General"
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'wincent/command-t'

"Appearance"
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

"Languages"
Plug 'posva/vim-vue'
Plug 'ap/vim-css-color'


"fzf fuzzy finder"
Plug 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf

"SnipMate"
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

"Snipmate Optional"
Plug 'honza/vim-snippets'

"Nerdtree"
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

"Calling Nerdtree and its settings"
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-f> :NERDTreeToggle<CR>

"Goyo (zen mode)"
Plug 'junegunn/goyo.vim'

"Goyo config"
let g:goyo_linenr = 1
map <C-g> :Goyo<CR>

call plug#end()            " required for vim plug



