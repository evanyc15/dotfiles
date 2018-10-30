" Plug Repo Calls
call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'

call plug#end()

" ESC VIM Remap
inoremap jk <ESC>
vnoremap jk <ESC>

" Base16 Vimrc command for sync vim and shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
