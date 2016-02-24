# mike's .zshrc
# mostly osx, sysadmin-y things.

# oh-my-zsh stuff:
# Path to my oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
ZSH_THEME="mike"
# you'll find the theme at: https://github.com/mikeforbes/dotfiles/blob/master/mike.zsh-theme
# put it in ~/.oh-my-zsh/themes/

# we want oh-my-zsh to update, so:
export DISABLE_AUTO_UPDATE="false"
# Use case-sensitive completion
CASE_SENSITIVE="true"
# Show red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"
# zsh-completion path shiz
fpath=(/usr/local/share/zsh-completions $fpath)
# use these oh-my-zsh plugins:
plugins=(colorize zsh-syntax-highlighting git tmux brew osx python screen compleat autojump)
# source ohmyzsh stuff
source $ZSH/oh-my-zsh.sh
# if any command takes longer than 5sec to run, zsh will print the usage stats
# along with time taken.
REPORTTIME=5

# load some colour!
autoload -U colors
colors

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
#zsh related:
# will bind ctrl-x-e to a 'paste session'
# same as bash ctrl-x-e
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# path
# specific to me, YMMV
export PATH=/Users/$USER/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/local/MacGPG2/bin:/Users/$USER/.ec2/bin:/opt/local/bin:/usr/local/sbin:/opt/local/sbin:/usr/local/opt/ruby/bin:$PATH

# editor is vim
export EDITOR=/usr/bin/vim # because
# for node related goodness. harmless if you're not using node
export NODE_PATH="/usr/local/lib/node_modules" # some homebrew node.js
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog" # homebrew docbooks stuff

# git settings
export GIT_AUTHOR_NAME='Your Name'
export GIT_AUTHOR_EMAIL=you@yourdomain.com
export GIT_COMMITTER_NAME='Your Name'
export GIT_COMMITTER_EMAIL=you@yourdomain.com
export GPGKEY=YOURKEYID
# your lang here:
#export LANG=en_NZ.UTF-8

# other exporty things
# Tell grep to highlight matches
export GREP_OPTIONS='--color=always'

# make various commands pretty
alias svn=colorsvn
export CLICOLOR=1

# and other aliases

# generate a STRONG 11char pw.
# assumes you have 'gpg'
alias pwdgen='gpg --gen-random --armor 1 11'

# use the xkcd password generator (from https://github.com/redacted/XKCD-password-generator)
# clone it into ~/src/ on osx, fix the line below if it's elsewhere.
if [ -f /Users/$USER/src/XKCD-password-generator/xkcdpass/xkcd_password.py ]; then
alias pgen='/Users/$USER/src/XKCD-password-generator/xkcdpass/xkcd_password.py -n 4 -d " "'
fi

# use grc to make other commands colour-y
# in osx, `brew install grc`
if [ -f `brew --prefix`/etc/grc.bashrc ]; then
source "`brew --prefix grc`/etc/grc.bashrc"
fi
# MORE COLOUR!
# c/o 'pygments' .. `pip install Pygments`
if [ -f /usr/local/bin/pygmentize ];then
alias pcat='pygmentize -g'
fi
# colourify is part of grc, which, you guessed it. adds more colour.
# this will add some grc colour to `ps` which I like.
if [ -f /usr/local/etc/grc.bashrc ]; then
# `brew install grc` should take care of that ^
  alias ps='colourify ps'
fi

# use autojump, if it exists
# osx: `brew install autojump`
if [ -f `brew --prefix`/etc/autojump.zsh ]; then
  . `brew --prefix`/etc/autojump.zsh
fi
# android dev stuff, osx:
export ANDROID_HOME=/usr/local/opt/android-sdk

# osx specific
if [[ "$(uname -s)" == 'Darwin' ]]; then
  # Add a poor facsimile for Linux's `free` if we're on Mac OS
  alias free="top -s 0 -l 1 -pid 0 -stats pid | grep '^PhysMem: ' | cut -d : -f 2- | tr ',' '\n'"
  # flush dns
  alias flushcache='dscacheutil -flushcache'
  # Mac system information.
  alias macinfo='system_profiler SPHardwareDataType'
  # because I update things ALL THE TIME I just alias this to keep homebrew stuff up to date
  alias lebrew="brew update;brew outdated;brew upgrade --all;brew cleanup"
  # locate isn't available (by default) on OSX, so use mdfind
  alias locate='mdfind -name'
fi

# use less for the pager, if possible.
if [ `which less` ]; then
export VTYSH_PAGER="less -F -X"
fi

# more misc aliases
# git stuff:
alias superpush='git pull && git push' # useful for git
alias gpl='git fetch --all;git merge origin'
# undo:
alias unfuck='git reset --soft "HEAD^"'
# (╯°□°）╯︵ ┻━┻
alias fuckthis='git reset --hard;git clean -f -d'
# tmux, attach
alias sc='tmux attach'
# grab your ip address
alias myip='echo "Your public IP address is:" `curl -s icanhazip.com`'
# always start tmux in 256 colour mode
alias tmux='tmux -2'
# because I always fucking forget
alias fucking='sudo'
# I deal with lots of zone edits. This grabs the current date in a way that makes it easier for a serial
alias zoneserial='echo `(date +"%Y%m%d")`01'

# show me all commits on all branches in a compact, colorized way.
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# python virtualenv
# enable shims and autocompletion
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#Use Homebrew's directories rather than ~/.pyenv
export PYENV_ROOT=/usr/local/opt/pyenv

