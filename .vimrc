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
" Plugin 'https://github.com/zakj/vim-showmarks.git'
" Plugin 'https://github.com/jacquesbh/vim-showmarks.git'
Plugin 'https://github.com/vim-perl/vim-perl.git'

" looks crappy, all kinds of python errors...
Plugin 'https://github.com/phongvcao/vim-stardict'

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
syntax on
syntax enable


" Makes sure that a buffer is automatically hidden
set hidden
" mouse is on
" set mouse=a
" folding
set foldmethod=syntax
set foldlevelstart=1
let perl_fold=1
hi Folded ctermbg=242


"augroup vimrc
"  au BufReadPre * setlocal foldmethod=syntax | setlocal foldlevelstart=2 | let perl_fold=1 
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END


set hlsearch
set textwidth=80

" highlight if exceeds 80 chars:
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" highlight current line
" https://stackoverflow.com/questions/8640276/how-do-i-change-my-vim-highlight-line-to-not-be-an-underline
color desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

"set list


" Let's try the DavidGE way...
"Perl and Template Toolkit improvements:
function! FixPerl()
  " Fix perl man
  setlocal keywordprg=perldoc\ 

  " Fix gf for Perl
  setlocal path=.,~/dev/vX/WCN/lib/,~/dev/vX/WCN/t/lib/,~/dev/vX/WCN/template/
  setlocal isfname+=:
  setlocal suffixesadd+=.pm,pl,tt
  setlocal includeexpr=substitute(v:fname,'::','/','g')
  setlocal tags=~/.vim/tags/tags
endfunction

function! FixTT()
   set filetype=tt2
   setlocal path=.,/usr/include,~/dev/vX/WCN/template/,,
endfunction

augroup perl
  autocmd!
  autocmd BufRead,BufNewFile *.tt call FixTT()
  autocmd FileType perl call FixPerl()
augroup END

" http://dougblack.io/words/a-good-vimrc.html
colorscheme badwolf
set number
set showcmd
set cursorline
set wildmenu
set showmatch
set incsearch
set hlsearch
nnoremap j gj
nnoremap k gk
let mapleader = ","
nnoremap <leader>s :mksession<CR>

" find files with CtrlP https://kien.github.io/ctrlp.vim/
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_max_files=0
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" show file name, bottom left
" set ls=2

" map CTRL-tab to next buffer
:nnoremap <C-I> :bnext<CR>
:nnoremap <F4> :bnext<CR>
:nnoremap <F3> :bprev<CR>

" http://vim.wikia.com/wiki/Easier_buffer_switching
:nnoremap <F5> :buffers<CR>:buffer<Space>

" It can be cumbersome to type CTRL-X CTRL-K. While in insert mode CTRL-N and CTRL-P will work.
" http://vim.wikia.com/wiki/Dictionary_completions
set dictionary+=/usr/share/dict/british-english
set spelllang=en,it
set spellsuggest=5
set complete+=k
