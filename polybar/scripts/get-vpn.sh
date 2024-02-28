#/bin/sh 

STATUS=$(protonvpn-cli s)


if [ "$(echo $STATUS | grep 'No active Proton VPN connection.')" != "No active Proton VPN connection." ]; then
    echo $(echo "$STATUS" | grep "Server:" | awk '{ print $2 }' )   
else
    echo "OFF"
fi
