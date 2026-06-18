# Kinetic Digital - Screenshot Capture Guide

## Overview

This guide provides detailed instructions for capturing the required screenshots for the Connect IQ Store submission.

## Screenshot Requirements

- **Minimum**: 5 screenshots
- **Recommended**: 5-8 screenshots
- **Format**: PNG (preferred) or JPG
- **Quality**: High resolution, actual device resolution
- **Content**: Show variety of features and customization options

## Device Selection

### Primary Device for Screenshots
**Recommended**: Venu 4 45mm (`venu445mm`) or Fenix 8 47mm (`fenix847mm`)

**Reasons**:
- 454 x 454 resolution (standard for many devices)
- Popular consumer devices
- Good representation of watch face appearance
- AMOLED display shows colors well (Venu 4)

### Alternative Devices
- Venu 4 41mm (for smaller screen demonstration)
- Forerunner 970 (for runner audience)
- Fenix E (for outdoor/adventure audience)

## Screenshot Capture Methods

### Method 1: Simulator Screenshot
1. Launch Connect IQ simulator
2. Load watch face on target device
3. Configure desired settings
4. Use simulator's screenshot function
5. Save to designated folder

### Method 2: Real Device Screenshot
1. Install watch face on physical device
2. Configure settings via Garmin Connect
3. Use device screenshot function (if available)
4. Transfer screenshot to computer

### Method 3: Screen Recording + Frame Extraction
1. Record simulator or device screen
2. Extract frames at desired moments
3. Crop and optimize images

## Required Screenshots

### Screenshot 1: Default Free Mode (PRIMARY)

**Purpose**: Show the default experience for free users

**Settings**:
- Unlock Code: (empty - locked state)
- Accent Color: Gilt (0xC9A45D) - default
- Ring Mode: Battery (default)
- Pro Stat: Locked (shows "-- / PRO")

**Display Values**:
- Time: 10:09 or 2:30 (aesthetically pleasing)
- Date: Current date or "MON  JUN 18"
- Battery: 70-85% (healthy level)
- Active Minutes: 25m or 30m
- Steps: 7.5K or 8.2K
- Battery Ring: Matching battery percentage

**Filename**: `01-default-free-mode.png`

**Description for Store**: "Default view with gilt accent, battery ring, and core stats"

---

### Screenshot 2: Pro Mode - Teal Accent

**Purpose**: Show Pro unlock with alternate accent color

**Settings**:
- Unlock Code: KINETIC-2026 (unlocked)
- Accent Color: Teal (0x2DD4BF)
- Ring Mode: Steps Goal
- Pro Stat: Steps (option 1)

**Display Values**:
- Time: 14:30 or 3:45 (different from Screenshot 1)
- Date: Different day of week
- Battery: 65-75%
- Active Minutes: 35m or 42m
- Steps: 12.3K (shows K formatting)
- Pro Stat: 12.3K (matching steps)
- Steps Ring: 85-95% progress

**Filename**: `02-pro-teal-steps.png`

**Description for Store**: "Pro unlock with teal accent and steps ring mode"

---

### Screenshot 3: Pro Mode - Ruby Accent

**Purpose**: Show different accent and stat combination

**Settings**:
- Unlock Code: PRO-2026 (unlocked)
- Accent Color: Ruby (0xF43F5E)
- Ring Mode: Active Minutes
- Pro Stat: Calories (option 3)

**Display Values**:
- Time: 18:45 or 6:15
- Date: Different day
- Battery: 55-65%
- Active Minutes: 48m (high activity)
- Steps: 15.7K
- Pro Stat: 2.1K (calories)
- Active Minutes Ring: 80% progress (48/60)

**Filename**: `03-pro-ruby-calories.png`

**Description for Store**: "Ruby accent with active minutes ring and calories stat"

---

### Screenshot 4: Military Time Format

**Purpose**: Show 24-hour time format option

**Settings**:
- Unlock Code: MJVDIGITAL (unlocked)
- Accent Color: Blue (0x60A5FA)
- Ring Mode: Day Progress
- Pro Stat: Seconds (option 0)
- Military Format: true

**Display Values**:
- Time: 21:30 or 16:45 (clearly 24-hour)
- Date: Different day
- Battery: 80-90%
- Active Minutes: 18m
- Steps: 5.8K
- Pro Stat: 45 (seconds)
- Day Progress Ring: Matching time of day

**Filename**: `04-military-time-blue.png`

**Description for Store**: "24-hour military time format with blue accent"

---

### Screenshot 5: Settings Screen

**Purpose**: Show customization options available

**Method**: Capture from Garmin Connect app on phone/computer

**Content to Show**:
- Unlock Code field (with placeholder or demo code)
- Unlock Email field
- Accent Color dropdown (showing all 4 options)
- Pro Stat dropdown (showing all 6 options)
- Ring Mode dropdown (showing all 4 options)
- Military Format toggle

**Filename**: `05-settings-screen.png`

**Description for Store**: "Garmin Connect settings showing customization options"

**Note**: This may need to be captured from actual Garmin Connect app

---

## Optional Screenshots (6-8)

### Screenshot 6: Smaller Device

**Purpose**: Show responsive design on different screen size

**Device**: Venu 4 41mm (416 x 416 resolution)

**Settings**:
- Any Pro configuration
- Different accent than previous screenshots

**Filename**: `06-small-device.png`

**Description**: "Responsive design on smaller device"

---

### Screenshot 7: Low Battery State

**Purpose**: Show battery awareness

**Settings**:
- Any configuration
- Battery Ring mode

**Display Values**:
- Battery: 15-20% (low but not critical)
- Battery Ring: Matching low percentage
- All other stats normal

**Filename**: `07-low-battery.png`

**Description**: "Battery awareness with low battery display"

---

### Screenshot 8: High Activity Day

**Purpose**: Show watch face with impressive activity stats

**Settings**:
- Steps Ring mode
- Steps Pro stat

**Display Values**:
- Steps: 18.5K or 22.3K (high count)
- Active Minutes: 65m (over goal)
- Steps Ring: 100%+ (over goal)
- Calories: 3.2K+

**Filename**: `08-high-activity.png`

**Description**: "Active day with high step count and minutes"

---

## Screenshot Checklist

### Before Capturing

- [ ] Simulator/device is set to correct resolution
- [ ] Watch face is installed and running
- [ ] Settings are configured as specified
- [ ] Time/date are set to desired values
- [ ] Activity data is set to desired values
- [ ] Battery level is set appropriately

### During Capture

- [ ] Screenshot is clear and in focus
- [ ] No simulator UI elements visible (if using simulator)
- [ ] Colors are accurate and vibrant
- [ ] Text is readable
- [ ] All elements are properly aligned
- [ ] No artifacts or compression issues

### After Capture

- [ ] Image is saved at full resolution
- [ ] Filename follows naming convention
- [ ] Image is optimized for file size (if needed)
- [ ] Image is backed up
- [ ] Description is documented

## Screenshot Organization

### Folder Structure

```
screenshots/
├── store-submission/
│   ├── 01-default-free-mode.png
│   ├── 02-pro-teal-steps.png
│   ├── 03-pro-ruby-calories.png
│   ├── 04-military-time-blue.png
│   ├── 05-settings-screen.png
│   ├── 06-small-device.png (optional)
│   ├── 07-low-battery.png (optional)
│   └── 08-high-activity.png (optional)
├── device-specific/
│   ├── venu445mm/
│   ├── fenix847mm/
│   └── fr970/
└── testing/
    └── (test screenshots)
```

## Image Optimization

### File Size Guidelines
- Target: 200-500 KB per screenshot
- Maximum: 1 MB per screenshot
- Format: PNG for best quality, JPG if size is concern

### Optimization Tools
- ImageOptim (Mac)
- TinyPNG (web)
- Photoshop "Save for Web"
- GIMP export options

### Optimization Settings
- PNG: 24-bit color, no transparency needed
- JPG: 90-95% quality if using JPEG
- No need to resize - keep native resolution

## Quality Checklist

### Visual Quality
- [ ] Colors are vibrant and accurate
- [ ] Text is sharp and readable
- [ ] No pixelation or blur
- [ ] Proper contrast and brightness
- [ ] No compression artifacts

### Content Quality
- [ ] Shows key features clearly
- [ ] Demonstrates variety of options
- [ ] Realistic but impressive data values
- [ ] Professional appearance
- [ ] Consistent styling across screenshots

### Technical Quality
- [ ] Correct resolution for device
- [ ] Proper aspect ratio
- [ ] Appropriate file format
- [ ] Reasonable file size
- [ ] No metadata issues

## Simulator Tips

### Setting Activity Data
1. Open simulator
2. Go to "Simulation" menu
3. Select "Activity Tracking"
4. Set desired values:
   - Steps
   - Active Minutes
   - Calories
   - Floors
   - Step Goal

### Setting Battery Level
1. In simulator menu
2. Select "Battery"
3. Set desired percentage

### Setting Time/Date
1. In simulator menu
2. Select "Time"
3. Set desired time and date

### Taking Screenshot
1. Simulator menu → "Screenshot"
2. Or use system screenshot (Cmd+Shift+4 on Mac)
3. Crop to watch face only

## Real Device Tips

### Installing for Screenshots
1. Build for specific device
2. Transfer .prg to device via Garmin Express
3. Configure settings via Garmin Connect
4. Wait for settings to sync

### Capturing from Device
- Some devices support screenshots natively
- Otherwise, photograph the device screen
- Ensure good lighting and focus
- Crop and clean up in photo editor

## Post-Processing

### Minimal Editing
- Crop to exact watch face boundaries
- Adjust brightness/contrast if needed
- Remove any simulator artifacts
- Ensure colors match actual appearance

### What NOT to Do
- Don't add text overlays
- Don't add arrows or annotations
- Don't alter the watch face design
- Don't use filters or effects
- Don't resize to different aspect ratio

## Final Validation

### Before Submission
- [ ] All 5 required screenshots captured
- [ ] Screenshots show variety of features
- [ ] Images are high quality
- [ ] File sizes are appropriate
- [ ] Filenames are descriptive
- [ ] Screenshots are organized
- [ ] Backup copies exist
- [ ] Ready to upload to Connect IQ Store

## Upload to Connect IQ Store

### Upload Process
1. Log into Connect IQ Developer Portal
2. Navigate to app submission
3. Upload screenshots in order
4. Add descriptions for each
5. Preview how they appear in store
6. Verify order and appearance
7. Save and continue

### Screenshot Order
1. Primary screenshot (default free mode)
2. Pro features (teal accent)
3. Pro features (ruby accent)
4. Military time (blue accent)
5. Settings screen
6-8. Optional additional screenshots

---

**Document Version**: 1.0
**Last Updated**: 2026-06-18
**Status**: Ready for Use
