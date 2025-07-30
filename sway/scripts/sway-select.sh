#!/bin/env sh

set -e
set -o pipefail

swaymsg --raw -t get_tree |
  jq -c 'recurse(.nodes?[]) 
    | select(
        .name != null
        and (.name | test("(__i3.*)|(root)|(e?DP-[0-9])|(^[0-9]$)") | not) 
      )
      | "\(.name):\(.id)"' |
  tr -d '"' |
  wofi -d -i -E -M fuzzy -s ~/.config/wofi/sway-select/style.css -p "Select Window" |
  cut -f2 -d: |
  xargs -I % [[ -n '%' ]] && swaymsg -- '[con_id=%] focus'
