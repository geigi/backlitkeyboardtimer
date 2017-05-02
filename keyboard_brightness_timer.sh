#!/bin/bash

brightness=$(cat /sys/class/leds/smc::kbd_backlight/brightness)
restored=true

while true
do
sleep 3
if [[ $((30 * 1000)) -lt $(xprintidle) ]]; then
  brightness=$(cat /sys/class/leds/smc::kbd_backlight/brightness)
  echo "0" > /sys/class/leds/smc::kbd_backlight/brightness
  restored=false
elif [[ !restored ]]; then
  restored=true
  echo $brightness > /sys/class/leds/smc::kbd_backlight/brightness
fi
done
