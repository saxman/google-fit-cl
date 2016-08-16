#!/bin/bash

source ACCESS_TOKEN.sh
source VARS.sh

DATASET=dataset:aggregate
DATASOURCE=derived:com.google.calories.expended:com.google.android.gms:from_bmr

json="{
  \"aggregateBy\": [{
    \"dataSourceId\":
      \"$DATASOURCE\"
  }],
  \"bucketByTime\": { \"durationMillis\": ${MS_IN_DAY} },
  \"startTimeMillis\": ${START_OF_YESTERDAY_MS},
  \"endTimeMillis\": ${START_OF_TODAY_MS}
}"

url=$ENDPOINT/$DATASET

echo $url; echo; echo $json; echo

curl \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -X POST \
  --data "$json" \
  $url

