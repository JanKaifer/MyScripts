#! /bin/bash

MAX_LIGHT_PATH=/sys/class/backlight/intel_backlight/max_brightness
ACTUAL_LIGHT_PATH=/sys/class/backlight/intel_backlight/brightness

MAX_LIGHT=$(cat $MAX_LIGHT_PATH)
MINIMAL_STEP=1

ACTUAL_LIGHT=$(cat $ACTUAL_LIGHT_PATH)

CHANGE=$(($ACTUAL_LIGHT / 3))

if [ $CHANGE -lt $MINIMAL_STEP ] ;
then CHANGE=$MINIMAL_STEP ;
fi

NEW_LIGHT=$(($ACTUAL_LIGHT $1 $CHANGE))

if [ $NEW_LIGHT -lt 0 ] ;
then NEW_LIGHT=0;
fi

if [ $NEW_LIGHT -gt $MAX_LIGHT ] ;
then NEW_LIGHT=$MAX_LIGHT ;
fi

sudo echo $NEW_LIGHT > $ACTUAL_LIGHT_PATH

