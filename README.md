# Skeleton Automatic

Skeleton Automatic is a Garmin Connect IQ analog watch face inspired by automatic skeleton watches. It uses proportional vector-style drawing so the dial, hands, rings, gears, and open-heart detail scale across modern round AMOLED Garmin devices.

## Features

- Analog hour and minute hands
- Stylized skeleton dial with layered rings, bridges, gears, jewels, and open-heart detail
- Optional second hand in unlocked mode
- Optional date and battery readouts in unlocked mode
- Configurable accent color and skeleton detail level
- Lightweight offline unlock-code gate for casual licensing

## Unlock Codes

This first implementation intentionally uses simple public unlock codes because the repo may be public and Garmin watch-face code should not be treated as strong DRM. Current demo unlock codes are:

- `AUTO-2026`
- `SKELETON-2026`
- `MJVAUTO`

Replace this validator before selling the face if you want per-customer codes.

## Build

Use the Garmin Connect IQ SDK and the developer key at:

`/Users/michaelvincentjones/Documents/Garmin/Developer Key/developer_key`

Example:

```sh
"/Users/michaelvincentjones/Library/Application Support/Garmin/ConnectIQ/Sdks/connectiq-sdk-mac-9.1.0-2026-03-09-6a872a80b/bin/monkeyc" \
  -f monkey.jungle \
  -o bin/SkeletonAutomatic.prg \
  -y "/Users/michaelvincentjones/Documents/Garmin/Developer Key/developer_key" \
  -d venu445mm
```

## Notes

The first target set favors modern round AMOLED watches. Older MIP devices can be added later with reduced detail and color assumptions.
