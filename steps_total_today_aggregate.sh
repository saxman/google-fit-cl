#!/bin/bash

source ACCESS_TOKEN.sh
source VARS.sh

DATASET=dataset:aggregate
DATASOURCE=derived:com.google.step_count.delta:com.google.android.gms:estimated_steps

json="{
  \"aggregateBy\": [{
    \"dataSourceId\":
      \"$DATASOURCE\"
  }],
  \"bucketByTime\": { \"durationMillis\": 86400000 },
  \"startTimeMillis\": ${START_OF_DAY}000,
  \"endTimeMillis\": ${NOW}000
}"

url=$ENDPOINT/$DATASET

echo $url; echo; echo $json; echo

curl \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -X POST \
  --data "$json" \
  $url

