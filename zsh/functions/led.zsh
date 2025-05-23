function led()
{
    if [ "$1" = "k" ]; then
        devices=$(brightnessctl --list | grep 'Device' | awk -F "'" '{print $2}')
        case "$2" in
            kbd)
                device_key="tpacpi::kbd_backlight"
                ;;
            mic)
                device_key="platform::micmute"
                ;;
            speaker)
                device_key="platform::mute"
                ;;
            *)
                device_key=$2
                ;;
        esac
        if echo $devices | tr " " "\n" | grep -F -q -x "$device_key"  && [[ "$3" =~ ^[0-9]+$ ]]; then
                sudo brightnessctl --device="$device_key" set $3
        elif [ "$2" = "l" ]; then
            echo $devices | tr " " "\n"
        else
            echo command not understood in keyboard options
            echo 2: $device_key
            echo 3: $3
            return 1
        fi

    elif [ "$1" = "s" ]; then
        if [[ "$3" =~ ^[0-9]+$ ]]; then
            brightnessctl -d 'amdgpu_bl0' s $2\%-
        fi
    else
        echo command not understood
        return 1
    fi
}
