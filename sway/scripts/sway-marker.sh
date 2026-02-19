#!/bin/env sh

set -e
set -o pipefail

if [[ "$1" = "mark" ]]; then
  swaymsg --raw -t get_marks |
    jq -r '.[]' |
    fuzzel -d -p "Mark: " |
    xargs swaymsg mark
elif [[ "$1" = "go" ]]; then
  swaymsg --raw -t get_marks |
    jq -r '.[]' |
    fuzzel -d -p "Go: " |
    xargs -I % swaymsg "[con_mark=%]" focus
fi
