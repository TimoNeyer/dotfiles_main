#!/bin/env sh

set -euo pipefail

LAPTOP_OUTPUT="eDP-1"
LID_STATE_FILE="/proc/acpi/button/lid/LID/state"

[[ ! -f "$LID_STATE_FILE" ]] && exit 0

while true; do
  sleep 5
  if [[ "$(<"${LID_STATE_FILE}")" =~ open ]]; then
    if [[ -n "$(wlr-randr --json | jq -c '.[]
      | select(
        (.name == "eDP-1" and .enabled == false)
        or (.name != "eDP-1" and .enabled == true))
      |  isempty(.)')" ]]; then
      swaymsg output "$LAPTOP_OUTPUT" enable
      notify-send -u low -t 5000 -a "Clamshell Daemon" -c Display "Monitors detached and Lid closed
Activating Laptop display"
    fi
  fi
done
