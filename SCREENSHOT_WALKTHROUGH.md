# Screenshot Capture Walkthrough - Step by Step

## Prerequisites

Before starting, make sure you have:
- Connect IQ SDK installed
- Simulator application available
- Your watch face builds ready in `bin/` directory

---

## 🚀 STEP-BY-STEP SCREENSHOT GUIDE

### Initial Setup

1. **Open the Connect IQ Simulator**:
   - Option A: Launch from Applications folder
   - Option B: Use VS Code Connect IQ extension
   - Option C: Command line (see below)

2. **Load Your Watch Face**:
   - In simulator, go to File → Load Device
   - Select: **Venu 4 45mm** (venu445mm)
   - Then File → Load App
   - Navigate to: `bin/KineticDigital-venu445mm.prg`
   - Click Open

---

## 📸 SCREENSHOT 1: Default Free Mode

### Purpose
Show the default experience for free users - what they see when they first install.

### Settings Configuration
**Before capturing, configure these settings in the simulator:**

1. **Open Settings** (in simulator menu or Garmin Connect)
2. **Set these values**:
   - **Unlock Code**: Leave EMPTY (or clear any existing code)
   - **Unlock Email**: Leave EMPTY
   - **Accent Color**: Gilt (should be default)
   - **Ring Mode**: Battery (should be default)
   - **Pro Stat**: Will show "-- / PRO" (locked)
   - **Military Format**: false (12-hour time)

### What Should Be Visible
- **Time**: Large digital time (e.g., 10:09 or 2:30)
- **Date**: Day and date header (e.g., "MON  JUN 18")
- **Battery**: Percentage (e.g., 75%)
- **Active Minutes**: Value with "m" (e.g., 25m)
- **Steps**: Value with "K" if over 1000 (e.g., 7.5K)
- **Pro Stat**: Shows "-- / PRO" (locked indicator)
- **Ring**: Battery ring matching battery percentage
- **Accent Color**: Gilt/gold color (#C9A45D)

### Capture Instructions
1. Wait for watch face to fully render
2. Use macOS screenshot tool: **Cmd + Shift + 4**
3. Drag to select ONLY the watch face (circular area)
4. Release to capture
5. Screenshot saves to Desktop by default
6. **Rename to**: `01-default-free-mode.png`
7. **Move to**: `screenshots/store-submission/`

---

## 📸 SCREENSHOT 2: Pro Mode - Teal Accent

### Purpose
Show Pro features unlocked with a different accent color and ring mode.

### Settings Configuration

1. **Open Settings** in simulator
2. **Change these values**:
   - **Unlock Code**: `KINETIC-2026` (or `KINETIC2026` without hyphen)
   - **Accent Color**: Teal
   - **Ring Mode**: Steps Goal
   - **Pro Stat**: Steps (option 1)
   - **Military Format**: false

3. **Wait for settings to apply** (may need to close/reopen watch face)

### What Should Be Visible
- **Time**: Different time than Screenshot 1 (e.g., 14:30 or 3:45)
- **Date**: Different day if possible
- **Battery**: Different percentage (e.g., 68%)
- **Active Minutes**: Different value (e.g., 35m)
- **Steps**: Higher count (e.g., 12.3K)
- **Pro Stat**: Shows actual steps count (e.g., 12.3K) - NOT "-- / PRO"
- **Ring**: Steps progress ring (shows progress toward step goal)
- **Accent Color**: Teal/cyan color (#2DD4BF)

### Capture Instructions
1. Verify Pro stat shows actual steps (not locked)
2. Verify accent color is teal
3. Verify ring shows steps progress
4. **Cmd + Shift + 4** to capture
5. Select watch face area only
6. **Rename to**: `02-pro-teal-steps.png`
7. **Move to**: `screenshots/store-submission/`

---

## 📸 SCREENSHOT 3: Pro Mode - Ruby Accent

### Purpose
Show different accent color and stat combination.

### Settings Configuration

1. **Open Settings** in simulator
2. **Change these values**:
   - **Unlock Code**: Keep `KINETIC-2026` (already unlocked)
   - **Accent Color**: Ruby
   - **Ring Mode**: Active Minutes
   - **Pro Stat**: Calories (option 3)
   - **Military Format**: false

3. **Wait for settings to apply**

### What Should Be Visible
- **Time**: Different time (e.g., 18:45 or 6:15)
- **Date**: Different day if possible
- **Battery**: Different percentage (e.g., 58%)
- **Active Minutes**: Higher value (e.g., 48m)
- **Steps**: Different count (e.g., 15.7K)
- **Pro Stat**: Shows calories (e.g., 2.1K) - NOT steps
- **Ring**: Active minutes progress ring
- **Accent Color**: Ruby/red-pink color (#F43F5E)

### Capture Instructions
1. Verify Pro stat shows calories (not steps)
2. Verify accent color is ruby/red
3. Verify ring shows active minutes progress
4. **Cmd + Shift + 4** to capture
5. Select watch face area only
6. **Rename to**: `03-pro-ruby-calories.png`
7. **Move to**: `screenshots/store-submission/`

---

## 📸 SCREENSHOT 4: Military Time - Blue Accent

### Purpose
Show 24-hour time format option.

### Settings Configuration

1. **Open Settings** in simulator
2. **Change these values**:
   - **Unlock Code**: Keep `KINETIC-2026` (already unlocked)
   - **Accent Color**: Blue
   - **Ring Mode**: Day Progress
   - **Pro Stat**: Seconds (option 0)
   - **Military Format**: true ← IMPORTANT!

3. **Wait for settings to apply**

### What Should Be Visible
- **Time**: 24-hour format (e.g., 21:30 or 16:45) - NO AM/PM
- **Date**: Different day if possible
- **Battery**: Different percentage (e.g., 82%)
- **Active Minutes**: Different value (e.g., 18m)
- **Steps**: Different count (e.g., 5.8K)
- **Pro Stat**: Shows seconds (e.g., 45)
- **Ring**: Day progress ring (shows time of day progress)
- **Accent Color**: Blue color (#60A5FA)

### Capture Instructions
1. Verify time is in 24-hour format (no AM/PM)
2. Verify accent color is blue
3. Verify Pro stat shows seconds
4. Verify ring shows day progress
5. **Cmd + Shift + 4** to capture
6. Select watch face area only
7. **Rename to**: `04-military-time-blue.png`
8. **Move to**: `screenshots/store-submission/`

---

## 📸 SCREENSHOT 5: Settings Screen

### Purpose
Show users what customization options are available.

### This is Different!
This screenshot is NOT of the watch face - it's of the settings interface.

### Option A: Garmin Connect Mobile App (Best)

If you have a physical Garmin device:
1. Install watch face on your device
2. Open Garmin Connect app on phone
3. Go to: Device → Watch Faces → Kinetic Digital → Settings
4. Take screenshot of settings screen showing:
   - Unlock Code field
   - Unlock Email field
   - Accent Color dropdown
   - Pro Stat dropdown
   - Ring Mode dropdown
   - Military Format toggle
5. **Save as**: `05-settings-screen.png`

### Option B: Garmin Express Desktop (Alternative)

1. Connect device to computer
2. Open Garmin Express
3. Navigate to watch face settings
4. Capture settings screen
5. **Save as**: `05-settings-screen.png`

### Option C: Simulator Settings (If no device)

1. In simulator, access settings menu
2. Show the settings interface
3. Capture the settings view
4. **Save as**: `05-settings-screen.png`

### Option D: Create Mockup (Last Resort)

If you can't capture actual settings:
1. Create a simple mockup showing the settings fields
2. List all available options
3. Make it clear and professional
4. **Save as**: `05-settings-screen.png`

---

## 🎨 Screenshot Quality Checklist

For each screenshot, verify:
- [ ] Image is clear and sharp (no blur)
- [ ] Only watch face is visible (no simulator UI)
- [ ] Colors are accurate and vibrant
- [ ] Text is readable
- [ ] Correct filename
- [ ] Saved in `screenshots/store-submission/` directory
- [ ] File size is reasonable (200-500 KB ideal)

---

## 📁 Final File Organization

After capturing all screenshots, you should have:

```
screenshots/store-submission/
├── 01-default-free-mode.png     ✓ Gilt accent, locked
├── 02-pro-teal-steps.png        ✓ Teal accent, steps ring
├── 03-pro-ruby-calories.png     ✓ Ruby accent, calories
├── 04-military-time-blue.png    ✓ Blue accent, 24-hour
└── 05-settings-screen.png       ✓ Settings interface
```

---

## 🔧 Troubleshooting

### Settings Not Updating
- Close and reopen the watch face in simulator
- Or restart the simulator completely
- Settings should apply immediately

### Can't Find Screenshot
- Check your Desktop (default save location)
- Or check ~/Pictures/Screenshots/

### Simulator Won't Launch
- Try launching from Applications folder
- Or use VS Code Connect IQ extension
- Make sure SDK is properly installed

### Wrong Time Showing
- In simulator menu, go to Simulation → Time
- Set desired time for screenshot
- Watch face will update

### Wrong Activity Data
- In simulator menu, go to Simulation → Activity Tracking
- Set desired steps, active minutes, etc.
- Watch face will update

---

## 💡 Pro Tips

1. **Consistent Lighting**: Capture all screenshots in same lighting conditions
2. **Clean Edges**: Make sure to capture just the watch face circle
3. **Variety**: Show different times, dates, and data values
4. **Realistic Data**: Use believable activity numbers (not 0 or 999999)
5. **Save Originals**: Keep backup copies before any editing

---

## ⏱️ Time Estimate

- **Setup**: 5 minutes
- **Screenshot 1**: 5 minutes
- **Screenshot 2**: 5 minutes
- **Screenshot 3**: 5 minutes
- **Screenshot 4**: 5 minutes
- **Screenshot 5**: 10 minutes (may vary by method)

**Total**: 30-40 minutes

---

## ✅ Completion Checklist

After capturing all screenshots:
- [ ] All 5 screenshots captured
- [ ] All files properly named
- [ ] All files in correct directory
- [ ] Quality verified (clear, sharp, correct content)
- [ ] File sizes reasonable (under 1 MB each)
- [ ] Ready to upload to Garmin Store

---

## 🚀 Next Steps

Once screenshots are complete:
1. Review MANUAL_STEPS_GUIDE.md for remaining tasks
2. Host privacy policy online
3. Update contact information
4. Submit to Garmin Connect IQ Store!

---

**You've got this! Take your time and capture quality screenshots.** 📸
