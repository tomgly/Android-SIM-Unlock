@echo off

rem job name
set jobName=adb

rem file url
set fileURL=https://dl.google.com/android/repository/platform-tools-latest-windows.zip

rem path
set filePath=C:\Users\%username%\platform-tools-latest-windows.zip
set expandPath=C:\Users\%username%\platform-tools

rem download
bitsadmin /TRANSFER "%jobName%" "%fileURL%" "%filePath%"
echo.

rem Expand zip file
powershell Expand-Archive -Path %filePath% -DestinationPath %expandPath% -Force
echo.

move %expandPath%\platform-tools\* %expandPath%
rmdir %expandPath%\platform-tools
del %filePath%

if %errorlevel% == 0 (
  echo Success
) else (
  echo Failure
)

echo.
pause
exit