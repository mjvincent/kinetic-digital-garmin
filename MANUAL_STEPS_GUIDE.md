# Kinetic Digital - Manual Steps Guide

## What I Cannot Automate

As an AI assistant, I cannot:
1. **Capture screenshots** - Requires GUI interaction with the simulator
2. **Host files online** - Requires web hosting access
3. **Submit to Garmin Store** - Requires your Garmin account login
4. **Update personal contact info** - Requires your actual email/name

However, I've prepared everything to make these steps as easy as possible!

---

## ✅ What's Already Done

- [x] All 15 device builds generated
- [x] Store listing content written
- [x] Privacy policy drafted (Markdown and HTML versions)
- [x] Screenshot capture script created
- [x] Documentation completed
- [x] Repository updated

---

## 📸 STEP 1: Capture Screenshots (30-60 minutes)

### Option A: Use the Automated Script (Recommended)

```bash
cd KineticDigital
./capture-screenshots.sh
```

The script will:
- Launch the simulator automatically
- Guide you through each screenshot
- Tell you exactly what settings to configure
- Prompt you when to capture each image

### Option B: Manual Screenshot Capture

1. **Launch Simulator**:
   ```bash
   cd KineticDigital
   "/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b/bin/monkeydo" \
     bin/KineticDigital-venu445mm.prg venu445mm
   ```

2. **For Each Screenshot**:
   - Configure settings as specified in SCREENSHOT_GUIDE.md
   - Wait for watch face to update
   - Use macOS screenshot: `Cmd + Shift + 4`
   - Drag to select just the watch face
   - Save to `screenshots/store-submission/` with correct filename

3. **Required Screenshots**:
   - `01-default-free-mode.png` - Default gilt accent, locked
   - `02-pro-teal-steps.png` - Teal accent, steps ring
   - `03-pro-ruby-calories.png` - Ruby accent, calories stat
   - `04-military-time-blue.png` - Blue accent, 24-hour time
   - `05-settings-screen.png` - Garmin Connect settings view

### Screenshot 5 Special Note

For the settings screen, you have 3 options:
1. Screenshot from Garmin Connect mobile app (if you have a device)
2. Screenshot from Garmin Express desktop app
3. Create a mockup showing the settings interface

---

## 🌐 STEP 2: Host Privacy Policy (15-30 minutes)

### Option A: GitHub Pages (Recommended - Free)

I've created `privacy-policy.html` for you. Here's how to host it:

1. **Create a new public GitHub repository**:
   ```bash
   # On GitHub.com, create new repo: kinetic-digital-privacy
   ```

2. **Upload the HTML file**:
   ```bash
   cd /path/to/new/repo
   cp /Users/michaelvincentjones/GarminProjects/KineticDigital/privacy-policy.html .
   git add privacy-policy.html
   git commit -m "Add privacy policy"
   git push
   ```

3. **Enable GitHub Pages**:
   - Go to repo Settings → Pages
   - Source: Deploy from branch
   - Branch: main (or master)
   - Folder: / (root)
   - Save

4. **Your URL will be**:
   ```
   https://[your-github-username].github.io/kinetic-digital-privacy/privacy-policy.html
   ```

5. **Before finalizing**:
   - Edit `privacy-policy.html`
   - Replace `[YOUR_EMAIL_HERE]` with your actual email
   - Replace `[YOUR_NAME_HERE]` with your name
   - Commit and push changes

### Option B: Your Own Website

If you have a website:
1. Upload `privacy-policy.html` to your web server
2. Make it accessible at a public URL
3. Test the URL in a browser

### Option C: Privacy Policy Hosting Service

Use a service like:
- TermsFeed (https://www.termsfeed.com/)
- FreePrivacyPolicy (https://www.freeprivacypolicy.com/)
- PrivacyPolicies (https://www.privacypolicies.com/)

---

## ✏️ STEP 3: Update Contact Information (10 minutes)

### Files to Update

1. **privacy-policy.html** (if hosting yourself):
   - Line 157: Replace `[YOUR_EMAIL_HERE]` with your email
   - Line 173: Replace `[YOUR_NAME_HERE]` with your name

2. **PRIVACY_POLICY.md** (for reference):
   - Line 94: Replace `[Your support email]` with your email
   - Line 95: Replace `[Your repository URL if applicable]` with your GitHub URL
   - Line 110: Replace `[Your Name/Company]` with your name

### Quick Find & Replace

```bash
cd KineticDigital

# Update HTML file
sed -i '' 's/\[YOUR_EMAIL_HERE\]/your.email@example.com/g' privacy-policy.html
sed -i '' 's/\[YOUR_NAME_HERE\]/Your Name/g' privacy-policy.html

# Update Markdown file
sed -i '' 's/\[Your support email\]/your.email@example.com/g' PRIVACY_POLICY.md
sed -i '' 's/\[Your Name\/Company\]/Your Name/g' PRIVACY_POLICY.md
```

Replace `your.email@example.com` and `Your Name` with your actual information.

---

## 🧪 STEP 4: Optional Testing (30-60 minutes)

### Quick Test on 3 Devices

```bash
cd KineticDigital

# Test 1: Venu 4 45mm (AMOLED, popular consumer device)
./test-simulator.sh venu445mm

# Test 2: Fenix 8 47mm (MIP, popular fitness device)
./test-simulator.sh fenix847mm

# Test 3: Forerunner 970 (AMOLED, runner-focused)
./test-simulator.sh fr970
```

### What to Test

For each device:
1. **Default State**: Watch face loads and displays correctly
2. **Unlock Codes**: Try demo codes (KINETIC-2026, PRO-2026, MJVDIGITAL)
3. **Accent Colors**: Change accent color in settings
4. **Ring Modes**: Switch between Battery, Steps, Active Minutes, Day Progress
5. **Pro Stats**: Try different stat options
6. **Military Time**: Toggle 24-hour format

### How to Change Settings in Simulator

1. While simulator is running, go to Settings
2. Or use Garmin Connect app if you have a physical device
3. Changes should apply immediately or after reopening watch face

---

## 🚀 STEP 5: Submit to Garmin Connect IQ Store (30-45 minutes)

### Prerequisites Checklist

Before starting submission:
- [ ] All 5 screenshots captured and saved
- [ ] Privacy policy hosted and URL ready
- [ ] Contact information updated
- [ ] Garmin Developer Account active

### Submission Process

1. **Login to Developer Portal**:
   - Go to: https://apps.garmin.com/developer
   - Sign in with your Garmin account

2. **Create New App**:
   - Click "Upload New App" or "Add New App"
   - Select "Watch Face" as app type
   - Enter app name: **Kinetic Digital**

3. **Upload Builds**:
   - Navigate to the builds section
   - Upload all 15 .prg files from `bin/` directory:
     ```
     KineticDigital-d2mach2pro.prg
     KineticDigital-enduro3.prg
     KineticDigital-fenix843mm.prg
     KineticDigital-fenix847mm.prg
     KineticDigital-fenix8pro47mm.prg
     KineticDigital-fenix8solar47mm.prg
     KineticDigital-fenix8solar51mm.prg
     KineticDigital-fenixe.prg
     KineticDigital-fr57042mm.prg
     KineticDigital-fr57047mm.prg
     KineticDigital-fr970.prg
     KineticDigital-venu441mm.prg
     KineticDigital-venu445mm.prg
     KineticDigital-venux1.prg
     KineticDigital-vivoactive6.prg
     ```
   - Wait for validation to complete

4. **Add Screenshots**:
   - Upload screenshots in this order:
     1. `01-default-free-mode.png`
     2. `02-pro-teal-steps.png`
     3. `03-pro-ruby-calories.png`
     4. `04-military-time-blue.png`
     5. `05-settings-screen.png`
   - Add descriptions for each (optional but recommended)

5. **Enter Store Listing**:
   - Open `STORE_LISTING.md` in a text editor
   - Copy/paste the following sections:

   **Short Description** (50 chars max):
   ```
   Clean digital watch face with customizable stats
   ```

   **Long Description** (4000 chars max):
   ```
   [Copy entire "Long Description" section from STORE_LISTING.md]
   ```

   **What's New** (500 chars max):
   ```
   Initial release of Kinetic Digital featuring:
   • Clean digital dashboard design
   • Large time hierarchy with date header
   • Customizable stats and progress ring
   • Pro unlock with accent colors and stat options
   • Support for 19 Garmin devices
   ```

6. **Add Keywords/Tags**:
   ```
   digital, clean, customizable, stats, battery, steps,
   active minutes, dashboard, modern, minimal
   ```

7. **Set Category**:
   - Select: **Watch Faces**

8. **Set Pricing**:
   - Select: **Free**
   - Note: Pro features are unlocked via in-app codes

9. **Add Privacy Policy**:
   - Enter your hosted privacy policy URL
   - Example: `https://yourusername.github.io/kinetic-digital-privacy/privacy-policy.html`

10. **Support Contact**:
    - Enter your support email
    - Optionally add website URL

11. **Review Everything**:
    - Check all fields are filled correctly
    - Preview how it will appear in the store
    - Verify screenshots are in correct order
    - Confirm privacy policy URL works

12. **Submit for Review**:
    - Accept terms and conditions
    - Click "Submit for Review"
    - Note the submission ID/reference

### After Submission

- **Check Email**: Garmin will send confirmation
- **Review Timeline**: Typically 3-5 business days
- **Possible Outcomes**:
  - ✅ Approved and published
  - 📝 Changes requested
  - ❌ Rejected (with reasons to address)

---

## 📊 Progress Tracking

### Completed
- [x] Development finished
- [x] All builds generated
- [x] Documentation created
- [x] Repository updated
- [x] Privacy policy drafted
- [x] Store listing content prepared

### Your Tasks
- [ ] Capture 5 screenshots
- [ ] Host privacy policy online
- [ ] Update contact information
- [ ] Optional: Test on 3 simulators
- [ ] Submit to Connect IQ Store

---

## 🆘 Troubleshooting

### Screenshots Not Capturing
- Use macOS built-in screenshot: `Cmd + Shift + 4`
- Or use simulator's screenshot feature if available
- Ensure you're capturing just the watch face, not the entire simulator window

### Settings Not Updating in Simulator
- Close and reopen the watch face
- Or restart the simulator
- Settings changes should apply immediately

### Privacy Policy URL Not Working
- Ensure GitHub Pages is enabled
- Wait 5-10 minutes for GitHub Pages to deploy
- Check the URL in an incognito browser window

### Build Upload Fails
- Ensure .prg files are not corrupted
- Check file sizes (should be 101-109 KB)
- Try uploading one at a time if batch upload fails

---

## 📞 Need Help?

If you encounter issues:
1. Check the detailed guides in the documentation
2. Review Garmin's submission guidelines
3. Ask me for clarification on any step
4. Contact Garmin Developer Support if needed

---

## ⏱️ Time Estimates

- **Screenshots**: 30-60 minutes
- **Privacy Policy Hosting**: 15-30 minutes
- **Contact Info Updates**: 10 minutes
- **Optional Testing**: 30-60 minutes
- **Store Submission**: 30-45 minutes

**Total Time**: 2-3 hours

---

**You're almost there! Just these manual steps and you'll be submitted!** 🎉
