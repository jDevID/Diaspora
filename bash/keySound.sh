#!/bin/bash

DIRECTION=$1

if [ "$DIRECTION" == "+" ]; then
  pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ "$DIRECTION" == "-" ]; then
  pactl set-sink-volume @DEFAULT_SINK@ -5%
fi



#   REQUIREMENTS  #

# pavucontrol
# initial wasn't modifying third party sound device like bluetooth
# modifying on sound_card at control_name wasn't working at all
