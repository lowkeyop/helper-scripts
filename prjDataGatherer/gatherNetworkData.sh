#!/bin/bash
while true  #infinite loop
do
	MINUTES=$(date +%M)
	if [ $MINUTES == '00' ]; then
		timeStamp="$(date +'%m-%d-%Y' )"
		filePath="/share/data/networkData/speedtest$timeStamp"
		speedtest-cli --json --share >> $filePath
		sleep 2600 #wait for an hr then do it again.
	else
		sleep 11
	fi
done

