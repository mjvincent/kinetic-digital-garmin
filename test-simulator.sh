#!/bin/bash

# Test script for Kinetic Digital
# Launches builds in the Connect IQ simulator

SDK_PATH="/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b"
PROJECT_DIR="/Users/michaelvincentjones/GarminProjects/KineticDigital"

# Recommended test devices
DEVICES=(
    "venu445mm:Venu 4 45mm (AMOLED)"
    "fenix847mm:Fenix 8 47mm (MIP)"
    "fr970:Forerunner 970 (AMOLED)"
)

echo "Kinetic Digital - Simulator Testing"
echo "===================================="
echo ""
echo "This script will help you test the watch face on recommended devices."
echo ""

# Check if simulator is available
if [ ! -f "$SDK_PATH/bin/monkeydo" ]; then
    echo "Error: Connect IQ SDK not found at expected location"
    echo "Please verify SDK installation"
    exit 1
fi

# Function to test a device
test_device() {
    local DEVICE_ID=$1
    local DEVICE_NAME=$2
    local PRG_FILE="$PROJECT_DIR/bin/KineticDigital-$DEVICE_ID.prg"

    echo "Testing: $DEVICE_NAME"
    echo "Device ID: $DEVICE_ID"
    echo "Build file: $PRG_FILE"
    echo ""

    if [ ! -f "$PRG_FILE" ]; then
        echo "Error: Build file not found: $PRG_FILE"
        echo "Run ./build-all.sh first"
        return 1
    fi

    echo "Launching simulator..."
    "$SDK_PATH/bin/monkeydo" "$PRG_FILE" "$DEVICE_ID"

    if [ $? -eq 0 ]; then
        echo "✓ Simulator launched successfully"
    else
        echo "✗ Failed to launch simulator"
        return 1
    fi

    echo ""
    echo "---"
    echo ""
}

# Main menu
while true; do
    echo "Select a device to test:"
    echo ""

    INDEX=1
    for DEVICE in "${DEVICES[@]}"; do
        DEVICE_NAME="${DEVICE#*:}"
        echo "  $INDEX) $DEVICE_NAME"
        ((INDEX++))
    done

    echo "  4) Test all recommended devices"
    echo "  5) Launch simulator GUI"
    echo "  0) Exit"
    echo ""
    read -p "Enter choice (0-5): " CHOICE
    echo ""

    case $CHOICE in
        1|2|3)
            DEVICE_INDEX=$((CHOICE - 1))
            DEVICE_INFO="${DEVICES[$DEVICE_INDEX]}"
            DEVICE_ID="${DEVICE_INFO%%:*}"
            DEVICE_NAME="${DEVICE_INFO#*:}"
            test_device "$DEVICE_ID" "$DEVICE_NAME"
            read -p "Press Enter to continue..."
            echo ""
            ;;
        4)
            echo "Testing all recommended devices..."
            echo ""
            for DEVICE in "${DEVICES[@]}"; do
                DEVICE_ID="${DEVICE%%:*}"
                DEVICE_NAME="${DEVICE#*:}"
                test_device "$DEVICE_ID" "$DEVICE_NAME"
                sleep 2
            done
            read -p "Press Enter to continue..."
            echo ""
            ;;
        5)
            echo "Launching Connect IQ Simulator GUI..."
            "$SDK_PATH/bin/connectiq" &
            echo "Simulator launched in background"
            echo ""
            read -p "Press Enter to continue..."
            echo ""
            ;;
        0)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            echo ""
            ;;
    esac
done

# Made with Bob
