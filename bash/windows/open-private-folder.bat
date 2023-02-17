@echo off
cls
color 0a

set dir=%~d0\private-folder
attrib +s +a +h +r %dir%

:input
set /p pwd=login as: 
for /f %%i in ('md5 -d%pwd%') do (set epwd=%%i)
if "%epwd%"=="1CE07818A02C5911C0A5A4A9022D9CE5" (goto login) else (goto input)
pause

:login
attrib -s -a -h -r %dir%
start %dir%
goto logout

:logout
set /p yn=Do you want to logout (y/n): 
if "%yn%"=="y" attrib +s +a +h +r %dir%
exit
