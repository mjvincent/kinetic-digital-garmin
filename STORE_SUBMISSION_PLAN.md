# Kinetic Digital - Connect IQ Store Submission Plan

## Overview
This document outlines the complete preparation process for submitting Kinetic Digital to the Garmin Connect IQ Store.

## Current Project Status

### ✅ Completed Components
- Core watch face implementation with digital time display
- Date header with day/month formatting
- Battery, steps, and active minutes tracking
- Pro unlock system with demo codes and email-based codes
- Customizable accent colors (Gilt, Teal, Blue, Ruby)
- Selectable Pro stat display (Seconds, Steps, Active Minutes, Calories, Floors, Battery)
- Ring mode options (Battery, Steps Goal, Active Minutes, Day Progress)
- Military time format option
- Settings configuration via Garmin Connect/Express
- Support for 19 Garmin devices (Fenix, Forerunner, Venu, Enduro, etc.)

### 📋 Store Submission Requirements

## 1. Manifest & Technical Requirements

### Current Manifest Analysis
- **App ID**: `7ad912fe-5175-44b0-9e4a-e827d6f9d64b`
- **Type**: watchface
- **Min API Level**: 6.0.0
- **Supported Devices**: 19 devices across Fenix, Forerunner, Venu, and Enduro lines

### Required Validations
- [ ] Verify app ID is unique and registered
- [ ] Confirm minApiLevel compatibility with target devices
- [ ] Validate all device IDs are current and supported
- [ ] Test build process for all devices
- [ ] Ensure no deprecated API usage

## 2. Store Listing Content

### App Name
**Kinetic Digital**

### Short Description (50 characters max)
"Clean digital watch face with customizable stats"

### Long Description (4000 characters max)
```
Kinetic Digital is a clean Garmin watch face built around a large digital time display, a crisp date header, compact daily stats, and a progress ring that keeps key information visible at a glance.

FREE MODE FEATURES:
• Large digital time display with date header
• Battery progress ring
• Battery, active minutes, and steps tracking
• Gilt accent color
• 12/24-hour time format support

PRO UNLOCK FEATURES:
• Custom accent colors: Gilt, Teal, Blue, Ruby
• Selectable right stat: Seconds, Steps, Active Minutes, Calories, Floors, Battery
• Ring mode options: Battery, Steps Goal, Active Minutes, Day Progress
• Military format option (24-hour with colon separator)

UNLOCK OPTIONS:
• Demo codes: KINETIC-2026, PRO-2026, MJVDIGITAL
• Email-based unlock codes (generated as KD-XXXX-XXXX)

SETTINGS:
Configure through Garmin Connect, Garmin Express, or device settings:
• Unlock Code: Enter demo or customer unlock code
• Unlock Email: Optional email for generated unlock codes
• Accent Color: Choose your preferred accent (Pro only)
• Pro Stat: Select right-side stat display (Pro only)
• Ring Mode: Choose outer progress ring type (Pro only)
• Military Format: Force 24-hour time display

SUPPORTED DEVICES:
Compatible with Fenix 8, Fenix E, Forerunner 570, Forerunner 970, Venu 4, Venu X1, Vivoactive 6, Enduro 3, and D2 Mach 2 Pro.

SUPPORT:
For unlock assistance, include your unlock email and device model. Codes are normalized (spaces/hyphens removed). If settings don't update immediately, reopen the watch face or sync from Garmin Connect.
```

### What's New (500 characters max)
```
Initial release of Kinetic Digital featuring:
• Clean digital dashboard design
• Large time hierarchy with date header
• Customizable stats and progress ring
• Pro unlock with accent colors and stat options
• Support for 19 Garmin devices
```

### Keywords/Tags
- digital
- clean
- customizable
- stats
- battery
- steps
- active minutes
- dashboard
- modern
- minimal

## 3. Required Screenshots

### Screenshot Requirements
- **Minimum**: 5 screenshots
- **Recommended**: 5-8 screenshots
- **Format**: PNG or JPG
- **Dimensions**: Match actual device screen resolution
- **Content**: Show various features and states

### Recommended Screenshot Set

1. **Default Free Mode** (Primary Screenshot)
   - Default gilt accent color
   - Battery ring mode
   - All three stats visible (BAT, ACT, PRO locked)
   - Clear time and date display
   - Device: Venu 4 45mm or Fenix 8 47mm

2. **Pro Mode - Alternate Accent**
   - Teal or Blue accent color
   - Different ring mode (Steps or Active Minutes)
   - Pro stat unlocked showing custom value
   - Device: Same as screenshot 1

3. **Pro Mode - Different Stat**
   - Ruby accent color
   - Pro stat showing Calories or Floors
   - Day Progress ring mode
   - Device: Same as screenshot 1

4. **Military Time Format**
   - 24-hour time display (e.g., 14:30)
   - Different accent color
   - Shows format flexibility
   - Device: Same as screenshot 1

5. **Settings Screen**
   - Garmin Connect settings view
   - Shows all customization options
   - Unlock code field visible
   - Accent color picker visible

### Optional Additional Screenshots

6. **Different Device Form Factor**
   - Show on smaller device (Venu 4 41mm)
   - Demonstrates responsive scaling

7. **Night/Low Battery State**
   - Low battery percentage
   - Battery ring showing low level
   - Demonstrates battery awareness

8. **High Activity Day**
   - High step count (>10K)
   - Active minutes showing progress
   - Steps ring mode at high percentage

## 4. App Icon Requirements

### Icon Specifications
- **Launcher Icon**: Already defined in manifest as `@Drawables.LauncherIcon`
- **File**: `resources/drawables/launcher_icon.svg`
- **Format**: SVG (vector) or PNG (raster)
- **Sizes**: Garmin will generate required sizes from source
- **Design**: Should match watch face aesthetic

### Icon Checklist
- [ ] Verify launcher_icon.svg exists and renders correctly
- [ ] Test icon appearance on light and dark backgrounds
- [ ] Ensure icon is recognizable at small sizes
- [ ] Confirm icon follows Garmin design guidelines
- [ ] No text in icon (brand name should be in app name)

## 5. Privacy & Legal Requirements

### Privacy Policy
**Status**: Review needed

**Questions to Address**:
- Does the app collect any user data beyond device stats?
- Is the unlock email stored locally or transmitted?
- Are there any analytics or tracking?
- Is user data shared with third parties?

**Recommendation**: Create a simple privacy policy stating:
- Email addresses are used only for unlock code generation
- All data processing happens locally on device
- No data is transmitted to external servers
- No analytics or tracking implemented

### Terms of Service
- Define unlock code terms (demo vs. paid)
- Clarify Pro feature access
- Support and refund policy

## 6. Testing Checklist

### Functional Testing
- [ ] Test on all 19 supported devices (simulator)
- [ ] Verify unlock codes work correctly
- [ ] Test email-based unlock code generation
- [ ] Confirm all accent colors display properly
- [ ] Test all Pro stat options
- [ ] Verify all ring modes calculate correctly
- [ ] Test 12/24-hour time format switching
- [ ] Test military format option
- [ ] Verify settings sync from Garmin Connect
- [ ] Test low battery scenarios
- [ ] Verify step goal progress calculation
- [ ] Test active minutes tracking
- [ ] Confirm date header updates at midnight
- [ ] Test on devices with different screen sizes

### Performance Testing
- [ ] Monitor memory usage
- [ ] Check battery impact
- [ ] Verify smooth rendering (no lag)
- [ ] Test partial update performance (if implemented)
- [ ] Confirm no crashes or exceptions

### Edge Cases
- [ ] Test with 0% battery
- [ ] Test with no step goal set
- [ ] Test with no activity data
- [ ] Test invalid unlock codes
- [ ] Test very long email addresses
- [ ] Test special characters in unlock fields

## 7. Build Process

### Build Commands
```bash
# Build for specific device
"/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b/bin/monkeyc" \
  -f monkey.jungle \
  -o bin/KineticDigital-{device}.prg \
  -y "/Users/michaelvincentjones/Documents/Garmin/Developer Key/developer_key" \
  -d {device}
```

### Required Builds
Build .prg files for all supported devices:
- [ ] d2mach2pro
- [ ] enduro3
- [ ] fenix843mm
- [ ] fenix847mm
- [ ] fenix8pro47mm
- [ ] fenix8solar47mm
- [ ] fenix8solar51mm
- [ ] fenixe
- [ ] fr57042mm
- [ ] fr57047mm
- [ ] fr970
- [ ] venu441mm
- [ ] venu445mm
- [ ] venux1
- [ ] vivoactive6

### Build Validation
- [ ] All builds complete without errors
- [ ] No compiler warnings
- [ ] File sizes are reasonable
- [ ] Test at least 3 builds on simulator

## 8. Store Submission Checklist

### Pre-Submission
- [ ] All code is finalized and tested
- [ ] README.md is up to date
- [ ] Version number is set (consider adding to manifest)
- [ ] Changelog is prepared
- [ ] All builds are generated and tested
- [ ] Screenshots are captured and optimized
- [ ] Store listing text is finalized
- [ ] Privacy policy is created (if needed)
- [ ] Support contact information is ready

### Submission Materials
- [ ] App name: Kinetic Digital
- [ ] Short description (50 chars)
- [ ] Long description (4000 chars)
- [ ] What's new text (500 chars)
- [ ] Keywords/tags
- [ ] 5+ screenshots
- [ ] App icon verified
- [ ] Privacy policy URL (if applicable)
- [ ] Support email/website
- [ ] Category: Watch Faces
- [ ] Pricing: Free with Pro unlock

### Post-Submission
- [ ] Monitor submission status
- [ ] Respond to any Garmin review feedback
- [ ] Prepare for user support inquiries
- [ ] Plan for future updates

## 9. Support & Documentation

### Support Channels
- **Email**: [Your support email]
- **Website**: [Your website or GitHub]
- **Documentation**: README.md in repository

### Common Support Topics
1. How to unlock Pro features
2. Unlock code not working
3. Settings not updating
4. Device compatibility questions
5. Feature requests

### Support Response Templates
Create templates for:
- Unlock code assistance
- Settings troubleshooting
- Feature explanations
- Refund requests (if applicable)

## 10. Marketing & Launch

### Launch Strategy
- Announce on Garmin Connect IQ forums
- Share on social media (if applicable)
- Create demo video (optional)
- Prepare press kit (optional)

### Pricing Strategy
- Free tier with core features
- Pro unlock via codes
- Consider pricing for email-based codes
- Demo codes for reviewers/testers

## 11. Post-Launch Monitoring

### Metrics to Track
- Download count
- User ratings and reviews
- Crash reports
- Support ticket volume
- Unlock code usage

### Update Planning
- Bug fixes based on user feedback
- New feature additions
- Device compatibility updates
- Performance improvements

## Next Steps

1. **Immediate Actions**:
   - Validate manifest.xml
   - Create/verify app icon
   - Generate screenshots
   - Write privacy policy (if needed)

2. **Testing Phase**:
   - Test on multiple device simulators
   - Verify all unlock codes
   - Test all settings combinations

3. **Content Creation**:
   - Finalize store listing text
   - Capture and optimize screenshots
   - Prepare support documentation

4. **Build & Submit**:
   - Generate all device builds
   - Upload to Connect IQ Store
   - Monitor submission status

## Resources

- [Garmin Connect IQ Store Guidelines](https://developer.garmin.com/connect-iq/connect-iq-basics/store-guidelines/)
- [Connect IQ Developer Portal](https://developer.garmin.com/connect-iq/)
- [Connect IQ Forums](https://forums.garmin.com/developer/connect-iq/)
- [SDK Documentation](https://developer.garmin.com/connect-iq/api-docs/)

---

**Document Version**: 1.0
**Last Updated**: 2026-06-18
**Status**: Ready for Review
