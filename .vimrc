" ========== GENERAL CONFIGS ========= 
set number " display line numbers
set t_Co=256 " 256 colors
set encoding=utf-8 
set cursorline " Highlight line cursor is on
set incsearch " Search while typing
set hlsearch " Highlights all occurrences of search
set backspace=indent,eol,start " Fixes issues with backspace not working in insert mode
set hidden " Prevents buffer from being lost when switching
set scrolloff=4 "Keep 4 lines at minimum above & below the cursor when scrolling around a file
set nocompatible
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME
set termguicolors

syntax on " Syntax highlighting
filetype on

" Enable syntax highlighting when buffers were loaded through :bufdo, which
" disables the Syntax autocmd event to speed up processing.
augroup EnableSyntaxHighlighting
    " Filetype processing does happen, so we can detect a buffer initially
    " loaded during :bufdo through a set filetype, but missing b:current_syntax.
    " Also don't do this when the user explicitly turned off syntax highlighting
    " via :syntax off.
    " Note: Must allow nesting of autocmds so that the :syntax enable triggers
    " the ColorScheme event. Otherwise, some highlighting groups may not be
    " restored properly.
    autocmd! BufWinEnter * nested if exists('syntax_on') && ! exists('b:current_syntax') && ! empty(&l:filetype) | syntax enable | endif

    " The above does not handle reloading via :bufdo edit!, because the
    " b:current_syntax variable is not cleared by that. During the :bufdo,
    " 'eventignore' contains "Syntax", so this can be used to detect this
    " situation when the file is re-read into the buffer. Due to the
    " 'eventignore', an immediate :syntax enable is ignored, but by clearing
    " b:current_syntax, the above handler will do this when the reloaded buffer
    " is displayed in a window again.
    autocmd! BufRead * if exists('syntax_on') && exists('b:current_syntax') && ! empty(&l:filetype) && index(split(&eventignore, ','), 'Syntax') != -1 | unlet! b:current_syntax | endif
augroup END

" Turn off syntax highlighting for large files to prevent vim slowdown
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif


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
        \ set textwidth=0 |
	\ set wrap |
	\ set linebreak |
        \ set expandtab |
        \ set autoindent |
        \ set fileformat=unix

" JS/JSX styling"
au BufNewFile,BufRead *.js,*.jsx
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set expandtab

" HTML styling
au BufNewFile,BufRead *.html
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set expandtab

" CSS styling
au BufNewFile,BufRead *.css
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab

" SQL Styling
au BufNewFile,BufRead *.ql set filetype=sql

" YML styling"
au BufNewFile,BufRead *.yml
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |
	\ set expandtab

" ========== PLUG DEPENDENCY INITIALIZATIONS  ========= 
" Plug Repo Calls
call plug#begin('$HOME/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --java-completer --tern-completer' }
Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'shmup/vim-sql-syntax'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'tpope/vim-commentary'

call plug#end()


" ========== VIM KEYBINDING REMAPS  ========= 
"  VIM Remap
inoremap jk <ESC>
vnoremap jk <ESC>

" Remap leader to space
let mapleader=" "
nnoremap <Space> <Nop>

" FZF Remap
nnoremap <leader>f :Files<CR>

" Ripgrep Remap
nnoremap <leader>r :Rg<CR>

" Buffers Remap
nnoremap <leader>j :bp<CR>
nnoremap <leader>k :bn<CR>
nnoremap <leader>l :ls<CR>
nnoremap <leader>; :bufdo e<CR>
nnoremap <leader>h :bd<CR>

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

" Vim base16theme set
colorscheme base16-monokai

" Airline Config
let g:airline_theme='base16_monokai'
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
let g:NERDTreeWinSize=60

" YCM Config
let g:ycm_autoclose_preview_window_after_completion = 1

" Ale Config
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
	\'javascript': ['flow', 'eslint'],
	\'python': ['flake8'],
\}
let g:ale_linters_ignore=['tsserver']
let g:ale_javascript_eslint_use_global = 1
