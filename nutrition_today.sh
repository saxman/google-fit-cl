#!/bin/bash

source ACCESS_TOKEN.sh
source VARS.sh

DATASET=dataset:aggregate
DATASOURCE=raw:com.google.nutrition:407408718192:MyDataSource

json="{
  \"aggregateBy\": [{
    \"dataSourceId\":
      \"$DATASOURCE\"
  }],
  \"bucketByTime\": { \"durationMillis\": ${MS_IN_DAY} },
  \"startTimeMillis\": ${START_OF_TODAY_MS},
  \"endTimeMillis\": ${NOW_MS}
}"

url=$ENDPOINT/$DATASET

echo $url; echo; echo $json; echo

curl \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -X POST \
  --data "$json" \
  $url

