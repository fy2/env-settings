#export http_proxy=http://wwwcache.sanger.ac.uk:3128
#export https_proxy=http://wwwcache.sanger.ac.uk:3128

#PATH=$PATH:/Users/fy2/bin:/Users/fy2/homebrew/bin:/Users/fy2/perl5/perlbrew/bin:/Users/fy2/Downloads/MacVim-snapshot-64
PATH=/Users/fy2/bin:/Users/fy2/homebrew/bin:/Users/fy2/perl5/perlbrew/bin:/Users/fy2/Downloads/MacVim-snapshot-64:$PATH

#add ncbi blast
PATH=/Users/fy2/software/NCBI_BLAST/ncbi-blast-2.2.28+-src/c++/GCC421-Debug64/bin/:$PATH
PATH=/Users/fy2/homebrew/sbin:$PATH

source ~/perl5/perlbrew/etc/bashrc
source /Users/fy2/biobrew/load_env
#eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
#enables color in the terminal bash shell export
CLICOLOR=1
LSCOLORS=gxfxcxdxbxegedabagacad
#export PS1="\W @ \h (\u) \$ "
#export PS1="\#:\h:\D{%D}:\W$i "
export TERM=xterm-color
#alias ls='ls -G'
alias ll='ls -hl'
alias rstud='open ~/Applications/RStudio.app'
#alias ssh='ssh -X'

#For AWS api tools
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/Users/fy2/homebrew/Library/LinkedKegs/ec2-api-tools/jars"

export COURSERA_EMAIL=feyruzyalcin@gmail.com
export COURSERA_PASS=Byzm6Qqkq5

#HMM binaries:
PATH=/Users/fy2/software/Pfam/hmmer-3.0b3/fy2_local/bin:$PATH

PERL5LIB=/Users/fy2/software/Pfam/PfamScan:$PERL5LIB
export PERL5LIB


PATH=/Users/fy2/PAGE_WORK/Shanil/script:$PATH
PATH=/Users/fy2/software/Gblocks/Gblocks_0.91b:$PATH
PATH=/Users/fy2/Experiments/C/valgrind/bin:$PATH

#Make R-STUDIO use this
export RSTUDIO_WHICH_R=/Users/fy2/homebrew/bin/R


alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color'

#########################################
# Setting up history to work with screen#
#########################################

# Create these two dirs:
# mkdir -p ~/.history/screen
# screen histories will go in:
#  "~/.history/screen/" in the format: "[ScreenSocket.Year.Day.hist]"

# non-screen histories will go in:
# "~/.history/" in the format: "[Year.Day.hist]"

# See 'man test' for understanding -n or -z options
# $STY is always set when in GNU screen session
if [ -n "${STY}" ] ; then
    export HISTFILE=~/.history/screen/${STY}.`date +%Y%m%d`.hist
    #export PS1="\h:\W$i Screen$ "
    export PS1="\h:$i(screen:${WINDOW}):\W$ "
else
    #keeps history daily...
    export HISTFILE=~/.history/`date +%Y%m%d`.hist
    export PS1="\h:\W$i$ "
fi

export HISTSIZE=100000

#https://stackoverflow.com/questions/6475524/making-sure-commands-dont-show-up-in-bash-history
export HISTIGNORE="pwd:ls:ls -ltr:ll:history: *"

# Screen session CMDs were not being written to history file immediately,
# i.e. system was waiting for a screen session to terminate before. To enable
# immediate writing, this solution was suggested:
# http://askubuntu.com/questions/67283/is-it-possible-to-make-writing-to-bash-history-immediate
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

#########################################
#     That's it for History keeping!    #
#########################################

