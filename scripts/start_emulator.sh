#!/bin/bash


if [ -z "$2" ]
  then
    echo "Usage: start_emulator name android_sdk_path"
    exit 1
fi

# Create AVD
AVD_NAME=$1
ANDROID_HOME=$2
SIM_ARCH="x86_64"
echo "searching for latest $SIM_ARCH images..."
AVD_IMAGE=$($ANDROID_HOME/tools/bin/sdkmanager --list --verbose | grep system-images | grep $SIM_ARCH | grep google_apis\; | tail -1 | tr -d "\n\r")
echo "Installing simulator image: $AVD_IMAGE"
$ANDROID_HOME/tools/bin/sdkmanager "$AVD_IMAGE"
echo "Installing NDK Bundle..."
$ANDROID_HOME/tools/bin/sdkmanager "ndk-bundle"
echo "Updating Android SDK"
$ANDROID_HOME/tools/bin/sdkmanager --update
echo "Creating simulator..."
echo no | $ANDROID_HOME/tools/bin/avdmanager create avd --name $AVD_NAME -k "$AVD_IMAGE" --force
echo "Starting emulator..."
$ANDROID_HOME/tools/emulator -avd $1 &
