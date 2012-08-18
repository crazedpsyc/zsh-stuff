# prompt setup
path_str() {
    if [[ -z "$vcs_info_msg_0_" ]]; then
        print '%~'
    else
        print "$vcs_info_msg_0_"
    fi
}
PROMPT='%F{$DECOR_COL}[%F{$TEXT_COL}%n%F{$DECOR_COL}][%F{$TEXT_COL}$(path_str)%F{$DECOR_COL}]%B%F{$TEXT_COL}$PROMPT_CHAR %b%F{7}'
PS2="%_ >"
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:$HOME/bin

# zshy config
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
PAGER='less -R'

export PERL_LOCAL_LIB_ROOT="$HOME/perl5";
export PERL_MB_OPT="--install_base $HOME/perl5";
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5";
export PERL5LIB="$HOME/perl5/lib/perl5/x86_64-linux-thread-multi:$HOME/perl5/lib/perl5";
export PATH="$HOME/perl5/bin:$PATH";
eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
export EDITOR='vim'
export KEYMAP="dvorak"
export BROWSER=uzbl-newtab
