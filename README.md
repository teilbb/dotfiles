
```bat
@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
start "" "C:\Program Files (x86)\ChinaNetYX\bin\Dialterminal.exe"
set var=0
:continue
set /a var+=1
ping -n 1 -w 100 www.baidu.com >nul 2>nul&&goto ok||goto nook
:ok
taskkill /f /t /im Dialterminal.exe
goto end
:nook
if %var% lss 100 goto continue
:end
```
