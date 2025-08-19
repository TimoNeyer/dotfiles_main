#!/bin/env sh

set -euo pipefail

LAPTOP_OUTPUT="eDP-1"
LID_STATE_FILE="/proc/acpi/button/lid/LID/state"

[[ ! -f "$LID_STATE_FILE" ]] && exit 0

while true; do
  sleep 5
  if [[ "$(<"${LID_STATE_FILE}")" =~ open ]]; then
    if swaymsg --raw -t get_outputs | jq -c '.[]
      | select(.active == false and .name == "eDP-1")
      |  .name' >/dev/null 2>&1; then
      swaymsg output "$LAPTOP_OUTPUT" enable
    fi
  else
    swaymsg output "$LAPTOP_OUTPUT" disable
  fi
done
