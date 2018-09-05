#!/bin/sh

VAL=`cat /sys/class/backlight/intel_backlight/actual_brightness`
MAX=`cat /sys/class/backlight/intel_backlight/max_brightness`

let "val = $VAL * 100 / $MAX"
echo $val%
