#/bin/sh

mark=$(swaymsg -t get_marks | jq -S -c | tr -d '[]"' | tr ',' '\n' | tofi -c ~/.config/tofi/fullscreen --prompt-text window:)
if [ ! -n "$mark" ]; then
    echo "go $mark failed" >> /tmp/swaymark.log
    return 1
fi
swaymsg "[con_mark=$mark]" focus
