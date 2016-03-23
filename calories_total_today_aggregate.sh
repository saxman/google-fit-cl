#!/bin/bash

source ACCESS_TOKEN.sh
source VARS.sh

DATASET=dataset:aggregate

DATASOURCE_1=derived:com.google.calories.expended:com.google.android.gms:from_bmr
DATASOURCE_2=derived:com.google.calories.expended:com.google.android.gms:from_activities
DATASOURCE_3=derived:com.google.calories.expended:com.google.android.gms:default_calories_expended
DATASOURCE_4=derived:com.google.calories.expended:com.google.android.gms:merge_calories_expended
DATASOURCE_5=derived:com.google.calories.expended:com.google.android.gms:platform_calories_expended
DATASOURCE_6=derived:com.google.calories.bmr:com.google.android.gms:merged

DATASOURCE=$DATASOURCE_2

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

