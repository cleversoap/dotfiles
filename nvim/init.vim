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

call dein#add('neomake/neomake')

if executable('vint')
    call dein#add('Kuniwak/vint')
endif

call dein#add('spolu/dwm.vim')

call dein#add('Lokaltog/vim-easymotion')

call dein#add('bling/vim-airline')

call dein#add('ervandew/supertab')

call dein#add('junegunn/vim-easy-align')

call dein#add('ctrlpvim/ctrlp.vim')

call dein#add('Shougo/deoplete.nvim')

if executable('ghc-mod')
    call dein#add('eagletmt/neco-ghc')
endif

call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')

call dein#add('nathanaelkane/vim-indent-guides')

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
let g:javascript_opfirst = '\%([,:?^%]\|\([-/+]\)\%(\1\|\*\|\/\)\@!\|\*\/\@!\|=>\@!\||\|&\|in\%(stanceof\)\=\>\)\C'

"--------------------------------------------------------------------{ NEOMAKE }

let g:neomake_place_signs = 1
let g:neomake_open_list = 1
let g:neomake_warning_sign = { 'text': '>', 'texthl': 'NeomakeWarningSignDefault' }
let g:neomake_error_sign = { 'text': '>', 'texthl': 'NeomakeErrorSignDefault' }
autocmd BufUnload * lclose

"-------------------------------------------------------------------{ DEOPLETE }

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#disable_auto_complete = 1

augroup deoplete
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

"------------------------------------------------------------------{ FILETYPES }

"Quickfix
augroup quickfix
    autocmd FileType qf setlocal nonumber
    autocmd FileType qf setlocal colorcolumn=
augroup END

"Haskell
if executable('ghc-mod')
    let g:haskellmode_completion_ghc = 0
    let g:necoghc_enable_detailed_browse = 1
    augroup haskell
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
        "autocmd FileType haskell map <buffer> <leader>' :echo 'ghc-mod lint this-bloody-file' <CR>
    augroup END
endif

"Vimscript
if executable('vint')
    let g:neomake_vim_enabled_makers = ['vint']
    augroup neomake_vim
        autocmd BufWritePost *.vim Neomake vint
    augroup END
endif

"-------------------------------------------------------------------{ SUPERTAB }

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"--------------------------------------------------------------{ INDENT-GUIDES }

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:indent_guides_exclude_filetypes = ['help', 'vim', 'javascript', 'haskell']

"Indent Guides cannot be enabled cleanly just for one buffer - it is global
"and while I'm not a fan of this hack it's cleaner than trying to include
"an ignore for ALL filetypes but the one I want.
"augroup indents
"    autocmd BufEnter * if &ft ==# 'sass' | IndentGuidesEnable | endif
"    autocmd BufLeave * if &ft ==# 'sass' | IndentGuidesDisable | endif
"augroup END

"----------------------------------------------------------------------[ THEME ]

syntax enable
colorscheme OceanicNext

"Some terminals that don't properly report capabilities will fail rendering
"the background with this (eg. Guake) as well as some themes that don't report
"gui colours
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

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
augroup makefile
    autocmd FileType make setlocal noexpandtab
augroup END

"Clear search highlights
nmap <silent> <leader>/ :nohlsearch<CR>

"Undo / Redo
noremap <C-Z> u
inoremap <C-Z> <C-O>u
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

"Format and return to current position
nnoremap FF gg=G``

"List navigation
nnoremap l] :lnext<CR>
nnoremap l[ :lprevious<CR>
nnoremap lo :lopen<CR>
nnoremap lq :lclose<CR>
