# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load. yes, a custom one.
ZSH_THEME="mike"
# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"
# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# don't run the auto update. I'll do it myself.
export DISABLE_AUTO_UPDATE="false"

# more zsh completiony things
fpath=(/usr/local/share/zsh-completions $fpath)

# load plugins
plugins=(zsh-syntax-highlighting git brew osx python autojump screen heroku)
# source ohmyzsh stuff
source $ZSH/oh-my-zsh.sh

# load some coloury stuff
autoload -U colors
colors
# Show completion on the FIRST TAB.
setopt menucomplete

# zsh history file
HISTFILE=~/.zsh_history
# ignore these things in history
HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"
# make the history this size
HISTSIZE=1000000
SAVEHIST=1000000
# more history stuff
setopt extendedglob notify
setopt append_history
setopt inc_append_history
# terminal specific stuff
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off
# path
export PATH=/usr/local/share/python:~/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/local/MacGPG2/bin:~/.ec2/bin:/opt/local/bin:/usr/local/sbin:/opt/local/sbin:/usr/local/Cellar/ruby/1.9.3-p194/bin:$PATH

export EDITOR=/usr/bin/vim # because fuck anything else that's why.
export NODE_PATH="/usr/local/lib/node_modules" # some homebrew node.js shit
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog" # homebrew docbooks stuff

#debian developer settings
export DEBFULLNAME='My Name'
export DEBEMAIL=my.email.address@dot.com

# git settings
export GIT_AUTHOR_NAME='My Name'
export GIT_AUTHOR_EMAIL=my.email.address@dot.com
export GIT_COMMITTER_NAME='My Name'
export GIT_COMMITTER_EMAIL=my.email.address@dot.com
export GPGKEY=########
export LANG=en_NZ.UTF-8

# other exporty things
# Tell grep to highlight matches
export GREP_OPTIONS='--color=always'

# make various commands pretty
alias svn=colorsvn
export CLICOLOR=1

#and other aliases
alias superpush='git pull && git push' # useful for git
# generate a STRONG 9char pw. (will use up entropy)
alias pwdgen='gpg --gen-random --armor 1 9'
# flush dns
alias flushcache='dscacheutil -flushcache'
# use grc to make other commands coloury
source "`brew --prefix grc`/etc/grc.bashrc"
# use autojump, if it exists
if [ -f `brew --prefix`/etc/autojump.zsh ]; then
  . `brew --prefix`/etc/autojump.zsh
fi
# something about breeze?
[ -s "~/.scm_breeze/scm_breeze.sh" ] && source "~/.scm_breeze/scm_breeze.sh"
# for android sdk things
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r20.0.1

# mac specific
if [[ "$(uname -s)" == 'Darwin' ]]; then
  # Add a poor facsimile for Linux's `free` if we're on Mac OS
  alias free="top -s 0 -l 1 -pid 0 -stats pid | grep '^PhysMem: ' | cut -d : -f 2- | tr ',' '\n'"

  # Mac system information.
  alias macinfo='system_profiler SPHardwareDataType'
fi

# use less for the pager, if possible.
if [ `which less` ]; then
export VTYSH_PAGER="less -F"
fi

