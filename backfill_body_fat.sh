#!/bin/bash

for item in $(cat body_fat_history.csv); do
	itemdate=$(echo $item | cut -d ',' -f 1);
	# echo $itemdate;
	itemfat=$(echo $item | cut -d ',' -f 2);
	# echo $itemfat

	echo ./body_fat_add_data.sh "${itemdate}" "${itemfat}"
	./body_fat_add_data.sh "${itemdate}" "${itemfat}"

done
