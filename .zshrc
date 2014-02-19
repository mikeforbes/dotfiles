# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Path
export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/local/MacGPG2/bin:/opt/local/bin:/usr/local/sbin:/opt/local/sbin:/usr/local/opt/ruby/bin:$PATH

# Set name of the theme to load.
ZSH_THEME="mike"
# you'll find the theme at: https://github.com/mikeforbes/dotfiles/blob/master/mike.zsh-theme

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# disable the zsh auto-update
export DISABLE_AUTO_UPDATE="false"

# path stuff
fpath=(/usr/local/share/zsh-completions $fpath)

# load plugins
plugins=(zsh-syntax-highlighting git brew osx python screen heroku)

# source ohmyzsh stuff
source $ZSH/oh-my-zsh.sh

# make various commands pretty
# load some colour!1
autoload -U colors
colors
# use colorsvn, if it exists
if [ -f `brew --prefix`/etc/colorsvnrc ]; then
  alias svn=colorsvn
fi
# I forget what this does. ADD ALL THE COLOUR!1
export CLICOLOR=1
# other exporty/coloury things
# Tell grep to highlight matches
export GREP_OPTIONS='--color=always'

# Show completion on the first TAB.
setopt menucomplete

# zsh history file settings
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

# zsh related:
# will bind ctrl-x-e to a 'paste session'
# same as bash ctrl-x-e
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

export EDITOR=/usr/bin/vim # because

#debian developer settings
export DEBFULLNAME='Your Name'
export DEBEMAIL=your.email@your.domain.com

# git settings
export GIT_AUTHOR_NAME='Your Name'
export GIT_AUTHOR_EMAIL=your.name@your.domain.com
export GIT_COMMITTER_NAME='Your Name'
export GIT_COMMITTER_EMAIL=your.name@your.domain.com
export GPGKEY=#YOURKEYID
export LANG=en_NZ.UTF-8

# and other aliases
alias superpush='git pull && git push' # useful for git
alias gpl='git fetch --all;git merge origin'
alias git pull='git pull --rebase'
alias fucking='sudo'
alias unfuck='git reset --soft “HEAD^"'

# generate a STRONG 9char pw. (will use up entropy)
alias pwdgen='gpg --gen-random --armor 1 9'

# mac specific!

if [[ "$(uname -s)" == 'Darwin' ]]; then
# terminal specific stuff
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off
export NODE_PATH="/usr/local/lib/node_modules" # some homebrew node.js
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog" # homebrew docbooks stuff

# Add a poor facsimile for Linux's `free` if we're on Mac OS
  alias free="top -s 0 -l 1 -pid 0 -stats pid | grep '^PhysMem: ' | cut -d : -f 2- | tr ',' '\n'"
# flush dns (OSX specific)
  alias flushcache='dscacheutil -flushcache'
# use grc to make other commands coloury (if grc is installed (via brew))
  if [ -f `brew --prefix`/etc/grc.bashrc ]; then
    source "`brew --prefix grc`/etc/grc.bashrc"
  fi
# use autojump, if it exists
  if [ -f `brew --prefix`/etc/autojump.zsh ]; then
    . `brew --prefix`/etc/autojump.zsh
  fi

# Mac system information.
  alias macinfo='system_profiler SPHardwareDataType'
  alias lebrew="brew update;brew upgrade;brew outdated"
fi

# use less for the pager, if possible.
if [ `which less` ]; then
export VTYSH_PAGER="less -F"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Setup Amazon EC2 Command-Line Tools if required
#export JAVA_HOME="$(/usr/libexec/java_home)"
#export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
#export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
#export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
# cloudwatch:
#export AWS_CLOUDWATCH_HOME="/usr/local/Library/LinkedKegs/cloud-watch/jars"
#export SERVICE_HOME="$AWS_CLOUDWATCH_HOME"

# python virtualenv
export PYENV_ROOT=/usr/local/opt/pyenv
