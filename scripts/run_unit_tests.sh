#!/bin/bash

if [ -z "$1" ]
  then
    echo "Usage: run_unit_tests.sh gradlew_path"
    exit 1
fi

$1/gradlew clean lint assembleDebug testDebugUnitTest testCoverageReport