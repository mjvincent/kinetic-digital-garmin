# Kinetic Digital - Quick Submission Checklist

Use this checklist to track your progress through the submission process.

## Phase 1: Documentation Review ✅

- [x] STORE_SUBMISSION_PLAN.md created
- [x] STORE_LISTING.md created
- [x] PRIVACY_POLICY.md created
- [x] BUILD_GUIDE.md created
- [x] SCREENSHOT_GUIDE.md created
- [x] SUBMISSION_SUMMARY.md created

## Phase 2: Technical Validation

### Manifest Review
- [ ] Open and review [`manifest.xml`](manifest.xml)
- [ ] Verify app ID: `7ad912fe-5175-44b0-9e4a-e827d6f9d64b`
- [ ] Confirm 19 devices listed
- [ ] Check minApiLevel: `6.0.0`
- [ ] Verify app name references `@Strings.AppName`
- [ ] Confirm launcher icon references `@Drawables.LauncherIcon`

### App Icon Verification
- [ ] Check [`resources/drawables/launcher_icon.svg`](resources/drawables/launcher_icon.svg) exists
- [ ] Open icon in editor to verify it renders
- [ ] Test icon on light background
- [ ] Test icon on dark background
- [ ] Confirm icon is recognizable at small sizes

### Code Review
- [ ] Review [`source/KineticDigitalApp.mc`](source/KineticDigitalApp.mc)
- [ ] Review [`source/KineticDigitalView.mc`](source/KineticDigitalView.mc)
- [ ] Check for TODO comments
- [ ] Remove any debug code
- [ ] Verify no deprecated API usage

## Phase 3: Build Process

### Build Script Setup
- [ ] Create `build-all.sh` from BUILD_GUIDE.md
- [ ] Make script executable: `chmod +x build-all.sh`
- [ ] Verify SDK path is correct
- [ ] Verify developer key path is correct

### Build Execution
- [ ] Run `./build-all.sh`
- [ ] Verify all 15 builds succeed
- [ ] Check `bin/` directory for .prg files
- [ ] Note any build warnings or errors

### Build Validation
- [ ] All .prg files created
- [ ] File sizes are reasonable (typically 50-200 KB)
- [ ] No compiler errors
- [ ] No critical warnings

## Phase 4: Testing

### Simulator Setup
- [ ] Launch Connect IQ simulator
- [ ] Install Venu 4 45mm device
- [ ] Install Fenix 8 47mm device
- [ ] Install Forerunner 970 device

### Functional Testing - Free Mode
- [ ] Load watch face without unlock code
- [ ] Verify gilt accent color displays
- [ ] Check battery ring shows correctly
- [ ] Verify BAT stat shows battery %
- [ ] Verify ACT stat shows active minutes
- [ ] Verify PRO stat shows "-- / PRO"
- [ ] Check steps display at bottom
- [ ] Verify date header displays correctly
- [ ] Test 12-hour time format
- [ ] Test 24-hour time format

### Functional Testing - Pro Mode
- [ ] Enter unlock code: `KINETIC-2026`
- [ ] Verify Pro features unlock
- [ ] Test accent color: Teal
- [ ] Test accent color: Blue
- [ ] Test accent color: Ruby
- [ ] Test Pro stat: Seconds
- [ ] Test Pro stat: Steps
- [ ] Test Pro stat: Active Minutes
- [ ] Test Pro stat: Calories
- [ ] Test Pro stat: Floors
- [ ] Test Pro stat: Battery
- [ ] Test ring mode: Battery
- [ ] Test ring mode: Steps Goal
- [ ] Test ring mode: Active Minutes
- [ ] Test ring mode: Day Progress
- [ ] Test military format toggle

### Unlock Code Testing
- [ ] Test demo code: `KINETIC-2026`
- [ ] Test demo code: `PRO-2026`
- [ ] Test demo code: `MJVDIGITAL`
- [ ] Test invalid code (should not unlock)
- [ ] Test email-based code generation
- [ ] Test code with spaces (should normalize)
- [ ] Test code with hyphens (should normalize)

### Edge Case Testing
- [ ] Test with 0% battery
- [ ] Test with 100% battery
- [ ] Test with no step goal set
- [ ] Test with very high step count (>100K)
- [ ] Test at midnight (date rollover)
- [ ] Test 12:00 AM display
- [ ] Test 00:00 in 24-hour format

### Multi-Device Testing
- [ ] Test on Venu 4 45mm
- [ ] Test on Fenix 8 47mm
- [ ] Test on Forerunner 970
- [ ] Verify scaling on different screen sizes
- [ ] Check text readability on all devices

## Phase 5: Screenshots

### Screenshot Preparation
- [ ] Create `screenshots/store-submission/` directory
- [ ] Review SCREENSHOT_GUIDE.md
- [ ] Set up simulator for screenshot capture
- [ ] Configure activity data in simulator

### Required Screenshots
- [ ] Screenshot 1: Default free mode (gilt, battery ring)
- [ ] Screenshot 2: Pro mode with teal accent (steps ring)
- [ ] Screenshot 3: Pro mode with ruby accent (active minutes ring)
- [ ] Screenshot 4: Military time with blue accent (day progress)
- [ ] Screenshot 5: Settings screen from Garmin Connect

### Optional Screenshots
- [ ] Screenshot 6: Smaller device (Venu 4 41mm)
- [ ] Screenshot 7: Low battery state
- [ ] Screenshot 8: High activity day

### Screenshot Quality Check
- [ ] All screenshots are clear and sharp
- [ ] Colors are accurate and vibrant
- [ ] Text is readable
- [ ] No simulator UI visible
- [ ] Proper resolution for each device
- [ ] File sizes are reasonable (<1 MB each)

## Phase 6: Content Finalization

### Store Listing Content
- [ ] Review short description (50 chars max)
- [ ] Review long description (4000 chars max)
- [ ] Review "What's New" text (500 chars max)
- [ ] Select 10-15 keywords/tags
- [ ] Proofread all text for typos
- [ ] Verify feature accuracy

### Support Information
- [ ] Set up support email address
- [ ] Create support website or GitHub page
- [ ] Prepare FAQ document
- [ ] Create response templates
- [ ] Test support email delivery

### Legal Documents
- [ ] Review PRIVACY_POLICY.md
- [ ] Publish privacy policy online (if required)
- [ ] Get privacy policy URL
- [ ] Review terms of service (if applicable)
- [ ] Clarify unlock code terms

### Contact Information
- [ ] Update support email in all documents
- [ ] Update website URL in all documents
- [ ] Update copyright information
- [ ] Add your name/company name

## Phase 7: Pre-Submission Review

### Final Code Check
- [ ] All source files reviewed
- [ ] No debug code remains
- [ ] No TODO comments remain
- [ ] Code is clean and documented
- [ ] No unused imports or variables

### Final Build Check
- [ ] All 15 .prg files present in `bin/`
- [ ] All builds are latest version
- [ ] No build errors or warnings
- [ ] File sizes are consistent

### Final Content Check
- [ ] All descriptions finalized
- [ ] All screenshots captured and optimized
- [ ] Privacy policy published
- [ ] Support information ready
- [ ] Contact details updated

### Documentation Check
- [ ] README.md is up to date
- [ ] All planning docs are complete
- [ ] Version numbers are consistent
- [ ] Links are working

## Phase 8: Connect IQ Store Submission

### Portal Access
- [ ] Log into Connect IQ Developer Portal
- [ ] Navigate to "My Apps"
- [ ] Click "Create New App"
- [ ] Select "Watch Face" category

### Basic Information
- [ ] Enter app name: "Kinetic Digital"
- [ ] Enter short description
- [ ] Enter long description
- [ ] Enter "What's New" text
- [ ] Select category: Watch Faces
- [ ] Set pricing: Free with Pro unlock

### Media Upload
- [ ] Upload Screenshot 1 (primary)
- [ ] Upload Screenshot 2
- [ ] Upload Screenshot 3
- [ ] Upload Screenshot 4
- [ ] Upload Screenshot 5
- [ ] Upload optional screenshots (if any)
- [ ] Add descriptions for each screenshot
- [ ] Verify screenshot order

### Technical Details
- [ ] Upload all 15 .prg files
- [ ] Verify device compatibility list
- [ ] Enter privacy policy URL (if required)
- [ ] Enter support email
- [ ] Enter support website
- [ ] Add keywords/tags

### Legal & Compliance
- [ ] Accept Connect IQ Store terms
- [ ] Confirm app meets guidelines
- [ ] Verify no copyright violations
- [ ] Confirm privacy policy compliance

### Final Review
- [ ] Preview store listing
- [ ] Check all information is correct
- [ ] Verify screenshots display properly
- [ ] Test all links work
- [ ] Review one final time

### Submit
- [ ] Click "Submit for Review"
- [ ] Note submission date
- [ ] Save confirmation email
- [ ] Monitor submission status

## Phase 9: Post-Submission

### Monitoring
- [ ] Check submission status daily
- [ ] Watch for Garmin review feedback
- [ ] Monitor email for updates
- [ ] Check developer portal notifications

### Preparation
- [ ] Prepare for user support inquiries
- [ ] Set up review monitoring
- [ ] Plan for first update
- [ ] Prepare marketing materials

### Response Plan
- [ ] If approved: Announce launch
- [ ] If rejected: Review feedback and fix issues
- [ ] If changes requested: Make updates promptly
- [ ] If questions: Respond to Garmin quickly

## Phase 10: Launch

### Announcement
- [ ] Post on Garmin Connect IQ forums
- [ ] Share on social media (if applicable)
- [ ] Notify beta testers (if any)
- [ ] Update project documentation

### Monitoring
- [ ] Track download count
- [ ] Monitor user ratings
- [ ] Read user reviews
- [ ] Track support inquiries

### Support
- [ ] Respond to user reviews
- [ ] Answer support emails
- [ ] Update FAQ based on questions
- [ ] Plan updates based on feedback

## Quick Reference

### Demo Unlock Codes
- `KINETIC-2026`
- `PRO-2026`
- `MJVDIGITAL`

### Supported Devices (19)
d2mach2pro, enduro3, fenix843mm, fenix847mm, fenix8pro47mm, fenix8solar47mm, fenix8solar51mm, fenixe, fr57042mm, fr57047mm, fr970, venu441mm, venu445mm, venux1, vivoactive6

### Key Files
- [`manifest.xml`](manifest.xml) - App configuration
- [`source/KineticDigitalView.mc`](source/KineticDigitalView.mc) - Main watch face code
- [`resources/settings/settings.xml`](resources/settings/settings.xml) - User settings
- [`resources/strings/strings.xml`](resources/strings/strings.xml) - UI strings

### Important Links
- [Connect IQ Developer Portal](https://developer.garmin.com/connect-iq/)
- [Store Guidelines](https://developer.garmin.com/connect-iq/connect-iq-basics/store-guidelines/)
- [API Documentation](https://developer.garmin.com/connect-iq/api-docs/)
- [Developer Forums](https://forums.garmin.com/developer/connect-iq/)

---

**Last Updated**: 2026-06-18
**Status**: Ready to Use

**Estimated Time**: 3-5 days for complete submission process
