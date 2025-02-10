#!/bin/bash

## total = 255,
# 80% of 255 = 204,
# 55% of 255 = 140 and so on 
## Examples
## 80% fan speed
# sudo sh -c 'echo 204 > /sys/class/drm/card1/device/hwmon/hwmon3/pwm1'
## 55% fan speed
# sudo sh -c 'echo 140 > /sys/class/drm/card1/device/hwmon/hwmon3/pwm1'

gpu_path="/sys/class/drm/card1/device/hwmon/hwmon3/"
total_speed=255
default_percent_speed=50

# check for argument
if [[ -z "$1" ]]; then
  echo "No argument, using default speed of $default_percent_speed%"
  percent_speed=$default_percent_speed
else
  percent_speed=$1
fi

# validate, is integer and in range (0-100)
if ! [[ "$percent_speed" =~ ^[0-9]+$ ]] || (( percent_speed < 0 || percent_speed > 100 )); then
  echo "Error: Provide valid percentage between 0 - 100"
  exit 1
fi

final_speed=$(( percent_speed * total_speed / 100 ))  

# enable manual editing
sudo sh -c "echo 1 > $gpu_path/pwm1_enable"
# change speed
sudo sh -c "echo $final_speed > $gpu_path/pwm1"

echo "Fan speed set to $percent_speed%"
