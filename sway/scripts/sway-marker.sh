#!/bin/env sh

set -e
set -o pipefail

if [[ "$1" = "mark" ]]; then
  swaymsg --raw -t get_marks |
    jq -r '.[]' |
    wofi -s ~/.config/wofi/themes/nord.css -d -p Set Marker |
    xargs swaymsg mark
elif [[ "$1" = "go" ]]; then
  swaymsg --raw -t get_marks |
    jq -r '.[]' |
    wofi -s ~/.config/wofi/themes/nord.css -d -p Set Marker |
    xargs -I % swaymsg "[con_mark=%]" focus
fi
