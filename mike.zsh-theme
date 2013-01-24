# Theme with full path names and hostname
# Handy if you work on different servers all the time;
#PROMPT='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[blue]%}%M:%{$fg[green]%}%/%{$reset_color%} $(git_prompt_info) %(!.#.$) '
PROMPT='%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[white]%}%2~%{$reset_color%}$(git_prompt_info) %(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}git:("
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%})%{$reset_color%}"
