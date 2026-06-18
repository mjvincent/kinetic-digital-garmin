#!/bin/bash

# Build script for Kinetic Digital
# Builds .prg files for all supported devices

SDK_PATH="/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b"
DEV_KEY="/Users/michaelvincentjones/Documents/Garmin/Developer Key/developer_key"
PROJECT_DIR="/Users/michaelvincentjones/GarminProjects/KineticDigital"
OUTPUT_DIR="$PROJECT_DIR/bin"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Array of device IDs
DEVICES=(
    "d2mach2pro"
    "enduro3"
    "fenix843mm"
    "fenix847mm"
    "fenix8pro47mm"
    "fenix8solar47mm"
    "fenix8solar51mm"
    "fenixe"
    "fr57042mm"
    "fr57047mm"
    "fr970"
    "venu441mm"
    "venu445mm"
    "venux1"
    "vivoactive6"
)

echo "Building Kinetic Digital for all devices..."
echo "============================================"

# Build counter
SUCCESS=0
FAILED=0

# Build for each device
for DEVICE in "${DEVICES[@]}"; do
    echo ""
    echo "Building for $DEVICE..."

    "$SDK_PATH/bin/monkeyc" \
        -f "$PROJECT_DIR/monkey.jungle" \
        -o "$OUTPUT_DIR/KineticDigital-$DEVICE.prg" \
        -y "$DEV_KEY" \
        -d "$DEVICE"

    if [ $? -eq 0 ]; then
        echo "✓ Success: $DEVICE"
        ((SUCCESS++))
    else
        echo "✗ Failed: $DEVICE"
        ((FAILED++))
    fi
done

echo ""
echo "============================================"
echo "Build Summary:"
echo "  Successful: $SUCCESS"
echo "  Failed: $FAILED"
echo "  Total: ${#DEVICES[@]}"
echo ""

if [ $FAILED -eq 0 ]; then
    echo "✓ All builds completed successfully!"
    echo ""
    echo "Output files in: $OUTPUT_DIR"
    ls -lh "$OUTPUT_DIR"/*.prg 2>/dev/null | awk '{print "  " $9 " (" $5 ")"}'
    exit 0
else
    echo "✗ Some builds failed. Check output above for details."
    exit 1
fi

# Made with Bob
