zmodload -i zsh/complist
autoload colors; colors
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu      
setopt complete_in_word
setopt always_to_end
setopt nohup
setopt prompt_subst

unset CASE_SENSITIVE
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
cdpath=(.)
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr " %F{yellow}⚡%F{$TEXT_COL}"
zstyle ':vcs_info:*' unstagedstr " %F{red}⚡%F{$TEXT_COL}"
zstyle ':vcs_info:*' actionformats "%r/%S%F{$DECOR_COL}:%F{$TEXT_COL}%b%F{$DECOR_COL}:%F{$TEXT_COL}%a%c%u"
zstyle ':vcs_info:*' formats "%s%F{$DECOR_COL}:%F{$TEXT_COL}%r%F{$DECOR_COL}:%F{$TEXT_COL}%b %F{red}%S%c%u"
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

export HISTFILE=$HOME/.zsh_history
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt dvorak
setopt correct_all
setopt interactive_comments
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

setopt no_beep
setopt auto_cd
setopt cdablevars
