#/bin/sh

echo $(amixer -D pulse sget Master | grep -Eo '[0-9]+%' | head -1)
