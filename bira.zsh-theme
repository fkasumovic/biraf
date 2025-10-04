# vim:et sts=2 sw=2 ft=zsh

typeset -g VIRTUAL_ENV_DISABLE_PROMPT=1

setopt nopromptbang prompt{cr,percent,sp,subst}

zstyle ':zim:duration-info' threshold 0
zstyle ':zim:duration-info' show-milliseconds yes

# Depends on git-info module to show git information
typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info:branch' format '%b'
  zstyle ':zim:git-info:commit' format '%c'
  zstyle ':zim:git-info:dirty' format '%F{red}%{%G●%}%F{yellow}'
  zstyle ':zim:git-info:keys' format \
      'prompt' ' %F{yellow}%{%G‹%}%b%c%D%{%G›%}'
  add-zsh-hook precmd git-info
fi

PS1='%{%G╭%}%{%G─%}%B%(!.%F{red]}.%F{green}) %F{blue}%~${(e)git_info[prompt]}${VIRTUAL_ENV:+" %F{green}%{%G‹%}${VIRTUAL_ENV:t}%{%G›%}"}%f%b
%{%G╰%}%{%G─%}%B%(!.#.$)%b '
RPS1='%B%(?..%F{red}%? %{%G↵%}%f)%b'
