"[INITIALISE]-----------------------------------------------------------------
set nocompatible
filetype on
filetype off

"[OS]-------------------------------------------------------------------------
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

"[NEOBUNDLE]------------------------------------------------------------------
if has('vim_starting')
    set rtp+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

"Set the install timeout to an hour
let g:neobundle#install_process_timeout = 3600

"[BUNDLES]--------------------------------------------------------------------
"Needed by other plugins that rely on git functionality rather than
"being used for vim embedded git.
NeoBundle 'tpope/vim-fugitive'

"Needed for working on larger projects with many directories, in particular
"those that use the directory structure for namespacing (eg. AS3)
NeoBundle 'scrooloose/nerdtree'

"Needed because not all changes are good changes and it fills the gap
"between git commits.
NeoBundle 'sjl/gundo.vim'

"Needed primarily for quick visual selection.
NeoBundle 'Lokaltog/vim-easymotion'

"Needed for occasionally useful file opening on start without sessions.
NeoBundle 'mhinz/vim-startify'

"Needed primarily to quickly and cleanly align class members.
NeoBundle 'godlygeek/tabular'

"Needed for fast switching between header/implementation files without.
NeoBundle 'derekwyatt/vim-fswitch'

"Needed primarily for opening files in large projects quickly. However, the
"ctag integration is also helpful for override referencing.
NeoBundle 'kien/ctrlp.vim'

"Needed for the time being, just lightweight syntax colours.
NeoBundle 'jeroenbourgois/vim-actionscript'

"Needed for quick and easy window management that mimics my natural layout.
NeoBundle 'dwm.vim'

"Needed primarily for a quick overview of file metadata. Custom ctags
"integration make it extremely useful.
NeoBundle 'majutsushi/tagbar'

"Needed for javascript work that others will read and use.
NeoBundle 'hallettj/jslint.vim'

"Needed for writing shaders
NeoBundle 'tikhomirov/vim-glsl'

"Needed for cleaner sudo writing and buffer moving that synchronises
"with file moving.
NeoBundle 'tpope/vim-eunuch'

"Needed for better completion as having to use ctrl+space is bothersome
"in some configurations
NeoBundle 'ervandew/supertab'

"Needed for clang completion - I have reverted to using this all other
"plugins, such as clang_complete and vim-clang, are simply too slow when
"providing suggestions.
if os == 'linux'
    NeoBundleLazy 'Valloric/YouCompleteMe' , {
                \ 'build' : {
                \   'unix' : './install.sh --clang-completer'
                \ },
                \ 'autoload' : {
                \   'filetypes': ['cpp', 'c']
                \ },
                \ }
endif

"Needed to make vim look pretty, everybody else is doing it.
NeoBundle 'Lokaltog/powerline'
NeoBundle 'Lokaltog/powerline-fonts'
NeoBundle 'chriskempson/vim-tomorrow-theme'

"[CONFIGURATION]--------------------------------------------------------------
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

"[PLUGINS']-------------------------------------------------------------------
"[Powerline]
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

"Automatically generate ctags on save
"of any file type; will need to see if I should put the filter back in
au BufWritePost *.hx, *.as, *.c, *.cpp, *.h, *.hpp, *.py, *.js silent! !/usr/local/bin/ctags -R &

"[Tagbar]
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


"[THEME]----------------------------------------------------------------------
syntax on
set t_Co=256
set background=dark
set encoding=utf-8
colorscheme Tomorrow-Night
if has("gui_running")
    set guifont=Anonymice\ Powerline
    set guioptions-=m "No Menubar
    set guioptions-=T "No Toolbar
    set guioptions-=r "No scrollbar
endif
"Transparent Background
hi Normal ctermfg=255 ctermbg=none

"[KEYS]-----------------------------------------------------------------------
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

"NerdTree
noremap <F6> :NERDTreeToggle<CR>

"GUndo
nnoremap <F5> :GundoToggle<CR>

"FastSwitch for C-Types
map <C-Up> :FSAbove<CR>

"Tagbar
map <S-F5> :TagbarToggle<CR>

"CtrlP Tag Search
nnoremap <S-P> :CtrlPTag<cr>

"Ruby Check Syntax
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

"[FILETYPES]------------------------------------------------------------------
"Actionscript
au BufRead,BufNewFile *.as set ft=actionscript"

"Installation Check
NeoBundleCheck
