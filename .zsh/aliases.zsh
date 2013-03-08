# TEH ALIASES OF TEH AWESOMEZ
alias atagn='echo "awful.tag.viewnext()" | awesome-client'
alias atagp='echo "awful.tag.viewprev()" | awesome-client'

alias dzdeps="cpanm \`dzil listdeps --missing\` &>/dev/null || { [[ $? == 25 ]] && print 'No moar deps needed.' }"
alias python=python2
alias vim='vim -p'

alias lock='vlock-cmatrixreloaded -bfln10'
alias duck='duckduckgo'
alias e=$'$EDITOR'
alias dz='dzil'
alias ..='cd ..'
alias l='ls --color=always -lah'

alias man='nocorrect man'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias mkdir='nocorrect mkdir'
alias gist='nocorrect gist'
alias heroku='nocorrect heroku'
alias ebuild='nocorrect ebuild'
alias hpodder='nocorrect hpodder'
alias ls='ls --color=always'


# Suffix aliases
alias -s txt=vim
alias -s tex=vim
alias -s com=w3m
alias -s html=w3m
alias -s org=w3m
alias -s net=w3m
alias ddg.gg='w3m ddg.gg' # DUCK POWAH!

# Global aliases
# who needs slashes all over the place? we're just moving UP!
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
# some long thing |L, anyone?
alias -g T='tail'
alias -g L='less'
alias -g H='head'
