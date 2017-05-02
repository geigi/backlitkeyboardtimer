#!/bin/bash

UPDATE_INTERVAL=3
TIMEOUT=30

for i in "$@"
do
case $i in
  -u=*|--update=*)
  UPDATE_INTERVAL="${i#*=}"
  shift
  ;;
  -t=*|--timeout=*)
  TIMEOUT="${i#*=}"
  shift
  ;;
  *)
          # unknown option
  ;;
esac
done

brightness=$(cat /sys/class/leds/smc::kbd_backlight/brightness)
restored=true

while true
do
sleep $UPDATE_INTERVAL
if [[ $(($TIMEOUT * 1000)) -lt $(xprintidle) ]]; then
  if [[ $restored = true ]]; then
    brightness=$(cat /sys/class/leds/smc::kbd_backlight/brightness)
    echo "0" > /sys/class/leds/smc::kbd_backlight/brightness
    restored=false
  fi
elif [[ $restored = false ]]; then
  restored=true
  echo $brightness > /sys/class/leds/smc::kbd_backlight/brightness
fi
done
