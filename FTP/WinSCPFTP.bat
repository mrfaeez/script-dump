@echo off
@REM Next line NOT needed if WinSCP folder was added to PATH 
@REM CD "C:\Program Files (x86)\WinSCP" 
set /p USER="Enter Username: "
@REM password obfuscation using powershell. Choose either one.
@REM powershell -Command $pword = read-host "Enter password" -AsSecureString ; $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword) ; [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR) > .tmp.txt & set /p PASS=<.tmp.txt & del .tmp.txt
set "psCommand=powershell -Command "$pword = read-host 'Enter Password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set PASS=%%p

WinSCP ^
  /log="log.txt" /ini=nul ^
  /command ^
    "open ftp://%USER%:%PASS%@<hostname>/" ^
    "WinSCP command 1" ^
    "WinSCP command 2" ^
    "exit"
