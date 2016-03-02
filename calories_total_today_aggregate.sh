#!/bin/bash

source ACCESS_TOKEN.sh

ENDPOINT=https://www.googleapis.com/fitness/v1/users/me
DATASET=dataset:aggregate

DATASOURCE_1=derived:com.google.calories.expended:com.google.android.gms:from_bmr
DATASOURCE_2=derived:com.google.calories.expended:com.google.android.gms:from_activities
DATASOURCE_3=derived:com.google.calories.expended:com.google.android.gms:default_calories_expended
DATASOURCE_4=derived:com.google.calories.expended:com.google.android.gms:merge_calories_expended
DATASOURCE_5=derived:com.google.calories.expended:com.google.android.gms:platform_calories_expended
DATASOURCE_6=derived:com.google.calories.bmr:com.google.android.gms:merged

DATASOURCE=$DATASOURCE_2

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

