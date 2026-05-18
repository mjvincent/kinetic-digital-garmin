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

## Build

```sh
"/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b/bin/monkeyc" \
  -f monkey.jungle \
  -o bin/KineticDigital-venu445mm.prg \
  -y "/Users/michaelvincentjones/Documents/Garmin/Developer Key/developer_key" \
  -d venu445mm
```
