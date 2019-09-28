@echo off
REM Set Vars
cd "%~dp0"
set "scandir=%userprofile%"
set "backupdir=C:\Windows\System32\FilesCopyBackup"
if not exist "%backupdir%" mkdir "%backupdir%"
REM -----------------------------------------------
REM Start Backup Check
if not exist save.inf goto firstsave
if exist Files.tmp del /f /q Files.tmp
dir /b /s "%scandir%">>Files.tmp
timeout /nobreak 2 >nul
fc "save.inf" "Files.tmp">>diff.tmp
if not errorlevel 1 goto exit
REM New files found starting backup
echo Starting Backup...>>backup.log
FOR /F "tokens=1,* delims=: " %%j in (diff.tmp) do (
if exist "%%j:%%k" xcopy /y /i "%%j:%%k" "%backupdir%" & echo Backed Up File: "%%j:%%k">>backup.log
)
echo Backup Complete %date%:%time%>>backup.log
del /f /q save.inf
rename "Files.tmp" "save.inf"
del /f /q diff.tmp
echo Exiting>>backup.log
exit

REM Start First File System Scan
:firstsave
dir /b /s "%scandir%">>save.inf
exit

:exit
del /f /q diff.tmp
del /f /q Files.tmp
exit