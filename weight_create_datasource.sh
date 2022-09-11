#!/bin/bash

source ACCESS_TOKEN.sh
source VARS.sh

DATASET=dataSources

json="{
  \"dataStreamName\": \"BackfillWeightDataSource\",
  \"type\": \"raw\",
  \"application\": {
    \"detailsUrl\": \"http://example.com\",
    \"name\": \"Bash OSX\",
    \"version\": \"1\"
  },
  \"dataType\": {
    \"name\": \"com.google.weight\",
    \"field\": [
     {
      \"name\": \"weight\",
      \"format\": \"floatPoint\"
     }
    ]
   }
}"

url=$ENDPOINT/$DATASET

echo $url; echo; echo $json; echo

curl \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -X POST \
  --data "$json" \
  $url

