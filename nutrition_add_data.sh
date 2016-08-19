#!/bin/bash

source ACCESS_TOKEN.sh
source VARS.sh

DATASET=dataSources
DATASOURCE=raw:com.google.nutrition:407408718192:MyNutritionDataSource
DATATYPE=com.google.nutrition

END_TIME=`expr $NOW_MS + 1`

## The values for the nutrition data type are nutrients (a map), meal type (4 = 'snack'), and food item (a string)

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
          \"mapVal\": [
          {
            \"key\": \"fat.total\",
            \"value\": {
              \"fpVal\": 0.4
            }
          },
          {
            \"key\": \"sodium\",
            \"value\": {
              \"fpVal\": 1.0
            }
          },
          {
            \"key\": \"fat.saturated\",
            \"value\": {
              \"fpVal\": 0.1
            }
          },
          {
            \"key\": \"protein\",
            \"value\": {
              \"fpVal\": 1.3
            }
          },
          {
            \"key\": \"carbs.total\",
            \"value\": {
              \"fpVal\": 27.0
            }
          },
          {
            \"key\": \"cholesterol\",
            \"value\": {
              \"fpVal\": 0.0
            }
          },
          {
            \"key\": \"calories\",
            \"value\": {
              \"fpVal\": 105.0
            }
          },
          {
            \"key\": \"sugar\",
            \"value\": {
              \"fpVal\": 14.0
            }
          },
          {
            \"key\": \"dietary_fiber\",
            \"value\": {
              \"fpVal\": 3.1
            }
          },
          {
            \"key\": \"potassium\",
            \"value\": {
              \"fpVal\": 422.0
            }
          }
         ]
        },
        {
          \"intVal\": 4
        },
        {
          \"strVal\": \"banana\"
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

