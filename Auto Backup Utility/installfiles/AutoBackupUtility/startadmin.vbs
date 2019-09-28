set shell=CreateObject("Shell.Application")
shell.ShellExecute "ABU.bat",,"C:\Windows\AutoBackupUtility", "runas", 0 
set shell=nothing