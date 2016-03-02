#!/bin/sh

source ACCESS_TOKEN.sh

url=https://www.googleapis.com/fitness/v1/users/me/dataSources
echo $url

curl \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  $url

