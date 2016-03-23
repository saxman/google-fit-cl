#!/bin/sh

source ACCESS_TOKEN.sh
source VARS.sh

DATASET_1=derived:com.google.calories.expended:com.google.android.gms:from_bmr
DATASET_2=derived:com.google.calories.expended:com.google.android.gms:from_activities
DATASET_3=derived:com.google.calories.expended:com.google.android.gms:default_calories_expended
DATASET_4=derived:com.google.calories.expended:com.google.android.gms:merge_calories_expended
DATASET_5=derived:com.google.calories.expended:com.google.android.gms:platform_calories_expended
DATASET_6=derived:com.google.calories.bmr:com.google.android.gms:merged

DATASET=$DATASET_1

url=$ENDPOINT/dataSources/$DATASET/datasets/${START_OF_DAY}000000000-${NOW}000000000
echo $url; echo

curl \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  $url

