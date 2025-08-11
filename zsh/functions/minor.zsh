function md() {
    pandoc $@ | lynx -stdin;
}

function mdpdf() {
    if [ -f "$2" ]; then
        echo Error: output file exists
    elif [ ! -f "$1" ]; then
       echo Error: input file not found
    else
      DATA_DIR="$(mktemp -d -p /tmp mdpdf.XXXXXXXX)"
        mkdir $DATA_DIR
        pandoc \
          --from=markdown \
          --to=pdf \
          --data-dir $DATA_DIR \
          -o $2 $1
        rm -r $DATA_DIR
    fi
}

function anonymous() {
    local anon=""
    if [[ -z "$HISTFILE" ]]; then
        echo "no histfile, assuming in anon"
        anon=true
    elif [[ -n "$ANON_SHELL" ]]; then
        anon=true
    fi
    if [[ "$#" -eq 1 ]]; then
        if [[ "$1" = "exit" ]]; then
            if [[ -n "$anon" ]]; then
                exit
            else
                echo "error: not in anon"
                return 1
            fi
        elif [[ "$1" = "enter" ]]; then
            unset HISTFILE
            export ANON_SHELL="true"
            $SHELL
        fi
    elif [[ "$#" -eq 0 ]] && [[ -z "$anon" ]]; then
            unset HISTFILE
            export ANON_SHELL="true"
            $SHELL
    else
        echo "error: unkown command: $@"
    fi
}

function hex-encode() {
  echo "$@" | xxd -p
}

function hex-decode() {
  echo "$@" | xxd -p -r
}

function fuck() {
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

function check_installed_pkg() {
    if [[ -f /tmp/$USER-alias-verified ]]; then
        return
    fi
    # do not use aliases here
    /usr/bin/cat .config/zsh/aliases.zsh |
      sed -n "s/alias *[A-Za-z0-9_,\.]*='\([A-Za-z0-9_\/]*\)[ '].*/\1/p" |
        while read -r prog; do
            if ! [[ "$(command -v $prog)" =~ "alias" ]]; then
                command -v $prog > /dev/null ||
                  echo -e "\e[1;31mWARNING\e[0m $prog not installed"
            fi
        done
}

function yazi-script() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function _tmux-initializer() {
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

function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_ESCAPE_BINDKEY=jj
  ZVM_VI_HIGHLIGHT_BACKGROUND=green
}

function _add_paths () {
  for d in "$@"; do
    [[ -d "$d" && ! "$PATH" =~ (^|:)$d(:|$) ]] && PATH="$PATH:$d"
  done
  :
}

function _zsh_set_title_hook() {
    command -v print > /dev/null || return
    if [[ "$TERM" = "alacritty" ]]; then
      print -Pn "\e]0;%n@%m: %~ — Alacritty\a"
    elif [[ "$TERM" = "xterm-kitty" ]]; then
      kitten @ set-window-title "$(pwd)"
    fi
}
