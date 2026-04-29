# Android SIM Unlock Bypass for Google Pixel Devices

This repository documents a **SIM/carrier-lock bypass method for some Google Pixel devices**.

The original method was shared on XDA:

- [Carrier unlock a Google Pixel phone (tested on Pixel 9, 8 and 5)](https://xdaforums.com/t/carrier-unlock-a-google-pixel-phone-tested-on-pixel-9-8-and-5.4680825/)

## Important

> [!IMPORTANT]
> This method is **Pixel-specific**.
>
> It is **not a general SIM unlock method** for all Android devices.

> [!WARNING]
> This method does **not** unlock the bootloader.
>
> It does **not** bypass OEM unlocking restrictions.
>
> It does **not** make Verizon Pixel devices bootloader-unlockable if OEM unlocking is blocked.

## Compatibility

This method targets the Pixel Device Setup package:

```sh
com.google.android.apps.work.oobconfig
```

It has been tested or reported on some Pixel models, including:

- **Pixel 9**
- **Pixel 8**
- **Pixel 5**

Other Pixel models may or may not work.

**Non-Pixel devices are generally unsupported.**

## What this method does

This method attempts to prevent the Pixel **Device Setup** app from restoring or enforcing certain SIM/carrier-lock behavior.

It works by restricting Device Setup with Android settings and ADB appops.

This method does **not**:

- Officially unlock your device through the carrier
- Unlock the bootloader
- Enable OEM unlocking
- Modify modem firmware
- Guarantee eSIM support
- Guarantee compatibility with non-Pixel devices

## Requirements

You need:

- A potentially compatible Google Pixel device
- A physical SIM card
- A computer with ADB installed
- USB debugging enabled

Physical SIMs are more commonly reported to work. **eSIM support is uncertain.**

## Steps

### 1. Set up the phone offline

1. Remove the SIM card.
2. Factory reset the phone.
3. Complete setup without Wi-Fi.
4. Do not insert the SIM yet.
5. Avoid adding a Google account during initial setup if possible.

### 2. Restrict Device Setup

1. Open **Settings**.
2. Go to **Apps**.
3. Tap **See all apps**.
4. Tap the three-dot menu.
5. Enable **Show system**.
6. Open **Device Setup**.
7. Open **Mobile data & Wi-Fi**, **Wi-Fi data usage**, or **Mobile data usage**.
8. Disable **Background data**.
9. Set **App battery usage** to **Restricted** if available.

### 3. Run the ADB commands

Enable Developer options and USB debugging, then connect the phone to your computer.

Run these commands:

```sh
adb shell cmd appops set com.google.android.apps.work.oobconfig WAKE_LOCK deny
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND deny
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND deny
adb shell cmd appops set com.google.android.apps.work.oobconfig START_FOREGROUND deny
adb shell cmd appops set com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS deny
```

Insert the physical SIM card and check whether mobile service works.

## Helper scripts

This repository includes Windows helper scripts for convenience.

- [`install-adb.bat`](./install-adb.bat) downloads and extracts Android platform tools.
- [`run.bat`](./run.bat) runs the ADB appops commands listed above.

You can also run the ADB commands manually on Windows, macOS, or Linux if you already have ADB installed.

## Android updates

Android updates may cause the bypass to stop working.

Before rebooting into an update, enabling **Airplane mode** may help. After the update, check Device Setup again and re-apply the restrictions if needed.

This is **not guaranteed** to preserve the bypass.

## Troubleshooting

### Device Setup is missing

Make sure **Show system** is enabled in the app list.

You can check for the package with ADB.

On Windows PowerShell:

```powershell
adb shell pm list packages | findstr oobconfig
```

On macOS/Linux:

```bash
adb shell pm list packages | grep oobconfig
```

If `com.google.android.apps.work.oobconfig` is missing, this method probably does not apply to your device.

### SIM is still locked

Common reasons include:

- The device is not a compatible Pixel model
- The lock is enforced outside Android userspace
- Device Setup restored the lock behavior
- The ADB commands were not applied correctly
- The device connected to the internet before restrictions were applied
- You are using eSIM instead of a physical SIM

### OEM unlocking is still greyed out

That is expected.

This method does **not** unlock the bootloader and does **not** bypass OEM unlocking restrictions.

## Issues and Discussions

If you have a question, compatibility concern, troubleshooting problem, or device report, please feel free to start a discussion or open an issue.

- [Discussions](https://github.com/tomgly/Android-SIM-Unlock/discussions) are a good place for general questions, device compatibility questions, troubleshooting, and working or not-working reports.
- [Issues](https://github.com/tomgly/Android-SIM-Unlock/issues) are helpful for documentation problems, reproducible problems with the provided steps or scripts, and clear compatibility reports with enough device details.

When posting, please include:

- Device model
- Pixel or non-Pixel
- Android version or ROM
- Carrier
- Physical SIM or eSIM
- Bootloader status
- Whether OEM unlocking is available
- Whether the method worked, failed, or partially worked

Please avoid opening an issue with only a title and no details.

## Known limitations

- **Pixel-specific method**
- **Not an official carrier unlock**
- **Not an OEM unlock or bootloader unlock**
- eSIM support is uncertain
- Non-Pixel devices are generally unsupported
- May not survive factory reset or Android updates
- Google or carriers may change behavior at any time

## References

- [Carrier unlock a Google Pixel phone (tested on Pixel 9, 8 and 5)](https://xdaforums.com/t/carrier-unlock-a-google-pixel-phone-tested-on-pixel-9-8-and-5.4680825/)
- [Issue #1: Device Setup restrictions and persistence notes](https://github.com/tomgly/Android-SIM-Unlock/issues/1)

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
