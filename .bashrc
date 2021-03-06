# mike's .bashrc
#
#
# Lots of Mac OSX specific stuff, but should be OK in other environments.

export EDITOR=/usr/bin/vim # because

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# make the history file bigger
export HISTFILESIZE=9000
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# Include dot (.) files in the results of expansion
shopt -s dotglob
# Case-insensitive matching for filename expansion
shopt -s nocaseglob
# Enable extended pattern matching
shopt -s extglob
# Enable options:
shopt -s cdspell # fixes typos and spelling mistakes using 'cd'
shopt -s cdable_vars # magic cd variable stuff (man bash) search for "^SHELL BUILTIN COMMANDS"
shopt -s checkhash # check a command exists before executing it
shopt -s no_empty_cmd_completion # do not search for possible completions when completion is attempted on an empty line.
shopt -s cmdhist # attempt to save all lines of a multiple-line command in the same history entry.
shopt -s histappend histreedit histverify # various history things

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

#debian developer settings
export DEBFULLNAME='My Name'
export DEBEMAIL=my.email.address@domain.com

# git settings
export GIT_AUTHOR_NAME='My Name'
export GIT_AUTHOR_EMAIL=my.email.address@domain.com
export GIT_COMMITTER_NAME='My Name'
export GIT_COMMITTER_EMAIL=my.email.address@domain.com
export GPGKEY=000000

# my prompt. simple & useful, with some colour. looks like: "user@hostname ~ $ "
# shows a git branch in the prompt, if the git binary exists..

if [ `which git` ]; then
export PS1='\[\033[01;32m\]\u\[\033[01;00m\]@\[\033[01;31m\]\h \[\033[37m\]\W $(__git_ps1 "(%s)") $ \[\033[00m\]'
else
# if not, a regular prompt
export PS1='\[\033[01;32m\]\u\[\033[01;00m\]@\[\033[01;31m\]\h \[\033[37m\]\W $ \[\033[00m\]'
fi

# and other stuff
# (osx specific)
# make sure UTF-8 is on and working
export LANG=en_NZ.UTF-8
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

# make various commands pretty
alias ls='ls -GhF' #colours and useful bits
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1

# generate a STRONG 9char pw. (will use up entropy)
alias pwdgen='gpg --gen-random --armor 1 9'

# use less for the pager, if possible.
if [ `which less` ]; then
export VTYSH_PAGER="less -F"
fi
