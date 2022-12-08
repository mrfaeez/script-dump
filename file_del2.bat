rem This batch file is meant for automatically search certain file and delete it. Please replace <filename> with your desire file name. 

@echo off
setlocal

rem save execution history in log file
set LOGFILE=file_del2.log
call :LOG > %LOGFILE%
exit /B

:LOG

rem change to the D directory
cd /D C:\

echo Checking the files.........
echo:

rem list the files and delete
echo Files Paths :
for /f "delims=" %%i in ('dir /a-d /s /b <filename>.vpn') do echo %%~i && del "%%~i" && echo File Successfully Deleted
endlocal
