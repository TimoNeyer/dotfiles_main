#/bin/sh

mark=$(i3-msg -t get_marks | tr -d '[],' | sed -e 's/""/\n/g' | tr -d '"' | awk '{print "\""$0"\""}' | dmenu -p mark)
i3-msg "[con_mark=$mark]" focus


