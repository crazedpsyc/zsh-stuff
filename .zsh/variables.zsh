# prompt setup
path_str() {
    if [[ -z "$vcs_info_msg_0_" ]]; then
        print '%~'
    else
        print "$vcs_info_msg_0_"
    fi
}
vim_ins_mode="%{$fg[black]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[white]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish
PROMPT='%F{$DECOR_COL}[%F{$TEXT_COL}%n%F{$DECOR_COL}][%F{$TEXT_COL}$(path_str)%F{$DECOR_COL}%F{$DECOR_COL}]%(?..%F{red}-%?-)%B%F{$TEXT_COL}$PROMPT_CHAR %b%F{7}'
RPROMPT='${vim_mode}'
PS2="%_ >"
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:$HOME/bin:$HOME/.gem/ruby/1.9.1/bin

# zshy config
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
PAGER='less -R'

# ... lots of boring stuff here ...
