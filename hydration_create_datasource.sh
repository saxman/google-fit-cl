#!/bin/bash

source ACCESS_TOKEN.sh
source VARS.sh

DATASET=dataSources

json="{
  \"dataStreamName\": \"MyHydrationDataSource\",
  \"type\": \"raw\",
  \"application\": {
    \"detailsUrl\": \"http://example.com\",
    \"name\": \"My Example App\",
    \"version\": \"1\"
  },
  \"dataType\": {
    \"name\": \"com.google.hydration\",
    \"field\": [
     {
      \"name\": \"volume\",
      \"format\": \"floatPoint\",
      \"optional\": false
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

