#!/bin/bash

# Screenshot Capture Script for Kinetic Digital
# Automates the process of capturing store submission screenshots

SDK_PATH="/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b"
PROJECT_DIR="/Users/michaelvincentjones/GarminProjects/KineticDigital"
SCREENSHOT_DIR="$PROJECT_DIR/screenshots/store-submission"

# Create screenshot directory
mkdir -p "$SCREENSHOT_DIR"

echo "=========================================="
echo "Kinetic Digital - Screenshot Capture"
echo "=========================================="
echo ""
echo "This script will help you capture the 5 required screenshots."
echo "You'll need to manually configure settings and take screenshots."
echo ""
echo "Screenshots will be saved to:"
echo "$SCREENSHOT_DIR"
echo ""

# Device to use for screenshots
DEVICE="venu445mm"
PRG_FILE="$PROJECT_DIR/bin/KineticDigital-$DEVICE.prg"

if [ ! -f "$PRG_FILE" ]; then
    echo "Error: Build file not found: $PRG_FILE"
    echo "Please run ./build-all.sh first"
    exit 1
fi

echo "Using device: $DEVICE (454x454 resolution)"
echo ""
echo "=========================================="
echo "Screenshot Instructions"
echo "=========================================="
echo ""
echo "For each screenshot:"
echo "1. Configure settings as specified below"
echo "2. Wait for watch face to update"
echo "3. Use simulator's screenshot feature or Cmd+Shift+4"
echo "4. Save to the screenshots directory with the correct filename"
echo ""
echo "Press Enter to launch simulator..."
read

# Launch simulator
echo "Launching simulator..."
"$SDK_PATH/bin/monkeydo" "$PRG_FILE" "$DEVICE" &
SIMULATOR_PID=$!

echo ""
echo "Simulator launched (PID: $SIMULATOR_PID)"
echo ""
echo "=========================================="
echo "Screenshot 1: Default Free Mode"
echo "=========================================="
echo "Settings:"
echo "  - Unlock Code: (empty/locked)"
echo "  - Accent Color: Gilt (default)"
echo "  - Ring Mode: Battery"
echo "  - Pro Stat: Locked (shows '-- / PRO')"
echo ""
echo "Filename: 01-default-free-mode.png"
echo ""
echo "Press Enter when screenshot 1 is captured..."
read

echo ""
echo "=========================================="
echo "Screenshot 2: Pro Mode - Teal Accent"
echo "=========================================="
echo "Settings to change:"
echo "  - Unlock Code: KINETIC-2026"
echo "  - Accent Color: Teal"
echo "  - Ring Mode: Steps Goal"
echo "  - Pro Stat: Steps"
echo ""
echo "Filename: 02-pro-teal-steps.png"
echo ""
echo "Press Enter when screenshot 2 is captured..."
read

echo ""
echo "=========================================="
echo "Screenshot 3: Pro Mode - Ruby Accent"
echo "=========================================="
echo "Settings to change:"
echo "  - Accent Color: Ruby"
echo "  - Ring Mode: Active Minutes"
echo "  - Pro Stat: Calories"
echo ""
echo "Filename: 03-pro-ruby-calories.png"
echo ""
echo "Press Enter when screenshot 3 is captured..."
read

echo ""
echo "=========================================="
echo "Screenshot 4: Military Time - Blue Accent"
echo "=========================================="
echo "Settings to change:"
echo "  - Accent Color: Blue"
echo "  - Ring Mode: Day Progress"
echo "  - Pro Stat: Seconds"
echo "  - Military Format: true"
echo ""
echo "Filename: 04-military-time-blue.png"
echo ""
echo "Press Enter when screenshot 4 is captured..."
read

echo ""
echo "=========================================="
echo "Screenshot 5: Settings Screen"
echo "=========================================="
echo "This screenshot should show the Garmin Connect settings page."
echo ""
echo "Options:"
echo "1. Screenshot from Garmin Connect mobile app"
echo "2. Screenshot from Garmin Express desktop app"
echo "3. Create a mockup showing the settings interface"
echo ""
echo "Filename: 05-settings-screen.png"
echo ""
echo "Press Enter when screenshot 5 is captured..."
read

echo ""
echo "=========================================="
echo "Screenshot Capture Complete!"
echo "=========================================="
echo ""
echo "Please verify all screenshots are saved in:"
echo "$SCREENSHOT_DIR"
echo ""
echo "Required files:"
echo "  - 01-default-free-mode.png"
echo "  - 02-pro-teal-steps.png"
echo "  - 03-pro-ruby-calories.png"
echo "  - 04-military-time-blue.png"
echo "  - 05-settings-screen.png"
echo ""
echo "Next steps:"
echo "1. Review screenshot quality and content"
echo "2. Optimize file sizes if needed (target: 200-500 KB)"
echo "3. Proceed with store submission"
echo ""

# Kill simulator if still running
if ps -p $SIMULATOR_PID > /dev/null 2>&1; then
    echo "Closing simulator..."
    kill $SIMULATOR_PID 2>/dev/null
fi

echo "Done!"

# Made with Bob
