#!/bin/sh

case $1 in
	start)
		tags="\"\""
		if [ $#	-ge 4 ]
		then
			tags=$(echo -n "\"$4\"" | sed 's/,/","/g')
		fi
		curl -v -u $2:api_token -H "Content-type: application/json" -d "{\"time_entry\":{\"description\":\"$3\",\"tags\":[$tags]}}" -X POST "https://www.toggl.com/api/v8/time_entries/start"
		;;
	stop)
		eid=$(bash $0 active $2)
		curl -v -u $2:api_token -H "Content-type: application/json" -X PUT "https://www.toggl.com/api/v8/time_entries/$eid/stop"
		;;
	active)
		bash $0 list $2 | tail -n 1
		;;
	list)
		curl -v -u $2:api_token -H "Content-type: application/json" -X GET "https://www.toggl.com/api/v8/time_entries" | grep -P "\"id\":[0-9]*" -o | cut -c 6-
		;;
	*)
esac
