" ========== GENERAL CONFIGS ========= 
set number " display line numbers
set t_Co=256 " 256 colors
set encoding=utf-8 
set cursorline " Highlight line cursor is on
set incsearch " Search while typing
set hlsearch " Highlights all occurrences of search
set backspace=indent,eol,start " Fixes issues with backspace not working in insert mode
set hidden " Prevents buffer from being lost when switching
syntax on " Syntax highlighting

" Folding configs
set foldenable " Enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent


" ========== PYTHON CONFIGS  ========= 
" PEP8 styling"
au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix


" ========== PLUG DEPENDENCY INITIALIZATIONS  ========= 
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


" ========== VIM KEYBINDING REMAPS  ========= 
"  VIM Remap
inoremap jk <ESC>
vnoremap jk <ESC>

" Remap leader to space
let mapleader=" "
nnoremap <Space> <Nop>
nnoremap <leader>s :mksession! $HOME/session.vim<CR>

" FZF Remap
nnoremap <leader>f :Files<CR>

" Ripgrep Remap
nnoremap <leader>r :Rg<CR>

" Buffers Remap
nnoremap <leader>j :bp<CR>
nnoremap <leader>k :bn<CR>
nnoremap <leader>l :ls<CR>
nnoremap <leader>; :bufdo e<CR>

" Folding Remap
nnoremap <leader><space> za

" NERDTree Remap
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeFind<CR>

"YCM Remap
nnoremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Toggle search highlight Remap
let hlstate = 0
nnoremap <leader>/ :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<CR>

" ========== PLUGIN-SPECIFIC CONFIGS  ========= 
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

" YCM Config
let g:ycm_autoclose_preview_window_after_completion = 1

" Ale Config
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
