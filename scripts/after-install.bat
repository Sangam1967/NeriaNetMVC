icacls "C:\inetpub\wwwroot\NeriaNetMVC" /grant "IIS AppPool\DefaultAppPool":(OI)(CI)RX
SET appcmd=CALL %WINDIR%\system32\inetsrv\appcmd.exe
%appcmd% list site /name:"Default Web Site"
IF "%ERRORLEVEL%" EQU "0" (
    %appcmd% delete site "Default Web Site"
    %appcmd% add site /name:NeriaNetMVC /bindings:http://*:80 /physicalpath:"C:\inetpub\wwwroot\NeriaNetMVC"
)
