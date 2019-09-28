@echo off
del /f /q ABU.bat
del /f /q startadmin.vbs
start "" "cmd /r rd /s /q "C:\Windows\AutoBackupUtility""
exit