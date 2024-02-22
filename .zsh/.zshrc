# Greeting
echo "Code, conquer, repeat"

# Prompt before
#PROMPT="%F{red}┌[%f%F{cyan}%m%f%F{red}]─[%f%F{yellow}%%D{%H:%M-%d/%m}%f%F{red}]─[%f%F{magenta}%d%f%F{red}]%f"$'\n'"%F{red}└╼%f%F{green}$USER%f%F{yellow}$%f"

# Set the prompt
PROMPT='%F{green}%n%F{blue}@%F{blue}%F{cyan}%m:%F{magenta}%~ %f❯❯ '
RPROMPT='[%F{cyan}%T%f]'


# Export PATH$
export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH:$HOME/software/progs

# get aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

function hex-encode()
{
  echo "$@" | xxd -p
}

function hex-decode()
{
  echo "$@" | xxd -p -r
}

function rot13()
{
  echo "$@" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}


# definitions
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi
export EDITOR=vim
export VISUAL=vim

# alias
alias ls='ls -lh --color=auto'
alias dir='ls --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#####################################################
# Auto completion / suggestion
# Mixing zsh-autocomplete and zsh-autosuggestions
# Requires: zsh-autocomplete (custom packaging by Parrot Team)
# Jobs: suggest files / foldername / histsory bellow the prompt
# Requires: zsh-autosuggestions (packaging by Debian Team)
# Jobs: Fish-like suggestion for command history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

##################################################
# Fish like syntax highlighting
# Requires "zsh-syntax-highlighting" from apt
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]; then
  source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
  # Select all suggestion instead of top on result only
  zstyle ':autocomplete:tab:*' insert-unambiguous yes
  zstyle ':autocomplete:tab:*' widget-style menu-select
  zstyle ':autocomplete:*' min-input 2
  bindkey $key[Up] up-line-or-history
  bindkey $key[Down] down-line-or-history
fi

# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory


# function
function cdl () {
    cd "$@" ;
    ls -CF
}

function root () {
    touch /var/slog/$$  >> /var/log/slog
    batch now + 5 minutes -f /usr/bin/sudologger  1> /dev/null
    /usr/bin/sudo "$@" ;
}
 
function hex-encode()
{
  echo "$@" | xxd -p
}

function hex-decode()
{
  echo "$@" | xxd -p -r
}

function rot13()
{
  echo "$@" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}   
