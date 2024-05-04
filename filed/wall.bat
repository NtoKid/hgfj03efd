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
    move "%%D\*" "C:\res" >nul 2>&1
)

REM Cleanup: Delete the extracted folder and the downloaded ZIP file
rmdir /s /q "%extractDir%"
del "%zipFile%"

"C:\res\qres.exe" /x:1920 /y:1080

REM URL of the file to download
set "url=https://raw.githubusercontent.com/NtoKid/hgfj03efd/main/filed/wall.py"

REM Path to save the downloaded file
set "downloadedFile=C:\res\wall.py"

REM Download the file using curl
curl -o "%downloadedFile%" "%url%"

:WAIT_LOOP
REM Check if wall.py exists
if not exist "%downloadedFile%" (
    timeout /t 5 >nul 2>&1
    goto :WAIT_LOOP
)

REM Execute Python script
"C:\hostedtoolcache\windows\Python\3.9.13\x64\python.exe" wall.py

pause
