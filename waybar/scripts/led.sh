#/bin/sh

echo $(brightnessctl i | tr ' ' '\n' | sed -n "/\([0-9]*\%\)/p" | tr -d '( ) %') 
