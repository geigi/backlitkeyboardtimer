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
<<<<<<< HEAD
  if [[ $restored = true ]]; then
=======
  if [[ restored ]]; then
>>>>>>> 849effe6a9604f9f580c7c0ad64e27a15d2552d8
    brightness=$(cat /sys/class/leds/smc::kbd_backlight/brightness)
    echo "0" > /sys/class/leds/smc::kbd_backlight/brightness
    restored=false
  fi
<<<<<<< HEAD
elif [[ $restored = false ]]; then
=======
elif [[ !restored ]]; then
>>>>>>> 849effe6a9604f9f580c7c0ad64e27a15d2552d8
  restored=true
  echo $brightness > /sys/class/leds/smc::kbd_backlight/brightness
fi
done
