@echo off
set "url=https://codeload.github.com/AlbertoMGV/ScreenResolutionChanger/zip/refs/heads/master"
set "zipFile=%temp%\ScreenResolutionChanger.zip"
set "extractDir=%temp%\ScreenResolutionChanger"

REM Download the ZIP file
curl -L -o "%zipFile%" "%url%"

REM Unzip the downloaded file
powershell Expand-Archive -Path "%zipFile%" -DestinationPath "%extractDir%"

REM Move the contents to the desired directory
for /d %%D in ("%extractDir%\*") do (
    move "%%D\*" "C:\QRes" >nul 2>&1
)

REM Cleanup: Delete the extracted folder and the downloaded ZIP file
rmdir /s /q "%extractDir%"
del "%zipFile%"

echo Repository extracted to: C:\QRes

"C:\QRes\qres.exe" /x:1920 /y:1080
"C:\hostedtoolcache\windows\Python\3.9.13\x64\python.exe" wall.py
pause
