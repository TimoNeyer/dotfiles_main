#/bin/bash

killall waybar
waybar -c ~/.config/waybar/config.jsonc &
2>&1 >/dev/null
