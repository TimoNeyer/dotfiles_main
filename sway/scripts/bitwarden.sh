#!/bin/bash

# This should run the bw utility that is part of the official bitwarden desktop client flatpak.
# If you want to set this to your own instance, use $CMD config server <url> once
CMD="flatpak run --user --command=bw com.bitwarden.desktop"
export BW_SESSION=""
FIFO=""
PID_FILE="/run/user/$(id -u)/bitwarden-cli.pid"

function unlock() {
  $CMD unlock --check >/dev/null 2>/dev/null && return 0
  BW_SESSION=$($CMD unlock $(fuzzel --password='' --prompt-only='pw> ' -d --keyboard-focus=exclusive --config ~/.config/fuzzel/themes/dracula.ini) --raw || echo "")
  if [[ -z "$BW_SESSION" ]]; then
    notify-send -u critical -t 2000 -a "Bitwarden cli" -c Bitwarden "Error, probably wrong password"
    exit 1
  fi
}

function lock() {
  $CMD lock || true
  rm $PID_FILE || true
  rm $FIFO || true
  exit 0
}

function get() {
  unlock
  CHOSEN=$($CMD list items |
    jq -r '.[]
      | {name: .name // "no-name", username: .login.username // "no-username", password: .login.password}
      | "\(.username)  \(.name)\t\(.password)"' |
    fuzzel -d --with-nth=1 --accept-nth=2 -p 'bw> ' --config ~/.config/fuzzel/themes/dracula.ini)
  if [[ -z "$CHOSEN" ]]; then
    return 0
  fi
  echo $CHOSEN | wl-copy -n
  sleep 30
  clipman clear -t CUSTOM -T "grep -F $CHOSEN"
}

function init() {
  if [[ -f "$PID_FILE" ]]; then
    notify-send -u normal -t 2000 -a "Bitwarden cli" -c Bitwarden "Error: found daemon process (pid: $PID_FILE), replacing"
    kill $(cat $PID_FILE) || true
    rm $PID_FILE
  fi
  FIFO="$(mktemp -u -p /run/user/$(id -u) bw-cli.XXXXXXXXXXXXXXXX)"
  mkfifo $FIFO
  echo $$ >/run/user/$(id -u)/bitwarden-cli.pid
}

if [[ "$1" = "server" ]]; then
  trap lock 2 15
  trap get 10
  init
  while true; do
    sleep 1
  done
else
  kill -s USR1 $(cat $PID_FILE)
fi
