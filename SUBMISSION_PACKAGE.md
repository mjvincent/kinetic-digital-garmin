# Kinetic Digital - Submission Package Checklist

## Build Status ✅

**All 15 device builds completed successfully!**

### Built Files (101-109 KB each)
- ✅ KineticDigital-d2mach2pro.prg (109K)
- ✅ KineticDigital-enduro3.prg (101K)
- ✅ KineticDigital-fenix843mm.prg (106K)
- ✅ KineticDigital-fenix847mm.prg (109K)
- ✅ KineticDigital-fenix8pro47mm.prg (109K)
- ✅ KineticDigital-fenix8solar47mm.prg (101K)
- ✅ KineticDigital-fenix8solar51mm.prg (101K)
- ✅ KineticDigital-fenixe.prg (106K)
- ✅ KineticDigital-fr57042mm.prg (105K)
- ✅ KineticDigital-fr57047mm.prg (109K)
- ✅ KineticDigital-fr970.prg (109K)
- ✅ KineticDigital-venu441mm.prg (105K)
- ✅ KineticDigital-venu445mm.prg (109K)
- ✅ KineticDigital-venux1.prg (109K)
- ✅ KineticDigital-vivoactive6.prg (105K)

**Location**: `/Users/michaelvincentjones/GarminProjects/KineticDigital/bin/`

---

## Next Steps for Submission

### 1. Testing (REQUIRED)
Test on at least 3 device simulators:

**Recommended Test Devices:**
- [ ] **Venu 4 45mm** (venu445mm) - Popular AMOLED consumer device
- [ ] **Fenix 8 47mm** (fenix847mm) - Popular MIP fitness device
- [ ] **Forerunner 970** (fr970) - Running-focused AMOLED device

**How to Test:**
```bash
# Launch Connect IQ Simulator
"/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b/bin/connectiq"

# Or use VS Code Connect IQ extension
# 1. Open Command Palette (Cmd+Shift+P)
# 2. Type "Connect IQ: Run"
# 3. Select device
```

**Test Checklist:**
- [ ] Time displays correctly (12/24 hour)
- [ ] Date header shows correct format
- [ ] Battery ring renders smoothly
- [ ] Stats display correctly
- [ ] Demo unlock codes work (KINETIC-2026, PRO-2026, MJVDIGITAL)
- [ ] Pro features unlock properly
- [ ] Settings changes apply immediately
- [ ] No crashes or errors

### 2. Screenshots (REQUIRED)
Capture 5 screenshots following `SCREENSHOT_GUIDE.md`:

- [ ] **Screenshot 1**: Main watch face (default/free mode)
- [ ] **Screenshot 2**: Pro mode with Teal accent
- [ ] **Screenshot 3**: Pro mode with Blue accent
- [ ] **Screenshot 4**: Pro mode with Ruby accent
- [ ] **Screenshot 5**: Settings screen or alternate ring mode

**Requirements:**
- PNG format
- Device resolution (454x454 for most devices)
- Clear, high-quality captures
- Show key features

**Capture Method:**
- Use simulator's screenshot feature
- Or use macOS Screenshot tool (Cmd+Shift+4)
- Save to `KineticDigital/screenshots/` directory

### 3. Store Listing Content (READY)
All content prepared in `STORE_LISTING.md`:

- [x] App Name: "Kinetic Digital"
- [x] Short Description (50 chars)
- [x] Long Description (4000 chars)
- [x] What's New (500 chars)
- [x] Keywords/Tags
- [x] Category: Watch Faces
- [x] Price: Free (with Pro unlock)

### 4. Privacy Policy (READY)
- [x] Privacy policy document created: `PRIVACY_POLICY.md`
- [ ] **ACTION NEEDED**: Host privacy policy online
  - Upload to your website, GitHub Pages, or privacy policy hosting service
  - Get public URL for submission form

**Recommended Hosting Options:**
1. **GitHub Pages** (Free):
   - Create public repo
   - Upload PRIVACY_POLICY.md
   - Enable GitHub Pages
   - URL: `https://yourusername.github.io/kinetic-digital/privacy-policy.html`

2. **Your Website**:
   - Upload to your domain
   - URL: `https://yourdomain.com/kinetic-digital/privacy-policy`

3. **Privacy Policy Generators** (with hosting):
   - TermsFeed, FreePrivacyPolicy, etc.

### 5. Developer Information (UPDATE NEEDED)
Update contact information in all documents:

- [ ] `PRIVACY_POLICY.md` - Add your email/contact info
- [ ] `STORE_LISTING.md` - Verify support contact
- [ ] Connect IQ Developer Account - Ensure profile is complete

**Your Contact Info:**
- Developer Name: [YOUR NAME]
- Support Email: [YOUR EMAIL]
- Website (optional): [YOUR WEBSITE]

### 6. Connect IQ Store Submission

**Prerequisites:**
- [x] Garmin Connect IQ Developer Account
- [x] All .prg files built
- [ ] Screenshots captured
- [ ] Privacy policy URL ready
- [ ] Testing completed

**Submission Steps:**

1. **Login to Connect IQ Store**
   - Go to: https://apps.garmin.com/developer
   - Sign in with your Garmin account

2. **Create New App**
   - Click "Upload New App"
   - Select "Watch Face" as app type
   - Enter app name: "Kinetic Digital"

3. **Upload Builds**
   - Upload all 15 .prg files from `bin/` directory
   - System will validate each build

4. **Add Screenshots**
   - Upload 5 screenshots (PNG format)
   - Arrange in preferred order

5. **Enter Store Listing**
   - Copy content from `STORE_LISTING.md`
   - Paste into appropriate fields
   - Add keywords/tags

6. **Set Pricing**
   - Select "Free"
   - Note: Pro features unlocked via in-app codes

7. **Add Privacy Policy**
   - Enter your hosted privacy policy URL
   - Confirm data collection statement

8. **Review & Submit**
   - Review all information
   - Accept terms and conditions
   - Click "Submit for Review"

**Review Timeline:**
- Typical review: 3-5 business days
- May request changes or clarifications
- Check email for updates

---

## Submission Package Summary

### ✅ Completed
- SDK environment verified
- Manifest validated
- Build script created
- All 15 device builds successful
- Documentation complete
- Store listing content prepared
- Privacy policy drafted

### 🔄 In Progress / Pending
- Simulator testing (3+ devices)
- Screenshot capture (5 required)
- Privacy policy hosting
- Contact info updates
- Final submission

### 📦 Files Ready for Submission
```
KineticDigital/
├── bin/
│   ├── KineticDigital-d2mach2pro.prg
│   ├── KineticDigital-enduro3.prg
│   ├── KineticDigital-fenix843mm.prg
│   ├── KineticDigital-fenix847mm.prg
│   ├── KineticDigital-fenix8pro47mm.prg
│   ├── KineticDigital-fenix8solar47mm.prg
│   ├── KineticDigital-fenix8solar51mm.prg
│   ├── KineticDigital-fenixe.prg
│   ├── KineticDigital-fr57042mm.prg
│   ├── KineticDigital-fr57047mm.prg
│   ├── KineticDigital-fr970.prg
│   ├── KineticDigital-venu441mm.prg
│   ├── KineticDigital-venu445mm.prg
│   ├── KineticDigital-venux1.prg
│   └── KineticDigital-vivoactive6.prg
├── screenshots/ (to be created)
│   ├── screenshot1.png
│   ├── screenshot2.png
│   ├── screenshot3.png
│   ├── screenshot4.png
│   └── screenshot5.png
└── documentation/
    ├── STORE_LISTING.md
    ├── PRIVACY_POLICY.md
    ├── SCREENSHOT_GUIDE.md
    └── SUBMISSION_SUMMARY.md
```

---

## Quick Commands

### Test a Build
```bash
# Launch simulator
"/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b/bin/connectiq"

# Or use monkeydo to run directly
"/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b/bin/monkeydo" \
  bin/KineticDigital-venu445mm.prg venu445mm
```

### Rebuild All (if needed)
```bash
cd KineticDigital
./build-all.sh
```

### Create Screenshots Directory
```bash
mkdir -p KineticDigital/screenshots
```

---

## Support & Resources

- **Connect IQ Developer Portal**: https://developer.garmin.com/connect-iq/
- **Store Guidelines**: https://developer.garmin.com/connect-iq/connect-iq-basics/app-submission/
- **SDK Documentation**: https://developer.garmin.com/connect-iq/api-docs/
- **Developer Forums**: https://forums.garmin.com/developer/

---

**Status**: Ready for testing and screenshot capture
**Next Action**: Test on 3 simulators and capture 5 screenshots
**Estimated Time to Submission**: 2-3 hours (testing + screenshots + final review)
