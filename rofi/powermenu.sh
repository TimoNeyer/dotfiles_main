#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5

# Current Theme
theme="$HOME/.config/rofi/powermenu.rasi"
confirm="$HOME/.config/rofi/confirm.rasi"

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"

# Options
shutdown='⏻'
reboot='↻'
lock='🔒'
suspend='⏾'
logout='⎋'
yes='✔️'
no='❌'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Bye" \
		-mesg "Uptime: $uptime" \
		-theme ${theme}
}

# Confirmation CMD
confirm_cmd() {
	rofi -dmenu \
		-p 'Confirmation' \
        -mesg "${1:2:10}?" \
        -theme  $confirm
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
			systemctl poweroff && swaylock -C ~/.config/sway/lock
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot && swaylock -C ~/.config/sway/lock
		elif [[ $1 == '--suspend' ]]; then
			amixer set Master mute
			systemctl suspend && swaylock -C ~/.config/sway/lock
		elif [[ $1 == '--logout' ]]; then
            swaymsg exit
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
        swaylock -C ~/.config/sway/lock
        ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
