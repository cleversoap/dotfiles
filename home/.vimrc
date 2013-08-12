"[INITIALISE]-----------------------------------------------------------------
set nocompatible
filetype on
filetype off

"[VUNDLE]---------------------------------------------------------------------
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

"[BUNDLES]--------------------------------------------------------------------
"Needed by other plugins that rely on git functionality rather than
"being used for vim embedded git.
Bundle 'tpope/vim-fugitive'

"Needed for working on larger projects with many directories, in particular
"those that use the directory structure for namespacing (eg. AS3)
Bundle 'scrooloose/nerdtree'

"Needed because not all changes are good changes and it fills the gap
"between git commits.
Bundle 'sjl/gundo.vim'

"Needed primarily for quick visual selection.
Bundle 'Lokaltog/vim-easymotion'

"Needed for occasionally useful file opening on start without sessions.
Bundle 'mhinz/vim-startify'

"Needed primarily to quickly and cleanly align class members.
Bundle 'godlygeek/tabular'

"Needed for fast switching between header/implementation files without.
Bundle 'derekwyatt/vim-fswitch'

"Needed primarily for opening files in large projects quickly. However, the
"ctag integration is also helpful for override referencing.
Bundle 'kien/ctrlp.vim'

"Needed for the time being, just lightweight syntax colours.
Bundle 'jeroenbourgois/vim-actionscript'

"Needed for quick and easy window management that mimics my natural layout.
Bundle 'dwm.vim'

"Needed for the occasionally useful completion of non-tagged items.
Bundle 'Shougo/neocomplcache'

"Needed primarily for a quick overview of file metadata. Custom ctags
"integration make it extremely useful.
Bundle 'majutsushi/tagbar'

"Needed for HAXE development, primarily just for good syntax highlighting.
Bundle 'jdonaldson/vaxe'

"Needed for javascript work that others will read and use.
Bundle 'hallettj/jslint.vim'

"Needed for the occasionally useful editing and comparison of code on opposite
"ends of a file or changing of super class code.
Bundle 'chrisbra/NrrwRgn'

"Needed to make vim look pretty, everybody else is doing it.
Bundle 'Lokaltog/powerline'
Bundle 'Lokaltog/powerline-fonts'
Bundle 'chriskempson/vim-tomorrow-theme'

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

"[Neocomplcache]
"Enable at startup
let g:neocomplcache_enable_at_startup = 1

"Case completions
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

"Filetype Specific Completions
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType cpp set omnifunc=cppcomplete#Complete

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
	set guifont=Menlo\ for\ Powerline
	set guioptions-=m "No Menubar
	set guioptions-=T "No Toolbar
	set guioptions-=r "No scrollbar
endif

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

"SUDO write a file (useful if accidentally opened without proper permissions)
cmap w!! w !sudo tee % >/dev/null

"[FILETYPES]------------------------------------------------------------------
"Actionscript
au BufRead,BufNewFile *.as set ft=actionscript"
