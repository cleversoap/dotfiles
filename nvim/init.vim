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

call dein#add('scrooloose/nerdtree')

call dein#add('spolu/dwm.vim')

call dein#add('vim-syntastic/syntastic')

call dein#add('Lokaltog/vim-easymotion')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

call dein#add('ervandew/supertab')

call dein#add('junegunn/vim-easy-align')

call dein#add('ctrlpvim/ctrlp.vim')

call dein#add('Shougo/deoplete.nvim')

call dein#add('Shougo/neosnippet.vim')

call dein#add('davidhalter/jedi-vim')
call dein#add('zchee/deoplete-jedi')

call dein#add('hynek/vim-python-pep8-indent')

if executable('ghc-mod')
    call dein#add('eagletmt/neco-ghc')
endif

call dein#add('pangloss/vim-javascript')

call dein#add('mxw/vim-jsx')

call dein#add('HerringtonDarkholme/yats.vim')

call dein#add('ianks/vim-tsx')

if executable('tsserver')
    call dein#add('mhartington/nvim-typescript')
endif

call dein#add('sbdchd/neoformat')

call dein#add('elixir-lang/vim-elixir')

call dein#add('nathanaelkane/vim-indent-guides')

call dein#add('metakirby5/codi.vim')

call dein#add('tpope/vim-eunuch')

call dein#add('tpope/vim-dispatch')

call dein#add('radenling/vim-dispatch-neovim')

call dein#add('digitaltoad/vim-pug')

call dein#add('octol/vim-cpp-enhanced-highlight')

call dein#add('vim-scripts/scons.vim')

call dein#add('ntpeters/vim-better-whitespace')

call dein#add('jparise/vim-graphql')

call dein#add('tikhomirov/vim-glsl')

call dein#add('kovetskiy/sxhkd-vim')

call dein#add('joshdick/onedark.vim')

call dein#add('cleversoap/gloom.vim')

call dein#end()

"-------------------------------------------------------------[ NEOVIM TOGGLES ]

if !has('nvim')
    set ttymouse=xterm2
endif

"--------------------------------------------------------------[ CONFIGURATION ]

filetype plugin indent on

"Show line numbers
set number

"Column marker for 80 characters
set colorcolumn=80

"Always show statusline
set laststatus=2

"Show matching parens/brackets/etc...
set showmatch

"Searching
set incsearch
set hlsearch

"Autocompletion
setl completeopt=menu,menuone,longest

"No backups or swap files
set nobackup
set noswapfile

"Timeouts - this is in an effort to resolve an issue with certain keys
"having a delay when entering normal mode from insert
"eg. Leave Insert, Enter Normal, pressing h is quick, pressing l has a delay
"set esckeys
set ttimeout
set ttimeoutlen=0
set nocursorline

"----------------------------------------------------------------------[ THEME ]

"Some terminals that don't properly report capabilities will fail rendering
"the background with this (eg. Guake) as well as some themes that don't report
"gui colours
if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif

set encoding=utf-8

"syntax enable
syntax on
hi clear
colorscheme gloom

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
let g:mapleader = ','

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

"Toggle NERDTREE
nmap <leader>e :NERDTreeToggle<CR>

"Syntax group under cursor
nnoremap <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"--------------------------------------------------------------------[ PLUGINS ]

"--------------------------------------------------------------------{ AIRLINE }

let g:airline_powerline_fonts = 0

let g:airline_theme = 'onedark'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_skip_empty_sections = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.columnr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.readonly = '[READONLY]'
let g:airline_symbols.maxlinenr = ''

"----------------------------------------------------------------------{ CTRLP }

"This may not be the best way to ignore things
set wildignore+=*/node_modules/*

"Ignore anything not stored in git
let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"-------------------------------------------------------------{ VIM-JAVASCRIPT }

let g:javascript_plugin_jsdoc = 1
let g:javascript_opfirst = '\%([,:?^%]\|\([-/+]\)\%(\1\|\*\|\/\)\@!\|\*\/\@!\|=>\@!\||\|&\|in\%(stanceof\)\=\>\)\C'

augroup babel
    autocmd BufNewFile,BufRead .babelrc setlocal ft=json
augroup END

"--------------------------------------------------------------------{ VIM-JSX }

let g:jsx_ext_required = 0

"-----------------------------------------------------------------{ TYPESCRIPT }

let g:tsuquyomi_completion_detail = 1
augroup typescript
    autocmd FileType typescript setlocal softtabstop=2
    autocmd FileType typescript setlocal shiftwidth=2
    autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
    autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
augroup END

"-----------------------------------------------------------------------{ GLSL }
augroup glsl
    autocmd BufNewFile,BufRead *.vs,*.fs setlocal filetype=glsl
augroup END

"------------------------------------------------------------------{ NEOFORMAT }

if executable('prettier')
    let g:neoformat_javascript_prettier = {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--tab-width 4'],
        \ 'stdin': 1
        \ }
endif

"--------------------------------------------------------------------{ NEOMAKE }

let g:neomake_place_signs = 1
let g:neomake_open_list = 1
let g:neomake_warning_sign = { 'text': '>', 'texthl': 'NeomakeWarningSignDefault' }
let g:neomake_error_sign = { 'text': '>', 'texthl': 'NeomakeErrorSignDefault' }
augroup neomake
    autocmd BufUnload * lclose
augroup END

"-------------------------------------------------------------------{ DEOPLETE }

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

augroup deoplete
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

"----------------------------------------------------------------{ NEOSNIPPETS }

let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '$XDG_CONFIG_HOME/nvim/snippets'

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif

"-------------------------------------------------------------------{ VIM-JEDI }

let g:jedi#completions_enabled = 1
let g:jedi#auto_vim_configuration = 0

"-----------------------------------------------------------------{ MUCOMPLETE }

"MUcompleteAutoOn *.py

"------------------------------------------------------------------{ FILETYPES }

"zsh
augroup zsh
    autocmd BufNewFile,BufRead zprofile,.zprofile setlocal filetype=zsh
augroup END

"Quickfix
augroup quickfix
    autocmd FileType qf setlocal nonumber
    autocmd FileType qf setlocal colorcolumn=
augroup END

"Python
augroup python
    autocmd FileType python setlocal omnifunc=jedi#completions
augroup END

"JSON
augroup json
    autocmd FileType json setlocal softtabstop=4
    autocmd FileType json setlocal shiftwidth=4
    autocmd FileType json setlocal conceallevel=0
augroup END

"Javascript
augroup javascript
    autocmd FileType javascript setlocal colorcolumn=80,120
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

"Scons
augroup scons
    au BufNewFile,BufRead SCons* set filetype=scons
augroup END

"Makefile
augroup makefile
    autocmd FileType make setlocal noexpandtab
augroup END

"-------------------------------------------------------------------{ SUPERTAB }

let g:SuperTabDefaultCompletionType = '<C-X><C-O>'

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


