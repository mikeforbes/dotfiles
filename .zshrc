# Path to my oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
ZSH_THEME="mike"
# you'll find the theme at: https://github.com/mikeforbes/dotfiles/blob/master/mike.zsh-theme

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"
# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"
# we want oh-my-zsh to update, so:
export DISABLE_AUTO_UPDATE="false"
# zsh-completion path shiz
fpath=(/usr/local/share/zsh-completions $fpath)
# use these oh-my-zsh plugins:
plugins=(zsh-syntax-highlighting git tmux brew osx python screen compleat)
# source ohmyzsh stuff
source $ZSH/oh-my-zsh.sh

# if any command takes longer than 5sec to run, zsh will print the usage stats
# along with time taken.
REPORTTIME=5

# load some colour!
autoload -U colors
colors

# make various commands pretty
alias svn=colorsvn
export CLICOLOR=1
# use grc to make other commands coloury
if [ -f `brew --prefix`/etc/grc.bashrc ]; then
source "`brew --prefix grc`/etc/grc.bashrc"
fi
# MORE COLOUR!
if [ -f /usr/local/bin/pygmentize ];then
alias cat='pygmentize -g'
fi

# Show completion on the first TAB.
setopt menucomplete

# zsh history file
HISTFILE=~/.zsh_history
# ignore these things in history
HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"
# make it this size
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
# zsh related:
# will bind ctrl-x-e to a 'paste session'
# same as bash ctrl-x-e
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# path
# (pretty specific to the stuff I use)
export PATH=/Users/$USER/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/local/MacGPG2/bin:/Users/$USER/.ec2/bin:/opt/local/bin:/usr/local/sbin:/opt/local/sbin:/usr/local/opt/ruby/bin:$PATH

# editor is vim
export EDITOR=/usr/bin/vim # because

# for node related goodness. harmless if you're not using node
export NODE_PATH="/usr/local/lib/node_modules" # some homebrew node.js
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog" # homebrew docbooks stuff

#debian developer settings
export DEBFULLNAME='Your Name'
export DEBEMAIL=your.email@your.domain.com

# git settings
export GIT_AUTHOR_NAME='Your Name'
export GIT_AUTHOR_EMAIL=your.name@your.domain.com
export GIT_COMMITTER_NAME='Your Name'
export GIT_COMMITTER_EMAIL=your.name@your.domain.com
export GPGKEY=#YOURKEYID
# language!
export LANG=en_NZ.UTF-8

# other exporty things
# Tell grep to highlight matches
export GREP_OPTIONS='--color=always'

#and other aliases
alias superpush='git pull && git push' # useful for git
# generate a STRONG 11char pw. (will use up entropy)
alias pwdgen='gpg --gen-random --armor 1 11'
# use the xkcd password generator (from https://github.com/redacted/XKCD-password-generator)
if [ -f /Users/$USER/src/XKCD-password-generator/xkcd_password.py ]; then
alias pgen='/Users/$USER/src/XKCD-password-generator/xkcd_password.py -n 4 -d ""'
fi
# use autojump, if it exists
if [ -f `brew --prefix`/etc/autojump.zsh ]; then
  . `brew --prefix`/etc/autojump.zsh
fi
# android dev stuff:
export ANDROID_HOME=/usr/local/opt/android-sdk

# mac specific
if [[ "$(uname -s)" == 'Darwin' ]]; then
  # Add a poor facsimile for Linux's `free` if we're on Mac OS
  alias free="top -s 0 -l 1 -pid 0 -stats pid | grep '^PhysMem: ' | cut -d : -f 2- | tr ',' '\n'"
  # flush dns
  alias flushcache='dscacheutil -flushcache'
  # Mac system information.
  alias macinfo='system_profiler SPHardwareDataType'
  # because I update things ALL THE TIME I just alias this to keep homebrew stuff up to date
  # LIVIN' ON THE EDGE!
  alias lebrew="brew update;brew upgrade;brew outdated"
  # locate isn't available (by default) on OSX, so use mdfind
  alias locate='mdfind -name'
fi

# use less for the pager, if possible.
if [ `which less` ]; then
export VTYSH_PAGER="less -F -X"
# but only use it if we're seeing more than one screen
fi

# more misc aliases
alias gpl='git fetch --all;git merge origin'
alias git pull='git pull --rebase'
alias fucking='sudo'
alias unfuck='git reset --soft "HEAD^"'
alias sc='tmux attach'
alias myip='echo "Your public IP address is:" `curl -s icanhazip.com`'


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# go
export GOPATH=/Users/$USER/gocode/
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Setup Amazon EC2 Command-Line Tools
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"

# cloudwatch:
export AWS_CLOUDWATCH_HOME="/usr/local/Library/LinkedKegs/cloud-watch/jars"
export SERVICE_HOME="$AWS_CLOUDWATCH_HOME"

# python virtualenv
# enable shims and autocompletion
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

#Use Homebrew's directories rather than ~/.pyenv
export PYENV_ROOT=/usr/local/opt/pyenv
