#!/bin/bash

if [ -z "$1" ]
  then
    echo "Usage: run_ui_tests.sh gradlew_path"
    exit 1
fi

$1/gradlew clean assembleDebug connectedAndroidTest