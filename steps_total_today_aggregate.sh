#!/bin/bash

source ACCESS_TOKEN.sh

ENDPOINT=https://www.googleapis.com/fitness/v1/users/me
DATASET=dataset:aggregate

DATASOURCE=derived:com.google.step_count.delta:com.google.android.gms:estimated_steps

now=`date +%s`
start_of_day=$(echo "$now - ($now % 86400)" | bc)

json="{
  \"aggregateBy\": [{
    \"dataSourceId\":
      \"$DATASOURCE\"
  }],
  \"bucketByTime\": { \"durationMillis\": 86400000 },
  \"startTimeMillis\": ${start_of_day}000,
  \"endTimeMillis\": ${now}000
}"

url=$ENDPOINT/$DATASET

echo $url; echo; echo $json; echo

curl \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -X POST \
  --data "$json" \
  $url

