#!/bin/env sh


TIME=$(date -Isecond)

grim -g "$(slurp)" ~/Pictures/Screenshots/$TIME.png
sleep 0.1
cat ~/Pictures/Screenshots/$TIME.png | wl-copy
