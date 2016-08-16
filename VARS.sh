#!/bin/sh

ENDPOINT=https://www.googleapis.com/fitness/v1/users/me

## All time calculations here in seconds

SECS_IN_DAY=`expr 60 \* 60 \* 24`
MS_IN_DAY=`expr $SECS_IN_DAY \* 1000`
TZ_OFFSET=`expr 60 \* 60 \* 7`

NOW=`date +%s`
START_OF_TODAY=$(echo "$NOW - ($NOW % $SECS_IN_DAY) + $TZ_OFFSET" | bc)

if [ $START_OF_TODAY -gt $NOW ] ; then
   START_OF_TODAY=`expr $START_OF_TODAY - $SECS_IN_DAY`
fi

START_OF_YESTERDAY=`expr $START_OF_TODAY - $SECS_IN_DAY`

NOW_STR=`date -jr $NOW`
NOW_MS=`expr $NOW \* 1000`

START_OF_TODAY_STR=`date -jr $START_OF_TODAY`
START_OF_TODAY_MS=`expr $START_OF_TODAY \* 1000`

START_OF_YESTERDAY_STR=`date -jr $START_OF_YESTERDAY`
START_OF_YESTERDAY_MS=`expr $START_OF_YESTERDAY \* 1000`

## If script run instead of sourced, output debug info
if [ $(basename $0) = 'VARS.sh' ]; then
   echo NOW: $NOW_STR
   echo START_OF_TODAY: $START_OF_TODAY_STR
   echo START_OF_YESTERDAY: $START_OF_YESTERDAY_STR
fi

