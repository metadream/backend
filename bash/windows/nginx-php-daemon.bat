@echo off

echo Starting PHP FastCGI...
%~dp0/RunHiddenConsole %cd%/php-7.3.1/php-cgi.exe -b 127.0.0.1:9000 -c %cd%/php-7.3.1/php.ini
%~dp0/RunHiddenConsole %cd%/php-7.3.1/php-cgi.exe -b 127.0.0.1:9001 -c %cd%/php-7.3.1/php.ini

echo Starting Nginx...
%~dp0/RunHiddenConsole %cd%/nginx-1.10.3/nginx.exe -p %cd%/nginx-1.10.3

echo Stopping nginx...
taskkill /F /IM nginx.exe > nul

echo Stopping PHP FastCGI...
taskkill /F /IM php-cgi.exe > nul

exit