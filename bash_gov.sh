#!/bin/bash
PS3="> "
menu_from_array ()
{
  select item; do
  # Check the selected menu item number
  if [ 1 -le "$REPLY" ] && [ "$REPLY" -le $# ];
    then
      echo "$item" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
      break;
    else
      echo "Wrong selection: Select any number from 1-$#"
    fi
  done
}

read -d "" -a govs < /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
menu_from_array "${govs[@]}"
