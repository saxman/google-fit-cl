#!/bin/sh

source ACCESS_TOKEN.sh
source VARS.sh

DATASOURCE=derived:com.google.step_count.delta:com.google.android.gms:estimated_steps

# need to convert seconds to nanoseconds
url=$ENDPOINT/dataSources/$DATASOURCE/datasets/${START_OF_DAY}000000000-${NOW}000000000
echo $url; echo

curl \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  $url

