#!/bin/sh

source ACCESS_TOKEN.sh
source VARS.sh

DATASOURCE=derived:com.google.step_count.delta:com.google.android.gms:estimated_steps

# need to convert ms to ns
url=$ENDPOINT/dataSources/$DATASOURCE/datasets/${START_OF_TODAY_MS}000000-${NOW_MS}000000
echo $url; echo

curl \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  $url

