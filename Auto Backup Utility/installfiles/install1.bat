@echo off
REM Make install directory
mkdir C:\Windows\AutoBackupUtility
REM Copy program files...
xcopy /y /i "installfiles\*.*" "C:\Windows\AutoBackupUtility"
REM Add startup item
set valinf="Auto Backup Utility Scan"
set reginf="hklm\Software\Microsoft\Windows\CurrentVersion\Run"
reg add %reginf% /v %valinf% /t "REG_SZ" /d "C:\Windows\AutoBackupUtility\startadmin.vbs" /f > nul
REM Done!
exit