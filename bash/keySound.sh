#!/bin/bash

DIRECTION=$1
if [ "$DIRECTION" == "+" ]; then
  amixer set Master 5%+
elif [ "$DIRECTION" == "-" ]; then
  amixer set Master 5%-
fi
