# CarrierUnlockPixel

## Step-By-Step

1. Take out the sim card
2. Factory reset your phone
3. Set it up like usual in offline mode. It is crucial to not insert the sim and to not connect to any Wi-Fi networks just yet
4. Once you're done with the setup, go into Settings > Apps > See all apps.
5. In the top right corner, tap on the three dots and tap on "Show system"
6. Search for an app called "Device setup"
7. Tap on the menu that can be called one of the following: "Mobile data & Wi-Fi", "Wi-Fi data usage" and "Mobile data usage"
8. Disable "Background data"
9. Go back and go into "App battery usage" and set it to "Restricted" if you have such an option. If you don't, don't worry and skip this step.
10. Enable developer options and USB debugging
11. Connect your device to your computer and run the following adb commands one after another. Make sure you have adb installed and running and that you've allowed USB debugging from the phone.

12. Code

```
adb shell cmd appops set com.google.android.apps.work.oobconfig WAKE_LOCK deny
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND deny
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND deny
adb shell cmd appops set com.google.android.apps.work.oobconfig START_FOREGROUND deny
adb shell cmd appops set com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS deny
```

13. Put the sim card in and enjoy using your phone.
