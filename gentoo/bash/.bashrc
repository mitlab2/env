# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

alias ls="ls --color=auto"
alias ll="ls -al"
alias d="ls"
alias l="ls -l"

alias rm='rm -i'
alias mv='mv -i'
alias df='df -h'

#alias grep="grep -irn --color=auto --exclude-dir\=\".git\" --exclude-dir\=\".svn\" "
alias diff="diff -urN "

export EDITOR='/usr/bin/vim'
export SVN_EDITOR='/usr/bin/vim'
export EIX_LIMIT=0

#eval `ssh-agent`

# Change the window title of X terminals
case $TERM in
    xterm*|rxvt|Eterm|eterm)
        PS1='\[\033[01;32m\]\h \[\033[01;34m\]\W \$ \[\033[00m\]'
        ;;
    screen)
        PS1='\[\033[01;32m\]\h \[\033[01;34m\]\W \$ \[\033[00m\]'
        ;;
esac

if [ "$DISPLAY" ] ; then
    # X
    export LANG='ko_KR.UTF-8'
    xset b 0
elif [ "${TERM:0:5}" = "linux" ] ; then
    # Consol
    export LANG="ko_KR.UTF-8"
    setterm -blength 0
    setterm -blank 10
elif [ "${TERM:0:5}" = "xterm" ] ; then
    export LANG="ko_KR.UTF-8"
fi

