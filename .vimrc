"[INITIALISE]-----------------------------------------------------------------
set nocompatible
filetype on
filetype off

"[VUNDLE]---------------------------------------------------------------------
set rtp += ~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

"[BUNDLES]--------------------------------------------------------------------
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/tabular'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'kien/ctrlp.vim'
Bundle 'rygwdn/vim-conque'
Bundle 'actionscript.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'chriskempson/vim-tomorrow-theme'

"[CONFIGURATION]--------------------------------------------------------------
filetype plugin indent on

"Show line numbers
set nu

"Column width is 80 as per PEP 8
set cc = 80

"Always show the statusline
set ls = 2

"Show matching parens/brackets/etc...
set showmatch

"Search
set incsearch
set hlsearch

"[THEME]----------------------------------------------------------------------
syntax on
set t_Co       = 256
set background = dark
set encoding   = utf-8
colorscheme Tomorrow-Night

"[KEYS]-----------------------------------------------------------------------
"Backspace acts as it does in other apps
set backspace = 2

"Tabs
set autoindent
set copyindent
set tabstop    = 4
set shiftwidth = 4

"Undo / Redo
noremap <C-Z> u
inoremap <C-Z> <C-O>u
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

"NerdTree
noremap <F6> :NERDTreeToggle<CR>

"GUndo
nnoremap <F5> :GundoToggle<CR>

"FastSwitch for C-Types
map <C-Up> :FSAbove<CR>

"[FILETYPES]------------------------------------------------------------------
"Actionscript
au BufRead,BufNewFile *.as set ft=actionscript"
