#!/bin/bash

source ACCESS_TOKEN.sh
source VARS.sh

DATASET=dataSources
DATASOURCE=raw:com.google.body.fat.percentage:407408718192:BackfillBodyFatDataSource
DATATYPE=com.google.body.fat.percentage

DATADATE=$1
FAT=$2

if [ -z "$1" ]; then
	echo "Date yyyy/MM/dd ${DATADATE} Body Fat (%) ${FAT}"
	exit 1
fi

if [ -z "$2" ]; then
	echo "Date yyyy/MM/dd ${DATADATE} Body Fat (%) ${FAT}"
	exit 1
fi

echo "Date yyyy/MM/dd ${DATADATE} Body Fat (%) ${FAT}"

NOW=`date -j -u -f "%Y-%m-%d %T %z" "$DATADATE 08:00:00 $(date +%z)" "+%s"`
NOW_STR=`date -jr $NOW`
NOW_MS=`expr $NOW \* 1000`

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
              \"fpVal\": ${FAT}
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

