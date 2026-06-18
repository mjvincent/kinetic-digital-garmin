# Kinetic Digital - Testing Instructions

## Simulator Testing Guide

### Step 1: Load Watch Face in Simulator

The Connect IQ Simulator should now be open. To load the watch face:

1. In the simulator, click **"File"** → **"Open"** (or press Cmd+O)
2. Navigate to: `/Users/michaelvincentjones/GarminProjects/KineticDigital/bin/`
3. Select one of these .prg files to test:
   - **KineticDigital-venu445mm.prg** (Venu 4 45mm - AMOLED)
   - **KineticDigital-fenix847mm.prg** (Fenix 8 47mm - MIP)
   - **KineticDigital-fr970.prg** (Forerunner 970 - AMOLED)

### Step 2: Test Free Mode Features

Once loaded, verify these features work:

- ✅ Large digital time display shows current time
- ✅ Date header shows day/month (e.g., "MON  JUN 18")
- ✅ Battery ring shows around the edge (gilt/gold color)
- ✅ BAT stat shows battery percentage
- ✅ ACT stat shows active minutes
- ✅ PRO stat shows "-- / PRO" (locked)
- ✅ Steps display at bottom shows step count

### Step 3: Test Unlock Codes

To unlock Pro features:

1. In simulator, click **"Settings"** icon (gear icon)
2. Find **"Unlock Code"** field
3. Enter one of these demo codes:
   - `KINETIC-2026`
   - `PRO-2026`
   - `MJVDIGITAL`
4. Click **"Save"** or **"Apply"**
5. Watch face should reload with Pro features unlocked

### Step 4: Test Pro Features

After unlocking, test these Pro features:

**Accent Colors** (Settings → Accent Color):
- ✅ Gilt (default gold)
- ✅ Teal (cyan/turquoise)
- ✅ Blue (light blue)
- ✅ Ruby (red/pink)

**Pro Stat Options** (Settings → Pro Stat):
- ✅ Seconds (shows :SS)
- ✅ Steps (shows step count)
- ✅ Active Minutes (shows XXm)
- ✅ Calories (shows calorie count)
- ✅ Floors (shows floors climbed)
- ✅ Battery (shows battery %)

**Ring Modes** (Settings → Ring Mode):
- ✅ Battery (shows battery level)
- ✅ Steps Goal (shows progress to step goal)
- ✅ Active Minutes (shows progress to 60 min goal)
- ✅ Day Progress (shows time progress through day)

**Military Format** (Settings → Military Format):
- ✅ Toggle ON: Shows 24-hour time (00:00-23:59)
- ✅ Toggle OFF: Shows 12-hour time (12:00 AM/PM)

### Step 5: Capture Screenshots

Once testing is complete, capture screenshots for store submission:

**Screenshot 1: Default Free Mode**
- Settings: Free mode (no unlock), Battery ring, Gilt accent
- Time: Around 10:09 or similar
- Save as: `screenshots/store-submission/01-default-free-mode.png`

**Screenshot 2: Pro Mode - Teal**
- Settings: Unlocked, Teal accent, Steps ring, Steps Pro stat
- Time: Around 10:09
- Save as: `screenshots/store-submission/02-pro-teal-steps.png`

**Screenshot 3: Pro Mode - Ruby**
- Settings: Unlocked, Ruby accent, Active Minutes ring, Calories Pro stat
- Time: Around 10:09
- Save as: `screenshots/store-submission/03-pro-ruby-active.png`

**Screenshot 4: Pro Mode - Blue Military**
- Settings: Unlocked, Blue accent, Day Progress ring, Military time ON
- Time: Around 22:09 (10:09 PM in 24-hour)
- Save as: `screenshots/store-submission/04-pro-blue-military.png`

**Screenshot 5: Settings Screen**
- Open Garmin Connect Mobile app simulator view
- Show settings screen with all Pro options visible
- Save as: `screenshots/store-submission/05-settings-screen.png`

### Step 6: Test Edge Cases

Test these scenarios to ensure robustness:

- ✅ Midnight (00:00 or 12:00 AM)
- ✅ Noon (12:00 or 12:00 PM)
- ✅ Low battery (< 20%)
- ✅ High step count (> 10,000)
- ✅ No step goal set
- ✅ Date rollover at midnight

### Step 7: Multi-Device Testing

Repeat testing on at least 3 different devices:
1. Venu 4 45mm (AMOLED, round)
2. Fenix 8 47mm (MIP, round)
3. Forerunner 970 (AMOLED, round)

Verify:
- ✅ Layout scales properly
- ✅ Text is readable
- ✅ Colors display correctly
- ✅ All features work on each device

## Simulator Controls

- **Settings**: Click gear icon to access watch face settings
- **Activity Data**: Click activity icon to simulate steps, calories, etc.
- **Time**: Click clock icon to change time
- **Battery**: Click battery icon to change battery level
- **Screenshot**: File → Save Screenshot (or Cmd+Shift+S)

## Common Issues

**Issue**: Watch face doesn't load
- **Solution**: Make sure you selected a .prg file, not a .prg.debug.xml file

**Issue**: Settings don't save
- **Solution**: Click "Save" or "Apply" button in settings dialog

**Issue**: Unlock code doesn't work
- **Solution**: Make sure you entered the code exactly (case-insensitive, spaces/hyphens ignored)

**Issue**: Pro features don't show
- **Solution**: Verify unlock code was entered correctly and settings were saved

## Next Steps After Testing

Once testing is complete:

1. ✅ All features verified working
2. ✅ Screenshots captured (5 required)
3. ✅ Tested on 3+ devices
4. → Review STORE_LISTING.md and customize
5. → Prepare support email/website
6. → Submit to Connect IQ Store

## Demo Unlock Codes

For testing and demo purposes:
- `KINETIC-2026`
- `PRO-2026`
- `MJVDIGITAL`

For email-based codes, the format is: `KD-XXXX-XXXX`

---

**Good luck with testing!** 🚀
