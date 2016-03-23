#!/bin/sh

TZ_OFFSET_SECS=$(echo '60 * 60 * 7' | bc)

NOW=`date +%s`
START_OF_DAY=$(echo "$NOW - ($NOW % 86400) + $TZ_OFFSET_SECS" | bc)

ENDPOINT=https://www.googleapis.com/fitness/v1/users/me

