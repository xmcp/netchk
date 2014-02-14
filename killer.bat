@echo off
set v=1.1
cd /d "%~dp0"
title NetChk killer v%v%
if "%1"=="tray" goto tray
mode con cols=45 lines=5
echo  Killer v%v% - Support NetChk 2.0 to 2.4
echo  -------------------------------------------
echo  NetChk will close in a few seconds ...
echo.>"%tmp%\netchk.close"
sleep 50
start /b "" "%~0" tray
:t
if exist "%tmp%\netchk.close" goto t
echo  NetChk was closed successfully.
exit
:tray
sleep 1750
if exist "%tmp%\netchk.close" (
echo  Still running? Press any key to kill it.
pause>nul
start /b cido /msg "Application killed." "NetChk Killer" 0
taskkill /f /im cmd.exe>nul 2>nul)
exit