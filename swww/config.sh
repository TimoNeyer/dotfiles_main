#!/bin/sh
# Check swww daemon
swww query 2>/dev/null >/dev/null
if [ $? -eq 1 ] ; then
    swww init
fi

swww img /usr/share/backgrounds/active
