"-----------------------------------------------------------------------[ INIT ]
" No longer need to set nocp in Neovim
filetype on
filetype off

"-----------------------------------------------------------------------[ DEIN ]

if (!isdirectory(expand('$XDG_DATA_HOME/nvim/bundle/repos/github.com/Shougo/dein.vim')))
    call system(expand('mkdir -p $XDG_DATA_HOME/nvim/bundle/repos/github.com'))
    call system(expand('git clone https://github.com/Shougo/dein.vim $XDG_DATA_HOME/nvim/bundle/repos/github.com/Shougo/dein.vim'))
endif

set runtimepath^=$XDG_DATA_HOME/nvim/bundle/repos/github.com/Shougo/dein.vim

call dein#begin(expand('$XDG_DATA_HOME/nvim/bundle'))

call dein#add('Shougo/dein.vim')

call dein#add('tpope/vim-fugitive')

call dein#add('spolu/dwm.vim')

call dein#add('Lokaltog/vim-easymotion')

call dein#add('bling/vim-airline')

call dein#add('ervandew/supertab')

call dein#add('junegunn/vim-easy-align')

call dein#add('ctrlpvim/ctrlp.vim')

call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')

call dein#add('tpope/vim-eunuch')

call dein#add('digitaltoad/vim-pug')

call dein#add('mhartington/oceanic-next')

call dein#end()

"-------------------------------------------------------------[ NEOVIM TOGGLES ]

if !has('nvim')
    set ttymouse=xterm2
endif

"--------------------------------------------------------------[ CONFIGURATION ]

filetype plugin indent on

"Show line numbers
set nu

"Column marker for 80 characters
set cc=80

"Always show statusline
set ls=2

"Show matching parens/brackets/etc...
set showmatch

"Searching
set incsearch
set hlsearch

"Autocompletion
set completeopt=menu,menuone,longest

"No backups or swap files
set nobackup
set noswapfile

"--------------------------------------------------------------------[ PLUGINS ]

"--------------------------------------------------------------------{ AIRLINE }

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='oceanicnext'

"----------------------------------------------------------------------{ CTRLP }

"This may not be the best way to ignore things
set wildignore+=*/node_modules/*

"Ignore anything not stored in git
let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"-------------------------------------------------------------{ VIM-JAVASCRIPT }

let g:javascript_plugin_jsdoc = 1

"-------------------------------------------------------------------{ SUPERTAB }

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"----------------------------------------------------------------------[ THEME ]

syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark
set encoding=utf-8

"Transparent background
"hi Normal ctermfg=255 ctermbg=none

"----------------------------------------------------------------[ KEYBINDINGS ]

"Save a keystroke when entering commands
nnoremap ; :

"Homerow escape to normal
inoremap jk <esc>

"No need for ex or macros mode
nnoremap Q <nop>
map q <nop>

"Easier to reach leader
let mapleader=","

"Normalise backspace
set backspace=2

"Line wrap based navigation
nnoremap j gj
nnoremap k gk

"Tabs
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>w :tabclose<CR>
nnoremap <leader>[ :tabprevious<CR>
nnoremap <leader>] :tabnext<CR>


"Tab Formatting
set expandtab
set smarttab
set autoindent
set copyindent
set softtabstop=4
set shiftwidth=4

"Use tabs in makefiles
autocmd FileType make setlocal noexpandtab

"Clear search highlights
nmap <silent> <leader>/ :nohlsearch<CR>

"Undo / Redo
noremap <C-Z> u
inoremap <C-Z> <C-O>u
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

"Format and return to current position
nnoremap FF gg=G``
