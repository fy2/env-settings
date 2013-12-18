export LSB_DEFAULTPROJECT=team81
export LSB_DEFAULTGROUP=team81

if [ -z $PS1 ] ; then
    source /etc/bashrc
fi

alias ll='ls -l'
alias slite='sqlite3'
alias sourcecoretest='source /nfs/users/nfs_f/fy2/software/CoreGenomeUnofficial/config/setup_pipeline.sh'
alias sourcecore='source /nfs/users/nfs_f/fy2/software/CoreGenome/config/setup_pipeline.sh'

export GIT_EDITOR=vim

PATH=/nfs/users/nfs_f/fy2/software/seqtools/seqtools-4.20/install_fy2/bin:$PATH
PATH=/nfs/users/nfs_m/mh12/git/python3.2:$PATH
PATH=$HOME/bin:$PATH

#export PS1="\h:\D{%D}:\W$i$ "
export PS1="\h:\W$i$ "


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
else
    #keeps history daily...
    export HISTFILE=~/.history/`date +%Y%m%d`.hist
fi

export HISTSIZE=100000

# Screen session CMDs were not being written to history file immediately,
# i.e. system was waiting for a screen session to terminate before. To enable
# immediate writing, this solution was suggested:
# http://askubuntu.com/questions/67283/is-it-possible-to-make-writing-to-bash-history-immediate
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

#########################################
#     That's it for History keeping!    #
#########################################
