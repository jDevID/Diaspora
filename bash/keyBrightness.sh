#!/bin/bash
MONITOR=$(xrandr | grep -w connected | awk '{print $1}')
DIRECTION=$1

CURRENT_BRIGHTNESS=$(xrandr --verbose | grep -i -m 1 "$MONITOR" -A 7 | grep -i brightness | awk '{print $2}')
if [ "$DIRECTION" == "+" ]; then
  NEW_BRIGHTNESS=$(echo "$CURRENT_BRIGHTNESS + 0.15" | bc)
elif [ "$DIRECTION" == "-" ]; then
  NEW_BRIGHTNESS=$(echo "$CURRENT_BRIGHTNESS - 0.15" | bc)
fi
xrandr --output "$MONITOR" --brightness "$NEW_BRIGHTNESS"
