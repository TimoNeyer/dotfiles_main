###################
# basic application
# replacemtents
###################
alias cd='z'
alias ls='eza --no-permissions --no-filesize --no-time --icons=auto --group-directories-first -gMo -w 50 --smart-group '
alias c='clear'
alias ll='ls -l'
alias la='ls -la'
alias cat='bat'
alias sudo='doas'

###################
# power management
###################
alias reboot='/sbin/reboot'
alias shutdown='/sbin/shutdown'
alias halt='/sbin/halt'

###################
# shortcuts
###################
alias ..='cd ..'
alias ...='cd ../../'
alias h='history'
alias j='jobs -l'
alias e='exit'
alias q='exit'

###################
# prevent mishaps
###################
alias mv='mv -i'
alias cp='cp -ir'
alias ln='ln -i'
alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

###################
# auto coloring
###################
alias dir='ls --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

###################
# extended
# applications
# replacemtents
###################
alias pic='imv-wayland'
alias imv='imv-wayland'
alias vid='mpv'
alias ping='fping -c 10'
alias ping4='fping -4'
alias ping6='fping -6'
alias venv='python3 -m venv'

###################
# application
# shortcuts
###################
alias vi='vim'
alias svi='sudo vim'
alias svim='sudo vim'
alias pcal='python3'
alias py='python3'
alias snxd='snx -d'
alias vo='vim $(fzf)'
alias e='vo'
alias ipa='ip a'
alias con='nmcli'
alias wificon='nmcli --ask dev wifi connect '
alias mute='amixer set Capture nocap'
alias unmute='amixer set Capture cap'
alias soundoff='amixer set Master off'
alias soundon='amixer set Master on'
alias readmail='vim /var/mail/main'
alias y='yazi-script'

###################
# miscelaneus
###################
alias ehlo='echo ehlo'
alias meddl='echo meddl'
alias systemclt='systemctl'

###################
# custom overrides
###################
alias ,sshe='ssh -O exit'
alias ,cat='/usr/bin/cat'


###################
# ensure packages
# are installed
###################
alias ,ensure-tmux-installed='tmux'
alias ,ensure-yazi-installed='yazi'
