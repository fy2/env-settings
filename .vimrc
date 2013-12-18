"Indentation"
"For indentation without tabs, the principle is to set 'expandtab', and set
"'shiftwidth' and 'softtabstop' to the same value, while leaving 'tabstop' at
"its default value
set expandtab
set shiftwidth=4
set softtabstop=4
"set autoindent
syntax on
set dictionary-=/usr/share/dict/british-english dictionary+=/usr/share/dict/british-english
set complete-=k complete+=k
