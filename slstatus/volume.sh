#!/bin/bash

MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{printf $2}')

if [[ $MUTED = "yes" ]]; then
  echo "muted"
else
  VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '(NR==1) {printf $5}')
  echo $VOLUME
fi
