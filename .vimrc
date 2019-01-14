" Vim defaults
set number " display line numbers
set t_Co=256 " 256 colors
set encoding=utf-8 
set cursorline " Highlight line cursor is on
set incsearch " Search while typing
set hlsearch " Highlights all occurrences of search
syntax on " Syntax highlighting

" Folding configs
set foldenable " Enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent

set backspace=indent,eol,start

" PEP8 styling"
au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix

" Plug Repo Calls
call plug#begin('$HOME/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --java-completer' }
Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

"  VIM Remap
inoremap jk <ESC>
vnoremap jk <ESC>
let mapleader=" " " Remap leader to space
nnoremap <Space> <Nop>
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>j :bp<CR>
nnoremap <leader>k :bn<CR>
nnoremap <leader>l :ls<CR>
nnoremap <leader>; :bufdo e<CR>
nnoremap <leader><space> za

" Toggle search highlight
let hlstate = 0
nnoremap <leader>/ :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<CR>

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
let g:airline#extensions#ale#enabled = 1

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

 " Nerdtree Config
 let NERDTreeShowHidden=1
 nnoremap <leader> :NERDTreeToggle<CR>
 nnoremap <leader>m :NERDTreeFind<CR>

 " YCM Config
 let g:ycm_autoclose_preview_window_after_completion = 1
 map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

 " Ale Config
 let g:ale_lint_on_save = 1
 let g:ale_lint_on_text_changed = 1
