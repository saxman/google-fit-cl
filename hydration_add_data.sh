#!/bin/bash

source ACCESS_TOKEN.sh
source VARS.sh

DATASET=dataSources
DATASOURCE=raw:com.google.hydration:407408718192:MyHydrationDataSource
DATATYPE=com.google.hydration

END_TIME=`expr $NOW_MS + 1`

json="{
  \"minStartTimeNs\": ${NOW_MS}000000,
  \"maxEndTimeNs\": ${END_TIME}000000,
  \"dataSourceId\":
    \"${DATASOURCE}\",
  \"point\": [
    {
      \"startTimeNanos\": ${NOW_MS}000000,
      \"endTimeNanos\": ${END_TIME}000000,
      \"dataTypeName\": \"${DATATYPE}\",
      \"value\": [
        {
              \"fpVal\": 0.4
        }
      ]
    }
  ]
}"

url=$ENDPOINT/$DATASET/$DATASOURCE/datasets/${NOW_MS}000000-${END_TIME}000000

echo $url; echo; echo $json; echo

## note the use of "--request PATCH" instead of "-X POST"

curl \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  --request PATCH \
  --data "$json" \
  $url

