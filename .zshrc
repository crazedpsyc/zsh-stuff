# ZSH POWAHHH!
autoload -U compinit
autoload -Uz vcs_info
compinit -i

[[ "$TERM" == "screen" || "$TERM" == "xterm" ]] && export TERM="$TERM-256color"
# Colors
if [[ "$TERM" =~ '256color' ]]; then # if 256col is available, UTF8 probably is as well
    TEXT_COL='12'
    DECOR_COL='8'
    PROMPT_CHAR='➤'
else
    TEXT_COL='7'
    DECOR_COL='4'
    PROMPT_CHAR='>'
fi

# plugins stolen from oh-my-zsh
for omzp (~/.oh-my-zsh/plugins/{archlinux/archlinux,git/git,ssh-agent/ssh-agent}.plugin.zsh) . $omzp
# My stuff
for conf (~/.zsh/*.zsh) . $conf

# Interactive synatx highlighting!
. ~/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# known_hosts completion
local _myhosts
if [[ -f $HOME/.ssh/known_hosts ]]; then
    _myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
    zstyle ':completion:*' hosts $_myhosts
fi

export LOCKPRG=vlock
fpath=(~/git/zsh-completions/src $fpath)
