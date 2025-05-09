function cdl () {
    cd "$@" ;
    ls -CF
}

function md () {
    pandoc $@ | lynx -stdin;
}

function mdpdf () {
    if [ -f "$2" ]; then
        echo Error: output file exists
    elif [ ! -f "$1" ]; then
       echo Error: input file not found
    else
        pandoc --from=markdown --to=pdf -o $2 $1
    fi
}

function sound () {
    amixer set Master $(( $( echo "scale=2; $@/100" | bc)* 65536))
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

get_status() {
  if [[ $? -eq 0 ]]; then
    LAST_CMD_STATUS="%F{blue}●%f"  # Blue dot for success
  else
    LAST_CMD_STATUS="%F{red}●%f"   # Red dot for error
  fi
  set -A ELAPSED $ELAPSED $(( SECONDS-_start ))
}

fuck() {
    local last_command=$(fc -n -l -1 -1)
    echo "Executing: sudo $last_command"
    echo -n "Continue? (Y/n) "
    read -r response
    if [[ $response =~ ^([Yy][Ee][Ss]|[Yy]|)$ ]]
    then
        bash -c "sudo $last_command"
        return 0
    else
        echo "Aborted."
        return 1
    fi
}

git_stats() {
    GIT_BRANCH=""
    git rev-parse --is-inside-work-tree &>/dev/null || return

    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD)

    local changes=""
    if ! git diff --quiet --ignore-submodules --; then
        changes=" ✗"
    fi

    if ! git diff --cached --quiet --ignore-submodules --; then
        changes+="●"
    fi

    if [[ -n $(git ls-files --others --exclude-standard) ]]; then
        changes+="+"
    fi

    local ahead behind
    ahead=$(git rev-list --count @{upstream}..HEAD 2>/dev/null || echo 0)
    behind=$(git rev-list --count HEAD..@{upstream} 2>/dev/null || echo 0)

    local sync_status=""
    [[ "$ahead" -gt 0 ]] && sync_status=" ↑$ahead"
    [[ "$behind" -gt 0 ]] && sync_status+=" ↓$behind"

    GIT_BRANCH="($branch$sync_status$changes)"
}


check_installed_pkg () {
    if [[ -f /tmp/$USER-alias-verified ]]; then
        return
    fi
    cat .config/zsh/aliases.zsh \
        | sed -n "s/alias *[A-Za-z0-9_,\.]*='\([A-Za-z0-9_\/]*\)[ '].*/\1/p" \
        | while read -r prog; do
            if ! [[ "$(command -v $prog)" =~ alias ]]; then
                command -v $prog > /dev/null \
                    || echo -e "\e[1;31mWARNING\e[0m $prog not installed"
            fi
        done
    touch /tmp/$USER-alias-verified
}

function yazi-script() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

tmux-initializer () {
if command -v tmux &> /dev/null; then
  if [[ "$#" -eq 2 ]]; then
    SESSION_NAME="$2"
  else
    SESSION_NAME="$USER-tmux-default"
  fi
  if [[ -z "$TMUX" && "$TERM_PROGRAM" != "vscode" ]]; then
    tmux has-session -t "$SESSION_NAME" 2>/dev/null
    if [ $? -eq 0 ]; then
      exec tmux attach-session -t "$SESSION_NAME"
    else
      exec tmux new-session -s "$SESSION_NAME"
    fi
  fi
fi
}

preexec () {
   set -A ELAPSED
   (( $#ELAPSED > 1000 )) && set -A ELAPSED $ELAPSED[-1000,-1]
   typeset -ig _start=SECONDS
   _command_time_preexec
}

precmd() {
    _command_time_precmd
    get_status
    git_stats
}
