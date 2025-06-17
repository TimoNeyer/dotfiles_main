#!/bin/bash

LogFile=/tmp/powermenu.log

# Current Theme
theme="$HOME/.config/rofi/powermenu.rasi"
confirm="$HOME/.config/rofi/confirm.rasi"

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"
poweroff="systemctl poweroff"
reboot_="systemctl reboot"
suspend_="systemctl suspend -i"

if [[ "$1" == "sway" ]]; then
    exit_="swaymsg exit"
    lock_="$HOME/.config/screenlock/wayland.sh"
elif [[ "$1" == "hypr" ]]; then
    exit_="hyprctl dispatch exit"
    lock_="$HOME/.config/screenlock/wayland.sh"
elif [[ "$1" == "i3" ]]; then
    exit_="i3-msg exit"
    lock_="$HOME/.config/screenlock/x.sh"
else
    echo "Failed to get exit function for powermenu! received $1" >>$LogFile
    exit 1
fi

# Options
shutdown='⏻'
reboot='↻'
lock='🔒'
suspend='⏾'
logout='⎋'
launcher='✔️'
yes='✔️'
no='❌'

# Rofi CMD
rofi_cmd() {
    rofi -dmenu \
        -p "Goodbye" \
        -mesg "Uptime: $uptime" \
        -theme $theme
}

# Confirmation CMD
confirm_cmd() {
    rofi -dmenu \
        -p 'Confirm' \
        -mesg "${1:0:10}?" \
        -theme $confirm
}

# Ask for confirmation
confirm_exit() {
    echo -e "$yes\n$no" | confirm_cmd $1
}

# Pass variables to rofi dmenu
run_rofi() {
    echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
    selected="$(confirm_exit $1)"
    if [[ "$selected" == "$yes" ]]; then
        if [[ $1 == '--shutdown' ]]; then
            $poweroff
        elif [[ $1 == '--reboot' ]]; then
            systemctl reboot
        elif [[ $1 == '--suspend' ]]; then
            amixer set Master mute
            $suspend_ && $lock_
        elif [[ $1 == '--logout' ]]; then
            $exit_
        fi
    else
        exit 0
    fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$shutdown)
    if [[ "$(confirm_exit 'shutdown')" == "$yes" ]]; then
        /usr/bin/shutdown --now
    fi
    ;;
$reboot)
    if [[ "$(confirm_exit 'reboot')" == "$yes" ]]; then
        /usr/bin/reboot
    fi
    ;;
$lock)
    $lock_
    ;;
$suspend)
    amixer set Master mute
    systemctl suspend
    "$lock_"
    ;;
$logout)
    $exit_
    ;;
$launcher)
    ~/.config/rofi/launcher.sh
    ;;
esac
