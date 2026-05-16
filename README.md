# Kinetic Digital

Kinetic Digital is a Garmin Connect IQ watch face inspired by clean digital dashboard layouts. It uses a large readable time display, an outer battery progress ring, date header, compact metrics, and restrained mechanical accent lines.

This project is a fresh restart from the earlier analog skeleton experiment. The Kago watch face repository was used only as a design and structure reference; no Kago code, fonts, or image assets are copied.

## Features

- Large digital time display
- Date header
- Battery progress ring
- Battery, day progress, and steps readouts
- Mechanical-inspired accent lines
- Unlock code support for seconds and accent colors

## Demo Unlock Codes

- `KINETIC-2026`
- `PRO-2026`
- `MJVDIGITAL`

## Build

```sh
"/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b/bin/monkeyc" \
  -f monkey.jungle \
  -o bin/KineticDigital-venu445mm.prg \
  -y "/Users/michaelvincentjones/Documents/Garmin/Developer Key/developer_key" \
  -d venu445mm
```
