#!/bin/sh

source ACCESS_TOKEN.sh

ENDPOINT=https://www.googleapis.com/fitness/v1/users/me/dataSources

DATASET_1=derived:com.google.calories.expended:com.google.android.gms:from_bmr
DATASET_2=derived:com.google.calories.expended:com.google.android.gms:from_activities
DATASET_3=derived:com.google.calories.expended:com.google.android.gms:default_calories_expended
DATASET_4=derived:com.google.calories.expended:com.google.android.gms:merge_calories_expended
DATASET_5=derived:com.google.calories.expended:com.google.android.gms:platform_calories_expended
DATASET_6=derived:com.google.calories.bmr:com.google.android.gms:merged

DATASET=$DATASET_1

now=`date +%s`
start_of_day=$(echo "$now - ($now % 86400)" | bc)

# echo `date -r $start_of_day`
# echo `date -r $now`
# echo

url=$ENDPOINT/$DATASET/datasets/${start_of_day}000000000-${now}000000000
echo $url; echo

curl \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  $url

