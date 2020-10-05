" be iMproved, required
set nocompatible              
filetype on                  

" activates filetype detection
filetype indent on

"Activates syntax highlighting among other things
syntax on
set clipboard=unnamed

"Enable Folding"
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"Tabs are spaces
set expandtab

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

"Pathogen"
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
Plug 'vim-syntastic/syntastic'
Plug 'ycm-core/YouCompleteMe'

" Splits
set splitbelow
set splitright

"Appearance
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'

"Languages"

Plug 'ap/vim-css-color'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'
Plug 'raichoo/haskell-vim', { 'for': 'haskell' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'b4b4r07/vim-hcl', { 'for': 'hcl' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1
Plug 'tpope/vim-markdown'
Plug 'wlangstroth/vim-racket'

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

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
