#!/bin/bash

layout () {
	printf "[ KEY $(xkb-switch) ]"
}

clock() {
	printf "[ $(date +%H:%M) ]" > /tmp/time
}

ssid () {
	if [[ $(nmcli | grep connected | cut -b 20-) = "" ]]; then
		printf "[ NET disconnected ]" > /tmp/ssid
	else
		printf "[ NET $(nmcli | grep connected | cut -b 20-) ]" > /tmp/ssid
	fi
}

memory () {
	printf "[ MEM $(free -h | awk '(NR==2){ print $3 }') ]" > /tmp/memory
}

volume () {
  printf "[ VOL $(pamixer --get-volume-human)% ]"
}

battery () {
	printf "[ BAT $(< /sys/class/power_supply/BAT0/capacity)%% ]"
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
		sleep 60
	done
}


parallel1 &
parallel2 &
while true; do
	xsetroot -name "$(layout) $(volume) $(< /tmp/memory) $(battery) $(< /tmp/ssid) $(< /tmp/time)"
	sleep 1
done &
# slstatus &
