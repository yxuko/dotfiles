@echo off
set ICON=%LocalAppData%\terminus\Terminus.exe
set LABEL=Open terminal here
set COMMAND=%LocalAppData%\terminus\Terminus.exe \"%%V\"
set SLUG=Terminal

reg delete "HKCU\Software\Classes\Directory\Background\shell\%SLUG%" /f
reg delete "HKCU\Software\Classes\Directory\shell\%SLUG%" /f
reg delete "HKCU\Software\Classes\Drive\shell\%SLUG%" /f
reg delete "HKCU\Software\Classes\LibraryFolder\Background\shell\%SLUG%" /f

reg add "HKCU\Software\Classes\Directory\Background\shell\%SLUG%" /f /ve /t REG_SZ /d "%LABEL%"
reg add "HKCU\Software\Classes\Directory\Background\shell\%SLUG%" /f /v "Extended" 
reg add "HKCU\Software\Classes\Directory\Background\shell\%SLUG%" /f /v "Icon" /t REG_SZ /d "%ICON%"
reg add "HKCU\Software\Classes\Directory\Background\shell\%SLUG%\command" /f /ve /t REG_SZ /d "%COMMAND%"
reg add "HKCU\Software\Classes\Directory\shell\%SLUG%" /f /ve /t REG_SZ /d "%LABEL%"
reg add "HKCU\Software\Classes\Directory\shell\%SLUG%" /f /v "Extended" 
reg add "HKCU\Software\Classes\Directory\shell\%SLUG%" /f /v "Icon" /t REG_SZ /d "%ICON%"
reg add "HKCU\Software\Classes\Directory\shell\%SLUG%\command" /f /ve /t REG_SZ /d "%COMMAND%"
reg add "HKCU\Software\Classes\Drive\shell\%SLUG%" /f /ve /t REG_SZ /d "%LABEL%"
reg add "HKCU\Software\Classes\Drive\shell\%SLUG%" /f /v "Extended" 
reg add "HKCU\Software\Classes\Drive\shell\%SLUG%" /f /v "Icon" /t REG_SZ /d "%ICON%"
reg add "HKCU\Software\Classes\Drive\shell\%SLUG%\command" /f /ve /t REG_SZ /d "%COMMAND%"

Files
Ordinateur\HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shell\Open with Sublime Text\command
Ordinateur\HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shell\VSCode

Dir
