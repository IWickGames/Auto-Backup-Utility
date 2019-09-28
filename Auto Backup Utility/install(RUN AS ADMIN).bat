@echo off
echo Starting install of Auto Backup Utility
cd "%~dp0"
start "Auto Backup Utility Installer" /wait /MIN "installfiles\install1.bat"
echo Install complete...
pause >nul
exit