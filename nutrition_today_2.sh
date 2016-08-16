#!/bin/bash

##
## DOES NOT WORK: Nutrition does not appear to support aggregation
##

source ACCESS_TOKEN.sh
source VARS.sh

DATASET=dataset:aggregate
DATATYPE=com.google.nutrition

json="{
  \"aggregateBy\": [{
    \"dataTypeName\":
      \"${DATATYPE}\"
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

