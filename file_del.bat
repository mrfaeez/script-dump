rem This batch file is meant for automatically search certain file and delete it. Please replace <filename> with your desire file name. 
rem Refer to the second version for a more comprehensive and faster version

@echo off
setlocal

rem save execution history in log file
set LOGFILE=file_del.log
call :LOG > %LOGFILE%
exit /B

:LOG

rem change to the D directory
@REM cd /D D:\

echo Checking the files.........
echo:
rem find and count files found
dir /b <filename> /s 2> nul | find "" /v /c > %temp%\count
set /p _count=<%temp%\count
rem cleanup
del %temp%\count

rem output the number of files found
echo Files found : %_count%

rem list the files
echo Files Paths :
dir /b <filename> /s
for /f "delims=" %%i in ('dir /a-d /s /b <filename>') do del "%%~i" && echo File Successfully Deleted
endlocal

