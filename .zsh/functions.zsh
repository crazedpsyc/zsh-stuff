# Totally awesome functions that do things. Wonderful things.
cpanupd() {
    # have to use cpan (not minus) here because cpan provides -O, and cpanm does not. durr.
    print "Listing outdated modules..."
    modlist_raw=("${(f)$(cpan -O 2>/dev/null)}")
    local_lib=(${=$(~/.zsh/perl/list_local_lib.pl)})
    modlist=()
    print "Done. Parsing list..."
    for i ($modlist_raw) {
        [[ "$i" =~ "^\w+(::\w+)*\s+([0-9]+\.[0-9]+\s*){2}$" ]] || continue
        module=$(sed "s/\s*[0-9]\.[0-9]*//g" <(print $i))
        [[ -n "${(k)local_lib[(r)$module]}" ]] && modlist+=($module)
    }
    print "Going to install: $modlist"
    if [[ -z $modlist ]]; then { print "No outdated modules found."; exit }; fi
    print "Installing with cpanm"
#cpanm $modlist
}

# magical thing to make feh easier
vimage() {
    [[ -z "$@" || ! (-f "$@" || -d "$@") ]] && { print "That is not an image/directory."; return 1 }
    if [[ -f "$@" ]]; then
        mimetype=$(file -i "$@")
        print $mimetype
        [[ $mimetype =~ ":\simage/\w+;" ]] || { print "That is not an image"; return 1 }
        size=(${=$(file "$@")})
        width=$size[5]
        height=$(sed "s/,//" <(print $size[7]))
        [[ ! "$width" =~ "^[0-9]+$" || ! "$height" =~ "^[0-9]+$" ]] && { print "Error getting size. B0rk."; return 1 }
        feh -g ${width}x${height} $@
    elif [[ -d "$@" ]]; then
        feh "$@"
    fi
}

dukgo() {
    if [[ "$@" =~ "^\w+\s*(.*)$" ]]; then
        if [[ -n "$match" ]]; then # we have a command
            uh="${@[1]}"
            [[ "${@[1]}" -eq "roboduck" ]] && init=". roboduck_config.sh"
            ssh $uh -t "eval \$(perl -I\$HOME/perl5/lib/perl5 -Mlocal::lib); $init; $match"
        else ssh "${@}@dukgo.com"
        fi
    else return
    fi
}

gh-pf() {
    remote=$(git config --local --get branch.master.remote)
    url=$(git config --local --get remote.$remote.url)
    name=$(sed 's|.*/\(.*\)\.git$|\1|' <<< "$url")
    git pull git://github.com/$1/$name.git
}

wgrep() {
    egrep $3 $1 ~/.weechat/logs/irc.$2.weechatlog 
}

## scripting helper functions

#new() {
#   local parsed
#local type name value
#   for arg ($@) {
#       
#   }

#}

# Zenburn colour scheme
zenburn() {
    if [ "$TERM" = "linux" ]; then
        echo -en "\e]P0222222" #black
        echo -en "\e]P8709080" #darkgrey
        echo -en "\e]P1AA0000" #darkred
        echo -en "\e]P9CC0000" #red
        echo -en "\e]P24E9A06" #darkgreen
        echo -en "\e]PA8AE234" #green
        echo -en "\e]P3C4A000" #brown
        echo -en "\e]PBFCE94F" #yellow
        echo -en "\e]P43465A4" #darkblue
        echo -en "\e]PC729DCC" #blue
        echo -en "\e]P575507B" #darkmagenta
        echo -en "\e]PDAD7FA8" #magenta
        echo -en "\e]P606989A" #darkcyan
        echo -en "\e]PE34E2E2" #cyan
        echo -en "\e]P7dcdccc" #lightgrey
        echo -en "\e]PFeeeeee" #white
        clear #for background artifacting
    fi
}

# Normal colour scheme
normalcolours() {
    if [ "$TERM" = "linux" ]; then
        echo -en "\e]P0000000" #black
        echo -en "\e]P8555555" #darkgrey
        echo -en "\e]P1AA0000" #darkred
        echo -en "\e]P9FF5555" #red
        echo -en "\e]P200AA00" #darkgreen
        echo -en "\e]PA55FF55" #green
        echo -en "\e]P3AA5500" #brown
        echo -en "\e]PBFFFF55" #yellow
        echo -en "\e]P40000AA" #darkblue
        echo -en "\e]PC5555FF" #blue
        echo -en "\e]P5AA00AA" #darkmagenta
        echo -en "\e]PDFF55FF" #magenta
        echo -en "\e]P600AAAA" #darkcyan
        echo -en "\e]PE55FFFF" #cyan
        echo -en "\e]P7AAAAAA" #lightgrey
        echo -en "\e]PFFFFFFF" #white
        clear #for background artifacting
    fi
}

function title {
  if [[ "$DISABLE_AUTO_TITLE" == "true" ]] || [[ "$EMACS" == *term* ]]; then
    return
  fi
  if [[ "$TERM" == screen* ]]; then
    print -Pn "\ek$1:q\e\\" #set screen hardstatus, usually truncated at 20 chars
  elif [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$2:q\a" #set window name
    print -Pn "\e]1;$1:q\a" #set icon (=tab) name (will override window name on broken terminal)
  fi
}

function precmd {
  vcs_info
  title "%15<..<%~%<<" "%n@%m: %~"
}

function preexec {
  emulate -L zsh
  setopt extended_glob
  local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]} #cmd name only, or if this is sudo or ssh, the next cmd
  title "$CMD" "%100>...>$2%<<"
}
autoload -U add-zsh-hook
add-zsh-hook precmd  precmd
add-zsh-hook preexec preexec

export cpanupd vimage dukgo 
