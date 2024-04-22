function x()
{
    if [ $@ = 'off' ]; then 
        xrandr --output eDP --primary --auto
        xset s 30 20
        echo off
    elif [ $@ = 'foff' ]; then xrandr -q | grep "connected" | awk '{print $1}' | while read -r line; do 
        if [ "$line" != "eDP" ]; then 
            xrandr --output "$line" --off 
        fi
        done
        echo all external monitors off
    elif [ $@ = 'mirr' ]; then 
        xrandr -q | grep " connected" | awk '{print $@}' | while read -r line; do
            if [ "$line" != "eDP" ]; then
                xrandr --output "$line" --auto
            fi
        done
        xset s 30 20
        xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock
        echo mirr
    elif [ $@ = 'office' ]; then
        xrandr --output HDMI-A-0 --mode 3840x2160 --auto --primary --rotate normal  --right-of eDP
        xset s 180 20
        xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock
        echo office
    elif [ $@ = 'parent' ]; then 
        xrandr --output DisplayPort-2 --auto --primary --output DisplayPort-4 --left-of DisplayPort-2 --auto --output eDP --off
        xset s 300 20
        xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock
        echo parent
    elif [ $@ = 'home' ]; then 
        xrandr --output HDMI-A-0  --auto --left-of eDP --mode 1920x1080 --primary  --output DisplayPort-0 --auto --left-of HDMI-A-0 --mode 3840x2160  
        xset s 300 20
        xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock
        echo home
    else 
        echo "unable to read: $@"
    fi
}
