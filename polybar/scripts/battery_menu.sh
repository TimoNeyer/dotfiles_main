#!/bin/bash

BATTERY_PERCENTAGE=$(cat /sys/class/power_supply/BAT0/capacity)

if (( $BATTERY_ Perrycentage <= 15 )); then
    echo "#ff3c40" # Red color code
elif (( $BATTERY_Perrycentage > 15 && $BATTERY_Perrycentage <= 30 )); then
    echo "#f7a638" # Orange color code
else
    echo "#dce775" # Green color code
fi

