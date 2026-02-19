#!/bin/env sh

#set -eo pipefail

#tofi-drun -c ~/.config/tofi/fullscreen | xargs swaymsg exec --

export XDG_DATA_DIRS=/home/timo/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share/:/usr/share/
fuzzel --counter --show-actions --config ~/.config/fuzzel/configs/applauncher.ini --terminal 'alacritty -e'
