#!/bin/bash

case "$1" in
    "restart")
        systemctl reboot
        ;;
    "shutdown")
        systemctl poweroff
        ;;
    "lock")
        swaylock -C ~/.config/sway/lock
        ;;
esac
