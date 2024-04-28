#/bin/sh

echo $(nmcli connection show --active | grep -v lo | grep -v NAME | awk '{ print $1 }') | sed 's/\x20/,/g' | sed 's/,lo/\x20/g'
