" Vim defaults
set number
set t_Co=256
set encoding=utf-8
syntax on

set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smartindent
set smarttab

" Plug Repo Calls
call plug#begin('$HOME/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'

call plug#end()

" ESC VIM Remap
inoremap jk <ESC>
vnoremap jk <ESC>

" Base16 Vimrc command for sync vim and shell
if filereadable(expand("$HOME/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Airline Config
let g:airline_theme='base16_oceanicnext'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols='unicode'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Airline Symbols Config
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

 " old vim-powerline symbols
 let g:airline_left_sep = '⮀'
 let g:airline_left_alt_sep = '⮁'
 let g:airline_right_sep = '⮂'
 let g:airline_right_alt_sep = '⮃'
 let g:airline_symbols.branch = '⭠'
 let g:airline_symbols.readonly = '⭤'
 let g:airline_symbols.linenr = '⭡'
