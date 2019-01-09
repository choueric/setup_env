#!/bin/sh

ICON=/usr/share/pixmaps/volnoti/display-brightness-symbolic.svg

VAL=`cat /sys/class/backlight/intel_backlight/actual_brightness`
MAX=`cat /sys/class/backlight/intel_backlight/max_brightness`

let "val = $VAL * 100 / $MAX"
echo $val%

volnoti-show -s $ICON $val
