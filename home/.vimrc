"-----------------------------------------------------------------------[ INIT ]

set nocompatible
filetype on
filetype off

"-------------------------------------------------------------------------[ OS ]

function! GetRunningOS()
    if has("win32")
        return "win"
    endif
    if has("unix")
        if system('uname')=~'Darwin'
            return "mac"
        else
            return "linux"
        endif
    endif
endfunction
let os=GetRunningOS()

"------------------------------------------------------------------[ NEOBUNDLE ]

if has('vim_starting')
    set rtp+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

"Set the install timeout to an hour
let g:neobundle#install_process_timeout = 3600

"--------------------------------------------------------------------{ BUNDLES }

"Needed by other plugins that rely on git functionality rather than
"being used for vim embedded git.
NeoBundle 'tpope/vim-fugitive'

"Needed because not all changes are good changes and it fills the gap
"between git commits.
NeoBundle 'sjl/gundo.vim'

"Needed primarily for quick visual selection.
NeoBundle 'Lokaltog/vim-easymotion'

"Needed for occasionally useful file opening on start without sessions.
NeoBundle 'mhinz/vim-startify'

"Needed primarily to quickly and cleanly align class members.
NeoBundle 'godlygeek/tabular'

"Needed for aligning more complex values
NeoBundle 'junegunn/vim-easy-align'

"Needed for fast switching between header/implementation files quickly
"rather than juggling buffers.
NeoBundle 'derekwyatt/vim-fswitch'

"Needed primarily for opening files in large projects quickly. However, the
"ctag integration is also helpful for override referencing.
NeoBundle 'kien/ctrlp.vim'

"Needed for AS3 development - just lightweight syntax colours.
NeoBundle 'jeroenbourgois/vim-actionscript'

"Needed for quick and easy window management that mimics my natural layout.
NeoBundle 'spolu/dwm.vim'

"Needed primarily for a quick overview of file metadata. Custom ctags
"integration make it extremely useful.
NeoBundle 'majutsushi/tagbar'

"Needed for writing shaders
NeoBundle 'tikhomirov/vim-glsl'

"Needed for cleaner sudo writing and buffer moving that synchronises
"with file moving. Replaced a keymapping just for sudo writing.
NeoBundle 'tpope/vim-eunuch'

"Needed for better completion as having to use ctrl+space is bothersome
"in some configurations
NeoBundle 'ervandew/supertab'

"Needed to fix some issues with Javascript indenting as cindent
"doesn't really handle it well.
NeoBundle 'vim-scripts/JavaScript-Indent'

"Needed for gradle build scripts
NeoBundle 'tfnico/vim-gradle'

"Needed to edit haxe / nme / lime et al files
"and provides some convenience for project management and autocomplete
NeoBundle 'jdonaldson/vaxe'

"Needed to edit golang
NeoBundle 'fatih/vim-go'

"Needed to edit rust
NeoBundle 'wting/rust.vim'

"Needed for helping me write cleaner code with certain linters (eg. jslint)
NeoBundle 'scrooloose/syntastic'

"Needed to quickly fix trailing whitespace
NeoBundle 'bronson/vim-trailing-whitespace'

"Needed to handle virtualenvs in python files
NeoBundle 'jmcantrell/vim-virtualenv', {
            \   'autoload' : {
            \       'filetypes' : ['python', 'python3']
            \   }
            \ }

"Needed for python development
NeoBundleLazy 'davidhalter/jedi-vim', {
            \   'autoload' : {
            \       'filetypes' : ['python', 'python3'],
            \    },
            \   'build' : {
            \       'others': 'git submodule update --init'
            \   }
            \ }

"Needed to make vim look pretty, everybody else is doing it.
NeoBundle 'bling/vim-airline'
NeoBundle 'whatyouhide/vim-gotham'

call neobundle#end()

"--------------------------------------------------------------[ CONFIGURATION ]

filetype plugin indent on

"Show line numbers
set nu

"Column width is 80 for all languages. Handy for python compliance with PEP 8
"but also just as a general syntax 'guideline' to keep things tidy
set cc=80

"Always show the statusline
set ls=2

"Show matching parens/brackets/etc...
set showmatch

"Search
set incsearch
set hlsearch

"Autocompletion
set completeopt=menu,menuone,longest

"Backup and swap, can still manually enable swap for large files.
set nobackup
set noswapfile

"Tagfile location, go up in directories until a tag file is found.
set tags=./tags;,tags;

"--------------------------------------------------------------------{ AIRLINE }

let g:airline_left_sep=''
let g:airline_right_sep=''

"---------------------------------------------------------------------{ TAGBAR }

"Actionscript
let g:tagbar_type_actionscript = {
            \ 'ctagstype' : 'actionscript',
            \ 'kinds'     : [
            \ 'c:class',
            \ 'C:constant',
            \ 'v:variable',
            \ 'p:property',
            \ 'f:function'
            \ ]
            \ }

"------------------------------------------------------------------{ SYNTASTIC }

"General
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { "mode": "passive",
            \ "active_filetypes": ["javascript", "json", "python"],
            \ "passive_filetypes": ["java"] }
"Javascript
let g:syntastic_javascript_checkers = ['jshint']

"Python
let g:syntastic_python_checkers = ['flake8']

"---------------------------------------------------------------------{ VIM-GO }

"Disable the gofmt error on save as it is annoying
let g:go_fmt_fail_silently=1
let g:go_fmt_autosave = 0

"----------------------------------------------------------------------{ CTRLP }

"Disable searching node_modules directory
"This uses the global wildignore rather than ctrlp_custom_ignore
set wildignore+=*/node_modules/*

"-----------------------------------------------------------------------{ JEDI }

let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
let g:jedi#rename_command = '<leader>r'
let g:jedi#popup_select_first = 1
let g:jedi#completions_command = '<Tab>'

"autocmd MyAutoCmd FileType python*
"            \ NeoBundleSource jedi-vim | let b:did_ftplugin = 1
"let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'

"----------------------------------------------------------------------[ THEME ]

syntax on
set t_Co=256
set background=dark
set encoding=utf-8
if has("gui_running")
    colorscheme gotham
    set guifont=ProggyCleanTT\ 12
    if os == "mac"
        set guifont=ProggyCleanTT:h16
    endif
    set guioptions-=m "No Menubar
    set guioptions-=T "No Toolbar
    set guioptions-=r "No scrollbar
    set guioptions-=L "No scrollbar... again
else
    colorscheme gotham256
endif
"Transparent Background
hi Normal ctermfg=255 ctermbg=none

"---------------------------------------------------------------[ KEY BINDINGS ]

"Force correct navigation usage
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"Save a keystroke when entering commands
nnoremap ; :

"Homerow escape to normal
inoremap jk <esc>

"Leader to easier to reach position
let mapleader=","

"Backspace acts as it does in other apps
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

"GUndo
nnoremap <F5> :GundoToggle<CR>

"FastSwitch for C-Types
map <C-Up> :FSAbove<CR>

"Tagbar
map <F6> :TagbarToggle<CR>

"CtrlP Tag Search
nnoremap <S-P> :CtrlPTag<cr>

"Easy-Align
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

"------------------------------------------------------------------[ FILETYPES ]

"Actionscript
au BufRead,BufNewFile *.as set ft=actionscript

"-----------------------------------------------------------------------[ MISC ]

"Installation Check
NeoBundleCheck
