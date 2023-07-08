# mike's .zshrc
# I use the prezto framework to config Zsh
# Get it here: https://github.com/sorin-ionescu/prezto
# prezto settings are in the ~/.zpreztorc
#

# Set up the prompt
autoload -Uz promptinit
promptinit

# set some zsh basics:
# Remove superfluous blanks from each command line being added to the history
# list
setopt histreduceblanks
# Remove command lines from the history list when the first character on the
# line is a space, or when one of the expanded aliases contains a leading space
setopt histignorespace
# I've also seen documentation suggesting this, so we'll set it too.
setopt HIST_IGNORE_SPACE

# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation
setopt EXTENDED_GLOB

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Show red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"
# if any command takes longer than 5sec to run, zsh will print the usage stats
# along with time taken.
REPORTTIME=5

# Keep 1000 lines of history within the shell and save it to ~/.zsh
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# editor is vim
export EDITOR=/usr/bin/vim # because

#  aliases
# copy paste like mac os pbcopy pbpaste
# install xsel!
if [ -f /usr/bin/xsel ]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi
# Use modern completion system
autoload -Uz compinit
compinit

#zsh styling and completion tweaks:
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# now source the zprezto init
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# colour things with grc, if it exists
# zpreztos git module includes an alias for grc, this will nuke that
if [ -f /etc/grc.zsh ]; then
     unalias grc;source /etc/grc.zsh
fi

#
# aliases
#
# generate a STRONG 16char pw.
# assumes you have 'gpg' in /usr/bin
if [ -f /usr/bin/gpg ]; then
    alias pwdgen='gpg --gen-random --armor 1 11|cut -d"=" -f1'
fi

# git helping aliases:
# note: I use the zprezto git module, it includes some aliases too
#
if [ -f /usr/bin/git ]; then
    alias superpush='git pull && git push' # useful for git
    alias gpl='git fetch --all;git merge origin'
# undo:
    alias unfuck='git reset --soft "HEAD^"'
# (╯°□°）╯︵ ┻━┻
    alias fuckthis='git reset --hard;git clean -f -d'
# show me all commits on all branches in a compact, colorized way.
    alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
fi

# gpg tty
if [ -f /usr/bin/gpg ]; then
    export GPG_TTY=\$(tty)
fi
# ensure our path includes .local for python pip
export PATH="$PATH:~/.local/bin"

