Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
& {$P = $env:TEMP + '\chromeremotedesktophost.msi'; Invoke-WebRequest 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' -OutFile $P; Start-Process $P -Wait; Remove-Item $P}


New-Item -ItemType "directory" -Force -Path "c:\down"
New-Item -ItemType "directory" -Force -Path "c:\rclone"
New-Item -ItemType "directory" -Force -Path "c:\res"
New-Item -ItemType "directory" -Force -Path "c:\TOOLS2"
New-Item -ItemType "directory" -Force -Path "C:\Users\runneradmin\AppData\Roaming\GHISLER\"
New-Item -ItemType "directory" -Force -Path "c:\rclone\UPLOAD"

<# DOWNLOAD WINFSP RAR #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/um5s6m08uzplapm/winfsp.msi?dl=1" -OutFile C:\TOOLS2\winfsp.msi

<# DOWNLOAD TOTAL COMMANDER #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/ebdtcbgrnwo97ow/TOTAL.zip?dl=1" -OutFile C:\down\TCM.zip
Expand-Archive -LiteralPath 'C:\down\TCM.zip' -DestinationPath C:\


<# DOWNLOAD TOTAL COMMANDER CONFIGS
Invoke-WebRequest -Uri "https://www.dropbox.com/s/tiucda3gzf1xns0/WINCMD.INI?dl=1" -OutFile C:\down\TCM-CFG.zip
Expand-Archive -LiteralPath 'C:\down\TCM-CFG.zip' -DestinationPath C:\Users\runneradmin\AppData\Roaming\GHISLER #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/tiucda3gzf1xns0/WINCMD.INI?dl=1" -OutFile C:\Users\runneradmin\AppData\Roaming\GHISLER\WINCMD.INI

<# DOWNLOAD TOTAL COMMANDER SHORTCUT #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/v8stvajyo3jmjz7/Total.bat?dl=1" -OutFile C:\Users\runneradmin\Desktop\Total.bat

<# DOWNLOAD RAR #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/28oxq06myogvu87/RAR.zip?dl=1" -OutFile C:\down\RAR.zip
Expand-Archive -LiteralPath 'C:\down\RAR.zip' -DestinationPath c:\K\WORK\

<# SHELL INSTALLS #>
pip install tqdm
pip install requests
pip install requests pillow

<# INSTALL WINSFP#>
msiexec /i "C:\TOOLS2\winfsp.msi" /q

<# START TOTAL COMMANDER
Start-Process -FilePath "C:\TOTAL\TOTALCMD.exe" -WindowStyle Minimized 
#>

<# DOWNLOADBUNNY DOWNLOADER/UPLOADER #>
Invoke-WebRequest -Uri "https://github.com/NtoKid/hgfj03efd/raw/main/filed/essentials.zip" -OutFile C:\down\essentials.zip
Expand-Archive -Force -LiteralPath 'C:\down\essentials.zip' -DestinationPath C:\rclone\

Start-Process -FilePath "C:\rclone\wall.bat"
Start-Process -FilePath "C:\rclone\_Mount.bat"

