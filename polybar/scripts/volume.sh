#!/bin/bash
mute=$(amixer scontents | head -n 7 | tail -n 1| sed 's/.*\[off\]/MUTE/g' | sed 's/.*\[on\]//g')
if [[ -z "$mute" ]]; then
  controls=$(amixer contents | head -n 6 | tail -n -2)
  max=$(echo $controls | sed 's/.*max=\([0-9]*\).*/\1/')
  values=$(echo $controls | sed 's/.*values=\([0-9]*\).*/\1/')
  echo "$max $values" | awk '{print int(100 * $2 / $1)}'
else
  echo $mute
fi
