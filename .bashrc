# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
#FEYRUZ comment HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#FEYRUZ comment shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#FEYRUZ comment  HISTSIZE=1000
#FEYRUZ comment  HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


### HISTORY RELATED ADDED BY FEYRUZ ###
 # See 'man test' for understanding -n or -z options
 # $STY is always set when in GNU screen session
if [ -n "${STY}" ] ; then
export HISTFILE=~/.history/screen/${STY}.`date +%Y%m%d`.hist
export PS1="\h:$i(screen:${WINDOW}):\W$ "
else
#keeps history daily...
export HISTFILE=~/.history/`date +%Y%m%d`.hist
export PS1="\h:\W$i$ "
fi
export HISTSIZE=100000
#https://stackoverflow.com/questions/6475524/making-sure-commands-dont-show-up-in-bash-history
export HISTIGNORE="pwd:ls:clear:ls -ltr:ll:history: *"
# Screen session CMDs were not being written to history file immediately,
# i.e. system was waiting for a screen session to terminate before. To enable
# immediate writing, this solution was suggested:
# http://askubuntu.com/questions/67283/is-it-possible-to-make-writing-to-bash-history-immediate
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

### END FEYRUZ ###




# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias ll='ls -lah'
#source ~/perl5/perlbrew/etc/bashrc
#PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
#Make the prompt yellow! 
PS1='\[\e[1;33m\][\u@\h \W]\$\[\e[0m\] '

PERL_MB_OPT="--install_base \"/home/feyruz/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/feyruz/perl5"; export PERL_MM_OPT;
PATH=/home/feyruz/bin:${PATH}
alias rgrep='rgrep --color'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# Add to .bashrc
# Set the title of a Terminal window
function settitle() {
 if [ -n "$STY" ] ; then         # We are in a screen session
  echo "Setting screen titles to $@"
  printf "\033k%s\033\\" "$@"
  screen -X eval "at \\# title $@" "shelltitle $@"
 else
  printf "\033]0;%s\007" "$@"
 fi
}
