#!/bin/bash

for item in $(cat weight_history.csv); do
	itemdate=$(echo $item | cut -d ',' -f 1);
	# echo $itemdate;
	itemweight=$(echo $item | cut -d ',' -f 2);
	# echo $itemweight

	echo ./weight_add_data.sh "${itemdate}" "${itemweight}"
	./weight_add_data.sh "${itemdate}" "${itemweight}"

done
