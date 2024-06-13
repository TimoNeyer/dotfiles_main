#!/bin/bash

name="$(swaymsg -t get_marks | tr -d '[],' | sed -e 's/""/\n/g' | tr -d '"' | rofi -dmenu -p mark)"
echo $name
exec swaymsg mark "$name"
