#!/bin/bash

name="$(swaymsg -t get_marks | tr -d '[],' | sed -e 's/""/\n/g' | tr -d '"' | rofi -theme rounded-nord-dark -dmenu -p mark)"
if [ ! -n "$name" ];then
    echo "marking $name failed" >> /tmp/swaymark.log
    return 1
fi
exec swaymsg mark "$name"
