# Kinetic Digital

Kinetic Digital is a Garmin Connect IQ watch face with a clean digital dashboard style. It emphasizes large time hierarchy, a date header, compact stats, and a selectable outer ring for battery, steps, active minutes, or day progress.

This project replaces the earlier analog skeleton direction with a sharper digital-first UI. No code, fonts, or assets are reused from previous watch face prototypes.

## Features

- Large digital time display
- Date header with underline
- Battery progress ring plus selectable ring mode
- Free mode battery, active minutes, and steps display
- Pro mode unlocks custom accent colors and right-side stats
- Pro stat options: seconds, steps, active minutes, calories, floors, battery
- Supports 12/24-hour devices and optional military-style format independent of device clock settings

## Pro unlock behavior

- Free users see:
  - default gilt accent
  - battery outer ring
  - battery stat
  - active minutes center stat
  - locked right stat shown as `-- / PRO`
- Unlocked users gain:
  - custom accent colors
  - selectable Pro stat display
  - selectable ring mode
  - optional email-based unlock codes

## Unlock codes

- Demo unlock codes:
  - `KINETIC-2026`
  - `PRO-2026`
  - `MJVDIGITAL`
- Email-based unlock codes are generated from the normalized email address as `KD-XXXX-XXXX`

## Store listing draft

Kinetic Digital is a clean Garmin watch face built around a large digital time display, a crisp date header, compact daily stats, and a progress ring that keeps key information visible at a glance.

Free mode includes the core dashboard experience:

- time and date
- battery progress ring
- battery, active minutes, and steps
- gilt accent color

Pro unlock adds customization:

- accent colors: Gilt, Teal, Blue, Ruby
- right stat: Seconds, Steps, Active Minutes, Calories, Floors, Battery
- ring mode: Battery, Steps Goal, Active Minutes, Day Progress
- optional 24-hour military format setting

## User settings

Settings are managed through Garmin Connect, Garmin Express, or supported device/app settings flows.

- `Unlock Code`: enter a demo or customer unlock code
- `Unlock Email`: optional email used for generated unlock codes
- `Accent Color`: Pro-only accent color
- `Pro Stat`: Pro-only right-side stat
- `Ring Mode`: Pro-only outer progress ring
- `Military Format`: forces 24-hour time while keeping the colon separator

If the watch face does not update immediately after changing settings, reopen the watch face or sync the device from Garmin Connect.

## Support notes

For unlock help, include the unlock email used in settings and the Garmin device model. Unlock codes are normalized by removing spaces and hyphens; emails are normalized by lowercasing and removing spaces.

Known simulator note: Garmin's Connect IQ simulator may keep `Trigger App Settings` disabled for this watch face. Use Garmin Connect, Garmin Express, or a real device as the source of truth for final settings validation.

## Screenshot checklist

Recommended screenshots before submission:

- locked/free default face
- unlocked face with alternate accent color
- unlocked face showing a non-default Pro stat
- unlocked face showing a non-battery ring mode
- settings screen showing unlock and customization options

## Build

```sh
"/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b/bin/monkeyc" \
  -f monkey.jungle \
  -o bin/KineticDigital-venu445mm.prg \
  -y "/Users/michaelvincentjones/Documents/Garmin/Developer Key/developer_key" \
  -d venu445mm
```
