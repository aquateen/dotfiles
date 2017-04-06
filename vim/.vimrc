set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim'
Plugin 'pangloss/vim-javascript'
Plugin 'kien/ctrlp.vim'
Plugin 'felikz/ctrlp-py-matcher'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/promptline.vim'
Bundle 'edkolev/tmuxline.vim'
Plugin 'chrisbra/csv.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable

set t_Co=256

set showcmd

set number

inoremap jj <Esc>
nnoremap JJJJ <Nop>

" Immediately load changes to vimrc
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set incsearch

set hlsearch

" No unseen buffers are open
set nohidden

set autoindent

set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

set ignorecase

set splitright
set splitbelow

hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
set cursorline! cursorcolumn!

set clipboard=unnamed

set laststatus=2

set wildchar=<Tab> wildmenu wildmode=full

set autoread

" To avoid Ex-mode
nnoremap Q <nop>

" Use ctags from projects dir
set tags=./tags;~/projects

set runtimepath^=~/.vim/bundle/ctrlp.vim

colorscheme tomorrow-night

let g:airline_theme='base16'
" let g:promptline_theme = 'airline'
" To get the chevron arrows to display properly
let g:airline_powerline_fonts = 1
" Fixes performance issues w/ CtrlP
" let g:airline#extensions#tabline#enabled = 1

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ --ignore "log"
      \ --ignore "tmp"
      \ -g ""'

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Fix backspace issue when beginning in insert mode
set backspace=indent,eol,start

" Highlight trailing whitespace
match ErrorMsg '\s\+$'

