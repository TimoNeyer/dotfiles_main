#!/bin/env sh

set -e
set -o pipefail

tofi-drun -c ~/.config/tofi/fullscreen |
  xargs swaymsg exec --
