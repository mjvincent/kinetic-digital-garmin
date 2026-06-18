# Kinetic Digital - Build & Testing Guide

## Build Environment Setup

### Prerequisites

1. **Garmin Connect IQ SDK**
   - Location: `/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b/`
   - Verify installation: Check that `bin/monkeyc` exists

2. **Developer Key**
   - Location: `/Users/michaelvincentjones/Documents/Garmin/Developer Key/developer_key`
   - Required for signing builds

3. **Project Files**
   - manifest.xml
   - monkey.jungle
   - source/*.mc files
   - resources/**

## Build Commands

### Single Device Build

```bash
"/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b/bin/monkeyc" \
  -f monkey.jungle \
  -o bin/KineticDigital-{DEVICE_ID}.prg \
  -y "/Users/michaelvincentjones/Documents/Garmin/Developer Key/developer_key" \
  -d {DEVICE_ID}
```

Replace `{DEVICE_ID}` with one of the supported devices.

### Supported Device IDs

Build for all 19 supported devices:

1. `d2mach2pro` - D2 Mach 2 Pro
2. `enduro3` - Enduro 3
3. `fenix843mm` - Fenix 8 43mm
4. `fenix847mm` - Fenix 8 47mm
5. `fenix8pro47mm` - Fenix 8 Pro 47mm
6. `fenix8solar47mm` - Fenix 8 Solar 47mm
7. `fenix8solar51mm` - Fenix 8 Solar 51mm
8. `fenixe` - Fenix E
9. `fr57042mm` - Forerunner 570 42mm
10. `fr57047mm` - Forerunner 570 47mm
11. `fr970` - Forerunner 970
12. `venu441mm` - Venu 4 41mm
13. `venu445mm` - Venu 4 45mm
14. `venux1` - Venu X1
15. `vivoactive6` - Vivoactive 6

### Build All Devices Script

Create a shell script to build for all devices:

```bash
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
    echo "All builds completed successfully!"
    exit 0
else
    echo "Some builds failed. Check output above for details."
    exit 1
fi
```

Save as `build-all.sh` and make executable:
```bash
chmod +x build-all.sh
./build-all.sh
```

## Testing Guide

### Simulator Testing

#### Launch Simulator

```bash
"/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b/bin/connectiq"
```

Or use the Connect IQ extension in VS Code.

#### Test Priority Devices

Focus testing on these representative devices:

1. **Venu 4 45mm** (`venu445mm`)
   - Round AMOLED display
   - 454 x 454 resolution
   - Popular consumer device

2. **Fenix 8 47mm** (`fenix847mm`)
   - Round MIP display
   - 454 x 454 resolution
   - Popular fitness device

3. **Forerunner 970** (`fr970`)
   - Round AMOLED display
   - 454 x 454 resolution
   - Running-focused device

### Testing Checklist

#### Visual Testing

- [ ] Time displays correctly (12/24 hour)
- [ ] Date header shows correct format
- [ ] Battery ring renders smoothly
- [ ] Tick marks are visible and aligned
- [ ] Stats display in correct positions
- [ ] Text is readable and properly sized
- [ ] Colors match specifications
- [ ] Layout scales properly on different screen sizes

#### Functional Testing

##### Unlock System
- [ ] Demo code `KINETIC-2026` unlocks Pro features
- [ ] Demo code `PRO-2026` unlocks Pro features
- [ ] Demo code `MJVDIGITAL` unlocks Pro features
- [ ] Invalid codes don't unlock
- [ ] Email-based unlock code generation works
- [ ] Normalized codes work (spaces/hyphens removed)

##### Settings
- [ ] Unlock Code setting accepts input
- [ ] Unlock Email setting accepts email format
- [ ] Accent Color changes apply immediately
- [ ] Pro Stat selection works (all 6 options)
- [ ] Ring Mode selection works (all 4 options)
- [ ] Military Format toggle works

##### Stats Display
- [ ] Battery percentage displays correctly
- [ ] Active minutes calculate correctly (moderate + vigorous)
- [ ] Steps display with K formatting (e.g., 10.5K)
- [ ] Calories display correctly
- [ ] Floors climbed display correctly
- [ ] Seconds display updates every second

##### Ring Modes
- [ ] Battery ring shows correct percentage
- [ ] Steps ring shows progress toward goal
- [ ] Active minutes ring shows progress (max 60 minutes)
- [ ] Day progress ring shows time of day progress

##### Edge Cases
- [ ] Zero battery displays correctly
- [ ] No step goal set (steps ring)
- [ ] No activity data available
- [ ] Very high step counts (>100K)
- [ ] Midnight date rollover
- [ ] 12:00 AM/PM display
- [ ] 00:00 in 24-hour format

#### Performance Testing

- [ ] Watch face loads quickly
- [ ] No visible lag when updating
- [ ] Memory usage is reasonable
- [ ] Battery impact is minimal
- [ ] No crashes or exceptions
- [ ] Smooth animation (if any)

### Test Scenarios

#### Scenario 1: Free User Experience
1. Install watch face
2. Don't enter unlock code
3. Verify:
   - Gilt accent color only
   - Battery ring mode only
   - Pro stat shows "-- / PRO"
   - Settings show locked options

#### Scenario 2: Demo Code Unlock
1. Open settings
2. Enter `KINETIC-2026`
3. Verify:
   - All accent colors available
   - All Pro stat options available
   - All ring modes available
   - Pro stat displays selected value

#### Scenario 3: Email Unlock
1. Open settings
2. Enter email: `test@example.com`
3. Calculate expected code: `KD-XXXX-XXXX`
4. Enter calculated code
5. Verify unlock works

#### Scenario 4: Settings Changes
1. Change accent color to Teal
2. Verify color updates
3. Change Pro stat to Steps
4. Verify stat displays steps
5. Change ring mode to Day Progress
6. Verify ring shows time progress

#### Scenario 5: Time Format
1. Test 12-hour format (AM/PM)
2. Test 24-hour format
3. Enable Military Format setting
4. Verify 24-hour display with colon

#### Scenario 6: Activity Tracking
1. Simulate step count increase
2. Verify steps display updates
3. Simulate active minutes
4. Verify active minutes update
5. Check ring progress updates

## Validation Checklist

### Code Quality
- [ ] No compiler warnings
- [ ] No deprecated API usage
- [ ] Proper error handling
- [ ] Memory management is efficient
- [ ] Code follows Monkey C best practices

### Manifest Validation
- [ ] App ID is unique
- [ ] All device IDs are valid
- [ ] Min API level is appropriate
- [ ] App name matches strings.xml
- [ ] Launcher icon is defined

### Resource Validation
- [ ] All strings are defined
- [ ] All properties have defaults
- [ ] Settings XML is valid
- [ ] Drawables are present
- [ ] No missing resources

### Build Validation
- [ ] All 15 device builds succeed
- [ ] .prg files are generated
- [ ] File sizes are reasonable
- [ ] No build errors or warnings

## Troubleshooting

### Build Fails

**Problem**: Compiler errors
- Check syntax in .mc files
- Verify all imports are correct
- Check for typos in function names

**Problem**: Missing resources
- Verify all @Strings references exist
- Check @Drawables references
- Validate XML files

**Problem**: Device not supported
- Check device ID spelling
- Verify device is in manifest.xml
- Update SDK if device is new

### Simulator Issues

**Problem**: Watch face doesn't load
- Rebuild the project
- Clear simulator cache
- Check for runtime errors

**Problem**: Settings don't appear
- Verify settings.xml is valid
- Check properties.xml matches
- Restart simulator

**Problem**: Stats show "--"
- Simulator may not have activity data
- Use "Trigger Activity" in simulator
- Check ActivityMonitor API calls

### Runtime Issues

**Problem**: Unlock code doesn't work
- Verify code normalization logic
- Check email hash calculation
- Test with demo codes first

**Problem**: Settings don't persist
- Check property key names match
- Verify Application.Properties usage
- Test on real device vs simulator

## Pre-Submission Validation

### Final Checks

1. **Build All Devices**
   ```bash
   ./build-all.sh
   ```
   - Verify all 15 builds succeed
   - Check output directory for .prg files

2. **Test on Simulators**
   - Test at least 3 different devices
   - Run through all test scenarios
   - Verify no crashes or errors

3. **Code Review**
   - Review all source files
   - Check for TODO comments
   - Verify no debug code remains

4. **Resource Review**
   - Verify all strings are user-friendly
   - Check icon renders correctly
   - Validate all settings work

5. **Documentation Review**
   - Update README.md if needed
   - Verify STORE_LISTING.md is accurate
   - Check PRIVACY_POLICY.md is complete

## Build Output

After successful builds, you should have:

```
bin/
├── KineticDigital-d2mach2pro.prg
├── KineticDigital-enduro3.prg
├── KineticDigital-fenix843mm.prg
├── KineticDigital-fenix847mm.prg
├── KineticDigital-fenix8pro47mm.prg
├── KineticDigital-fenix8solar47mm.prg
├── KineticDigital-fenix8solar51mm.prg
├── KineticDigital-fenixe.prg
├── KineticDigital-fr57042mm.prg
├── KineticDigital-fr57047mm.prg
├── KineticDigital-fr970.prg
├── KineticDigital-venu441mm.prg
├── KineticDigital-venu445mm.prg
├── KineticDigital-venux1.prg
└── KineticDigital-vivoactive6.prg
```

Total: 15 .prg files ready for submission

---

**Document Version**: 1.0
**Last Updated**: 2026-06-18
**Status**: Ready for Use
