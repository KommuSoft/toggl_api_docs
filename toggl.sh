#!/bin/sh

case $1 in
	start)
		curl -v -u $2:api_token -H "Content-type: application/json" -d "{\"time_entry\":{\"description\":\"$3\"}}" -X POST "https://www.toggl.com/api/v8/time_entries/start"
		;;
	stop)
		curl -v -u 1971800d4d82861d8f2c1651fea4d212:api_token -H "Content-type: application/json" -X PUT "https://www.toggl.com/api/v8/time_entries/436694100/stop"
		;;
	*)
esac
