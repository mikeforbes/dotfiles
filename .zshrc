# mike's .zshrc 🤘
# I use the prezto framework to config Zsh
# Get it here: https://github.com/sorin-ionescu/prezto
# zprezto settings are in the ~/.zpreztorc

# Framework Init
# Source Prezto first so its completions and framework exist before overrides
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Zsh Basics
setopt histreduceblanks
setopt histignorespace
setopt EXTENDED_GLOB

# Show red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"
REPORTTIME=5

# History config
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# Environment & Compatibility
export EDITOR='/usr/bin/vim'
export VISUAL='/usr/bin/vim'

# unfuck the systemd status pager/settings
export SYSTEMD_LESS="FRXMK"
export SYSTEMD_COLORS=true

# Aliases

# GPG password gen
if [ -f /usr/bin/gpg ]; then
    alias pwdgen='gpg --gen-random --armor 1 11 | cut -d"=" -f1'
fi

# Git tooling
if [ -f /usr/bin/git ]; then
    alias superpush='git pull && git push'
    alias gpl='git fetch --all; git merge origin'
    alias unfuck='git reset --soft "HEAD^"'
    alias fuckthis='git reset --hard; git clean -f -d'
    alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
fi

# less is more
if [ -f /usr/bin/less ]; then
    alias more="less"
fi

# I prefer directory listing first
alias ls="/bin/ls --group-directories-first --color=auto"

# Local / host-specific overrides
[[ -r "${ZDOTDIR:-$HOME}/.zshrc.local" ]] && source "${ZDOTDIR:-$HOME}/.zshrc.local"

# nvm
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"

    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi

# --- Obsidian (Flatpak) ---
# Ivy Bridge iGPU can't do VAAPI/Vulkan; disable GPU accel to silence
# MESA/libva/vaInitialize errors. Software rendering is fine here.
# Ivy Bridge iGPU: 8086:{0152,0156,015a,0162,0166,016a}
if grep -qsx '0x8086' /sys/class/drm/card[0-9]/device/vendor &&
   grep -qsxE '0x01(5[26a]|6[26a])' /sys/class/drm/card[0-9]/device/device; then
    obsidian() { flatpak run md.obsidian.Obsidian --disable-gpu "$@"; }
fi
