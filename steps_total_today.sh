#!/bin/sh

source ACCESS_TOKEN.sh

ENDPOINT=https://www.googleapis.com/fitness/v1/users/me/dataSources
DATASOURCE=derived:com.google.step_count.delta:com.google.android.gms:estimated_steps

now=`date +%s`
start_of_day=$(echo "$now - ($now % 86400)" | bc)

# need to convert seconds to nanoseconds
url=$ENDPOINT/$DATASOURCE/datasets/${start_of_day}000000000-${now}000000000
echo $url; echo

curl \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  $url

