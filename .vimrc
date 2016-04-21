if v:progname =~? "evim"
  finish
endif

if v:version >= 700
	execute pathogen#infect()
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50
set ruler
set showcmd
set ts=4
set sw=4
set cindent
set si
set ic
set pastetoggle=<F2>
set incsearch
set hlsearch

" Don't use Ex mode, use Q for formatting
map Q gq
:nmap <silent> <F4> :w<CR>:!clear && mk<CR>
:nmap <silent> <F5> :w<CR>:!clear && cmprun -d %<CR>
:nmap <silent> <F6> :w<CR>:!clear && cmprun -c %<CR>

syntax on

colorscheme blw
let loaded_matchparen = 0
let c_comment_strings = 1

if has("autocmd")
  augroup vimrcEx
  autocmd!

  filetype plugin indent on

  autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  augroup END
endif

