" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

let g:solarized_termcolors=256
set number
set nocompatible
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
"let loaded_matchparen = 1
set shell=fish
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Add asterisks in block comments
set formatoptions+=r

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescript
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

"-------------------------------------------------------------------------------
" Cursor line
"-------------------------------------------------------------------------------

set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr       cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"-------------------------------------------------------------------------------
" Other plugins
"-------------------------------------------------------------------------------

" vim-go
let g:go_disable_autoinstall = 1

" vim-json
let g:vim_json_syntax_conceal = 0

" JSX
let g:jsx_ext_required = 0

" Tern
" Disable auto preview window
set completeopt-=preview

" localvimrc
let g:localvimrc_ask = 0

filetype plugin indent on

" vim-plug
call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'neovim/python-client'
Plug 'neoclide/coc.nvim'
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'
Plug 'stephpy/vim-yaml'
Plug 'dag/vim-fish'
Plug 'yuezk/vim-js'
Plug 'dart-lang/dart-vim-plugin'
call plug#end()

"-------------------------------------------------------------------------------
" DevIcons
"-------------------------------------------------------------------------------

set guifont=Dejavu\ Sans\ Mono\ Nerd\ Font:h11
let g:webdevicons_enable_vimfiler = 1

"-------------------------------------------------------------------------------
" Color scheme
"-------------------------------------------------------------------------------
syntax enable
set background=dark
colorscheme solarized

"-------------------------------------------------------------------------------
" mports
"-------------------------------------------------------------------------------
"
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
inoremap <silent><expr> <c-space> coc#refresh()

if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    source ~/.vimrc.osx
  endif
endif

source ~/.vimrc.maps
source ~/.vimrc.lightline

set exrc
let g:ale_python_pylint_change_directory=0
let g:ale_python_flake8_change_directory=0
