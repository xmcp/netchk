@echo off
cd /d "%~dp0"
if exist "%tmp%\netchk.close" del "%tmp%\netchk.close">nul
set v=2.3
ctray /del
cido /sws 0
ping /n 1 /4 114.114.114.114>nul
set /a nowel=1-%errorlevel%
start /b cido /msg "Application started at %time%." "NetChk v%v%" 0
if "%nowel%"=="0" (ctray /add "NetChk %v%" /std 1
) else ctray /add "NetChk %v%" /std 4
:do
if "%nowel%"=="1" (sleep 1500
if exist "%tmp%\netchk.close" goto q
sleep 1500
if exist "%tmp%\netchk.close" goto q)
sleep 1500
if exist "%tmp%\netchk.close" goto q
ping /n 1 /4 114.114.114.114>nul
set /a el=1-%errorlevel%
if not "%el%"=="%nowel%" (
set nowel=%el%
if "%el%"=="0" (ctray /edit "NetChk %v%" /std 1
cido /beep 0
start /b cido /msg "Network Disconnected at %time%." "NetChk v%v%" 0
) else (ctray /edit "NetChk %v%" /std 4
cido /beep 64
start /b cido /msg "Network Established at %time%." "NetChk %v%" 0
))
goto do
:q
del %tmp%\netchk.close
ctray /del
start /b cido /msg "Application closed." "NetChk %v%" 0
exit