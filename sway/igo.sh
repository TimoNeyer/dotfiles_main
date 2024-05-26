#/bin/sh

mark=$(swaymsg -t get_marks | head -n -1 | tail -n -1 | tr -d '"[:blank:]"' | rofi -dmenu)
swaymsg "[con_mark=$mark]" focus
