#!/bin/bash

if [ -z "$1" ]
  then
    echo "Usage: kill_android_avds.sh android_sdk_path"
    exit 1
fi

# Kill all avds
DEVICE_LIST=$($1/platform-tools/adb devices | sed "1 d" | tail -r | sed "1 d")
for DEVICE_NAME in $DEVICE_LIST
do
	$1/platform-tools/adb -s $DEVICE_NAME emu kill &
done