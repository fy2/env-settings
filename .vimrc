"" this is all for VUNDLE
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"This one works poorly! 
Plugin 'https://github.com/zakj/vim-showmarks.git'
" Plugin 'https://github.com/jacquesbh/vim-showmarks.git'
Plugin 'https://github.com/vim-perl/vim-perl.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




"Indentation"
"For indentation without tabs, the principle is to set 'expandtab', and set
"'shiftwidth' and 'softtabstop' to the same value, while leaving 'tabstop' at
"its default value
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set number
"set autoindent
syntax on
set dictionary+=/usr/share/dict/british-english
set spelllang=en,it
set spellsuggest=5

" Makes it possible to run
" find FILENAME
" the ** makes the search recursive
set path+=/home/feyruz/dev/vX,**

" Makes sure that a buffer is automatically hidden
set hidden
" mouse is on
" set mouse=a
" folding
set foldmethod=syntax
set foldlevelstart=1
let perl_fold=1
hi Folded ctermbg=242

" http://vim.wikia.com/wiki/Easier_buffer_switching
:nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap <F4> :marks<CR>

"augroup vimrc
"  au BufReadPre * setlocal foldmethod=syntax | setlocal foldlevelstart=2 | let perl_fold=1 
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END

