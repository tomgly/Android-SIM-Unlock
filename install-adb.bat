@echo off

set "fileURL=https://dl.google.com/android/repository/platform-tools-latest-windows.zip"
set "filePath=%USERPROFILE%\platform-tools-latest-windows.zip"
set "expandPath=%USERPROFILE%\platform-tools"

powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri '%fileURL%' -OutFile '%filePath%'"

if not %errorlevel% == 0 (
  echo Failed to download platform-tools.
  echo.
  pause
  exit /b 1
)

powershell -NoProfile -Command "Expand-Archive -Path '%filePath%' -DestinationPath '%expandPath%' -Force"

if not %errorlevel% == 0 (
  echo Failed to extract platform-tools.
  echo.
  pause
  exit /b 1
)

move "%expandPath%\platform-tools\*" "%expandPath%"
rmdir "%expandPath%\platform-tools"
del "%filePath%"

echo Success
echo.
pause
exit
