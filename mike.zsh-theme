# Theme with full path names and hostname
# Handy if you work on different servers all the time;
#PROMPT='%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%2~%{$reset_color%}$(git_prompt_info) %(!.#.$) '
PROMPT='%{$fg[yellow]%}λ %{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%2~%{$reset_color%}$(git_prompt_info) %(!.#.$) '


ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}git:("
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%} ✱"
