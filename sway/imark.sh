#!/bin/bash

name="$(i3-msg -t get_marks | tr -d '[],' | sed -e 's/""/\n/g' | tr -d '"' | dmenu -p mark)"
exec i3-msg mark "$name"
