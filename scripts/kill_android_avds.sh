#!/bin/bash

# Kill all avds
DEVICE_LIST=$(adb devices | sed "1 d" | tail -r | sed "1 d")
for DEVICE_NAME in $DEVICE_LIST
do
	adb -s $DEVICE_NAME emu kill &
done