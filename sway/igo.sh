#/bin/sh

mark=$(swaymsg -t get_marks | head -n -1 | tail -n -1 | tr -d '"[:blank:]"' | rofi -theme rounded-nord-dark -dmenu -p go)
if [ ! -n "$mark" ]; then
    echo "go $mark failed" >> /tmp/swaymark.log
    return 1
fi
swaymsg "[con_mark=$mark]" focus
