# Android SIM Unlock Bypass

I will share a simple way to bypass carrier restrictions on Android devices by tweaking the `Device Setup` app settings. The method has been tested on **Pixel 9, 8, and 5**. I tried it on the **Pixel 7a**, but it should work on other models as well.

## 🔥 Important Notice
- This method **does not** unlock the bootloader (OEM unlock).
- You **must** redo the process after a factory reset.
- **eSIM may not work** with this method, but physical SIMs have been tested successfully.
- This process may be overridden by Google at any time.

## 🛠️ Steps to Bypass Carrier Lock

### Preparation
1. **Remove the SIM card** from the device.
2. **Factory reset** your phone.
3. **Set up the phone in offline mode**  
   - Do **not** insert the SIM card yet.  
   - Do **not** connect to any Wi-Fi networks.

### Modify Device Setup App
1. Go to **Settings** > **Apps** > **See all apps**.
2. Tap the three dots in the top-right corner and **enable "Show system"**.
3. Find **"Device Setup"** and open it.
4. Navigate to one of the following options:
   - **Mobile data & Wi-Fi**
   - **Wi-Fi data usage**
   - **Mobile data usage**
5. **Disable "Background data".**
6. (Optional) If available, go to **"App battery usage"** and set it to **"Restricted"**.

### Apply ADB Commands
1. Enable **Developer options** and **USB debugging**.
2. Connect your phone to a PC and run the following commands:

   ```bat
   adb shell cmd appops set com.google.android.apps.work.oobconfig WAKE_LOCK deny
   adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND deny
   adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND deny
   adb shell cmd appops set com.google.android.apps.work.oobconfig START_FOREGROUND deny
   adb shell cmd appops set com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS deny
   ```

3. Insert the SIM card and enjoy your unlocked device.

## 🔄 Upgrading to Android 15 Without Losing Unlock

1. Download the update.
2. **Before rebooting**, enable **Airplane mode**.
3. Reboot the device.
4. After reboot, **clear the cache** of the **Device Setup** app.
5. **Disable background data usage** for the **Device Setup** app.
6. Turn off **Airplane mode**.

##🚨 Additional Notes

- **Google can reverse this at any time.**
- The **Device Setup app has the permission to reset its own restrictions**.
- You can use **Shizuku or Dhizuku** to gain admin control.
- To persist the bypass, **make the device owner app an inherited DPM app** using `Owndroid`.
- The **OEM Unlock switch may be toggled** if both eSIM and physical SIM bypasses are successful.

## 📜 License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

## 📌 Related Scripts
I made two helper scripts for this method

### [install-adb.bat](install-adb.bat)
Automates the download and expand zip of the latest ADB tools, which are saved to `C:\Users\YourUserName\platform-tools`.

### [run.bat](run.bat)
Automates the [**Apply ADB Commands**](https://github.com/tomgly/adb-unlock-bypass/edit/main/README.md#apply-adb-commands), executing the required ADB commands.

## 🔗 References
This method is based on research and findings from the following source

- [Carrier unlock a Google Pixel phone (tested on Pixel 9, 8 and 5)](https://xdaforums.com/t/carrier-unlock-a-google-pixel-phone-tested-on-pixel-9-8-and-5.4680825/)

Additional insights were provided by the community member in [**Issue #1**](https://github.com/tomgly/adb-unlock-bypass/issues/1)
