@echo off
Setlocal
Set current=%~dp0

rem https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde-off#BKMK_Examples
rem run script as admin. Decrypts the drive and turns off BitLocker. All key protectors are removed when decryption is complete. 

TITLE Disable-Bitlocker


manage-bde c: -off

echo %errorlevel% >> %current%disable-bitlocker.log


if %errorlevel% NEQ 0 goto fail
else goto success


:fail
echo Bitlocker Decrypt command failed. 
echo this script must be run as ADMIN (right-click Run as Administrator) 

echo Bitlocker Decrypt command failed. >> %current%disable-bitlocker.log 
echo this script must be run as ADMIN (right-click Run as Administrator)   >> %current%disable-bitlocker.log

manage-bde -status c: >> %current%disable-bitlocker.log
@echo on
manage-bde -status c:
@echo off

echo press any key to continue...
pause
exit %errorlevel%



:success
echo Bitlocker Decrypt command succesfully sent.
echo Bitlocker Decrypt command succesfully sent.   >> %current%disable-bitlocker.log
manage-bde -status c: >> %current%disable-bitlocker.log

echo press any key to continue...
pause
exit %errorlevel%
