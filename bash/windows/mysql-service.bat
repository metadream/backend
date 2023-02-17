@echo off

:: Install mysql as a service
@%cd%\mysql-8.0.19-winx64\bin\mysqld.exe -install mysql-8.0.19

:: Start mysql service
@net start mysql-8.0.19

:: Login mysql
@%cd%\MySQL\bin\mysql -hlocalhost -uroot -pxxxxxx --default-character-set=utf8

:: Import backup to mysql
@%cd%\MySQL\bin\mysql -hlocalhost -uroot -pxxxxxx dbname < backup.sql

:: Stop mysql service
@net stop mysql-8.0.19

:: Uninstall mysql service
@%cd%\mysql-8.0.19-winx64\bin\mysqld.exe --remove mysql-8.0.19

pause