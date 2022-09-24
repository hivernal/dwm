#!/bin/bash
layout () {
  # printf "[ KEY $(xkb-switch) ]"
	if [[ $(xset -q | grep LED | awk '{ print $10 }') = 00000000 ]]; then
  printf "[ KEY US ]"
else
  printf "[ KEY RU ]"
	fi
}
clock() {
  printf "[ $(date +%H:%M) ]" > /tmp/time
}
ssid () {
  SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)
  if [[ $SSID = "" ]]; then
    SSID=disconnected
  fi
  printf "[ NET $SSID ]" > /tmp/ssid
}
memory () {
  printf "[ MEM $(free -h | awk '(NR==2){ print $3 }') ]" > /tmp/memory
}
volume () {
	if [[ $(awk -F"[][]" '/dB/ { print $6 }' <(amixer sget Master)) = off ]]; then
		printf "[ VOL muted ]"
  else
		printf "[ VOL $(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))% ]"
	fi
  # echo "[ VOL $(pamixer --get-volume-human) ]"
}
battery () {
  printf "[ BAT $(cat /sys/class/power_supply/BAT0/capacity)%% ]"
}

parallel1() {
  while true; do
    ssid
    memory
    sleep 5
  done
}
parallel2() {
  while true; do
    clock
    sleep 30
  done
}

parallel1 &
parallel2 &
while true; do
  xsetroot -name "$(layout) $(volume) $(< /tmp/memory) $(battery) $(< /tmp/ssid) $(< /tmp/time)"
  sleep 0.5s
done &
