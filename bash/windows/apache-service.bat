@echo off

:: Install apache as a service
@%cd%\apache-2.4.4\bin\httpd.exe -k install -n apache-2.4.4

:: Start apache service
@net start apache-2.4.4

:: Stop apache service
@net stop apache-2.4.4

:: Uninstall apache service
@%cd%\apache-2.4.4\bin\httpd.exe -k uninstall -n apache-2.4.4

pause