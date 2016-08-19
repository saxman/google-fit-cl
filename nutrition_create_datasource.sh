#!/bin/bash

source ACCESS_TOKEN.sh
source VARS.sh

DATASET=dataSources

json="{
  \"dataStreamName\": \"MyNutritionDataSource\",
  \"type\": \"raw\",
  \"application\": {
    \"detailsUrl\": \"http://example.com\",
    \"name\": \"My Example App\",
    \"version\": \"1\"
  },
  \"dataType\": {
    \"name\": \"com.google.nutrition\",
    \"field\": [
     {
      \"name\": \"nutrients\",
      \"format\": \"map\"
     },
     {
      \"name\": \"meal_type\",
      \"format\": \"integer\",
      \"optional\": true
     },
     {
      \"name\": \"food_item\",
      \"format\": \"string\",
      \"optional\": true
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

