#!/bin/sh

case $1 in
	start)
		curl -v -u $2:api_token -H "Content-type: application/json" -d "{\"time_entry\":{\"description\":\"$3\"}}" -X POST "https://www.toggl.com/api/v8/time_entries/start"
		;;
	stop)
		curl -v -u $2:api_token -H "Content-type: application/json" -X PUT "https://www.toggl.com/api/v8/time_entries/436694100/stop"
		;;
	*)
esac
