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

Plugin 'https://github.com/vim-perl/vim-perl.git'
" turns out I had to compile vim with python
Plugin 'https://github.com/phongvcao/vim-stardict'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'mhinz/vim-startify'
Plugin 'mhinz/vim-janah'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'stephpy/vim-yaml'

" A real hassle to install, will try later...
" Plugin 'Valloric/YouCompleteMe'

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

" folding
"set foldmethod=syntax
"set foldlevelstart=1
"let perl_fold=1
"hi Folded ctermbg=242


"augroup vimrc
"  au BufReadPre * setlocal foldmethod=syntax | setlocal foldlevelstart=2 | let perl_fold=1
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END


set hlsearch
set textwidth=80

" highlight current line
color janah
set cursorline
" highlight the current line, make it ligther
hi CursorLine term=bold cterm=bold
highlight Search ctermbg=Yellow ctermfg=Black

" Make the cursor line number red:
hi cursorlinenr ctermfg=160 ctermbg=232

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
set number
set showcmd
set wildmenu
set showmatch
set incsearch
set hlsearch

" find files with CtrlP https://kien.github.io/ctrlp.vim/
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_max_files=0
" let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'
let g:ctrlp_switch_buffer = 0
" makes ctrlp open selected files in hidden buffers
let g:ctrlp_open_multiple_files = 'i'



" show file name, bottom left
" set ls=2




" It can be cumbersome to type CTRL-X CTRL-K. While in insert mode CTRL-N and CTRL-P will work.
" http://vim.wikia.com/wiki/Dictionary_completions
set dictionary+=/usr/share/dict/british-english
set spelllang=en,it
set spellsuggest=5
set complete+=k

" http://vim.wikia.com/wiki/Backspace_and_delete_problems
" backspace didnt work in same cases while in insert mode, this fixed it:
set backspace=indent,eol,start

" You can map a key to invoke any of the above commands. For example, the
" following map invokes the :Grep command to search for the keyword under the
" cursor (for plugin 'grep.vim'):
nnoremap <silent> <F2> :Rgrep<CR>


" show matching brackets
set showmatch

" Make vim-stardict split open in a :split (default value)
let g:stardict_split_horizontal = 1

" Set vim-stardict split width (or height) to 20 based on whether
" vim-stardict split is a :vsplit (or :split)
let g:stardict_split_size = 30

" This option should only be set if your Vim is compiled with +python
" and -python3 options (in other words, if your Vim doesn't support
" Python 3):
let g:stardict_prefer_python3 = 0



" OPTIONAL: You can change the colors of output of vim-stardict inside
" Vim as follow (see below for the comprehensive list of highlight
" group):
"highlight link stardictResult Special              " Default value
"highlight link stardictWord PreProc                " Default value
"highlight link stardictWordType Statement          " Default value
"highlight link stardictWordMeaning Identifier      " Default value
"highlight link stardictWordExample Type            " Default value
"highlight link stardictDictName Underlined         " Default value



function! s:center_header(lines) abort
  let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
  let centered_lines = map(copy(a:lines), 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

" let g:startify_custom_header = s:center_header(split(system('echo "It works!" | cowsay -f apt'), '\n'))
let g:startify_custom_header = s:center_header(split(system('tips | cowsay'), '\n'))
" Plugin: vim-startify {{{1

let g:startify_files_number = 20



" http://vim.wikia.com/wiki/Maximize_window_and_return_to_previous_split_structure
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

set viminfo='100,n$HOME/.vim/files/info/viminfo

set mouse=a

" only applies to vimdiff:
"highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red


" https://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ -p\ /home/feyruz/.agignore

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
" Normally the quickfix window is at the bottom of the screen.  If there are
" vertical splits, it's at the bottom of the rightmost column of windows.  To
" make it always occupy the full width:
"	:botright cwindow
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:botright cwindow<CR>
vnoremap K :<C-U>execute('grep! "\b' . g:Get_visual_selection() . '\b"\|botright cwindow')<CR><CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|botright cwindow|redraw!
" When \ is pressed, Vim waits for our input:
nnoremap \ :Ag<SPACE>

" so that visual selection search works with K search:
function! g:Get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
"  let line_joined = join(lines, "\n")
"  return escape(line_joined, "'")
endfunction

let g:startify_change_to_dir = 0
let g:NERDTreeChDirMode       = 2
let g:NERDTreeHighlightCursorline = 1
let g:ctrlp_working_path_mode = 0


function! StartNerdTreeOnCurrFileDir()
  NERDTree %:p:h
  cd /home/feyruz/dev/vX/WCN
endfunction


let mapleader = ","
nnoremap <F5> :call StartNerdTreeOnCurrFileDir()<CR>
nnoremap <F4> :NERDTreeToggle<CR>

" CtrlP find file under cursor
nmap <leader>lw :CtrlP<CR><C-\>w
" Lookup the word under cursor
nnoremap <leader>s :StarDictCursor<CR>
" Ready for typing the word in
nnoremap <leader>w :StarDict<Space>

nnoremap <leader><leader>t :TagbarToggle<CR>
nnoremap <leader><leader>h :cd /home/feyruz/dev/vX/WCN<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"close quickfix
nnoremap <leader>c :ccl<CR>

nnoremap j gj
nnoremap k gk

" enable find/replace word under cursor:
:nnoremap <Leader>r :%s/<C-r><C-w>//g<Left><Left>


" This is nerdtree via ctrlp open function
" function! NerdOpenFunc(action, line)
"     " Use CtrlP's default file opening function
"     call call('ctrlp#acceptfile', [a:action, a:line])
"     " Open NERDTree with its dir. set to current file's
"     NERDTree %
"     " Set pwd to where you want it to be
"     cd /home/feyruz/dev/vX/WCN
"     " Set the focus on the file opened, away from NERDTree browser window
"     wincmd p
" endfunction
" let g:ctrlp_open_func = { 'files': 'NerdOpenFunc' }

