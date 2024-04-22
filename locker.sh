#/bin/bash

# setup for config
export XSECURELOCK_AUTH_BACKGROUND_COLOR=#000000
export XSECURELOCK_FONT=-*-fixed-bold-*-*-*-18-*-*-*-*-*-*-*
export XSECURELOCK_SHOW_USERNAME=1
export XSECURELOCK_SHOW_HOSTNAME=0
export XSECURELOCK_DISCARD_FIRST_KEYPRESS=1
export XSECURELOCK_SAVER=saver_xscreensaver
export XSECURELOCK_PASSWORD_PROMPT=time_hex
export XSECURELOCK_WAIT_TIME_MS=10000
export XSECURELOCK_SINGLE_AUTH_WINDOW=1

# Deactivate all external displays
xrandr --output eDP --auto 

xsecurelock
