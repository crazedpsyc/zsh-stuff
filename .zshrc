#ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="darkblood"
#DISABLE_AUTO_UPDATE="true"
#plugins=(git archlinux django perl ssh-agent cpanm duckpan)

# ZSH POWAHHH!
autoload -U compinit
autoload -Uz vcs_info
compinit -i

# Colors
if [[ "$TTY" =~ '^/dev/pts' ]]; then 
    TEXT_COL='12'
    DECOR_COL='8'
    PROMPT_CHAR='➤'
else
    TEXT_COL='0'
    DECOR_COL='4'
    PROMPT_CHAR='>'
fi

for omzp (~/.oh-my-zsh/plugins/{archlinux/archlinux,git/git}.plugin.zsh) . $omzp
for conf (~/.zsh/*.zsh) . $conf

#. .zsh/completion/*.zsh

[[ "$TERM" == "screen" || "$TERM" == "xterm" ]] && export TERM="$TERM-256color"

# known_hosts completion
local _myhosts
if [[ -f $HOME/.ssh/known_hosts ]]; then
    _myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
    zstyle ':completion:*' hosts $_myhosts
fi

export LOCKPRG=vlock
