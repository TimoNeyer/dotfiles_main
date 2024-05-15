#/bin/sh
nmcli c show --active | tail -n +2 | sed 's/\x20\x20\+/;/g' | awk 'BEGIN { FS=";"}
{ if ($3=="wifi"||$3=="vpn"||$3=="ethernet")
{ print $1}}'
