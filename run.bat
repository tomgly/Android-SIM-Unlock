@echo off

rem job name
set jobName=run

rem path
set directoryPath=C:\Users\%username%\platform-tools

cd %directoryPath%
adb shell cmd appops set com.google.android.apps.work.oobconfig WAKE_LOCK deny
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_IN_BACKGROUND deny
adb shell cmd appops set com.google.android.apps.work.oobconfig RUN_ANY_IN_BACKGROUND deny
adb shell cmd appops set com.google.android.apps.work.oobconfig START_FOREGROUND deny
adb shell cmd appops set com.google.android.apps.work.oobconfig ACCESS_RESTRICTED_SETTINGS deny

if %errorlevel% == 0 (
  echo Success
) else (
  echo Failure
)

echo.
pause
exit