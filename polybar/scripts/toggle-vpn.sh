#/bin/sh 

if [ "$(protonvpn-cli s | grep 'No active Proton VPN connection.')" != "No active Proton VPN connection." ]; then
    protonvpn-cli d
else
    protonvpn-cli r
fi
