#!/bin/bash

LogFile=/tmp/powermenu.log

# Current Theme
theme="$HOME/.config/rofi/powermenu.rasi"
confirm="$HOME/.config/rofi/confirm.rasi"

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
poweroff="systemctl poweroff"
reboot_="systemctl reboot"
suspend_="systemctl suspend -i"
lock_="hyprlock"

echo $1 >> $LogFile

if [[ "$1" == "sway" ]]; then
    exit_="swaymsg exit"
elif [[ "$1" == "hypr" ]]; then
    exit_="hyprctl dispatch exit"
else
    echo "Failed to get exit function for powermenu! received $1" >> $LogFile
    exit 1
fi

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
		    $poweroff
		elif [[ $1 == '--reboot' ]]; then
			$reboot_
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
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
        $lock_
        ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
