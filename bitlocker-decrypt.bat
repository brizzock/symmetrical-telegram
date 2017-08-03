@echo off
Setlocal
Set current=%~dp0

rem https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde-off#BKMK_Examples
rem run script as admin. Decrypts the drive and turns off BitLocker. All key protectors are removed when decryption is complete. 

TITLE Disable-Bitlocker

gpupdate /force
manage-bde c: -off

echo %errorlevel% >> %current%disable-bitlocker.log

if %errorlevel% NEQ 0 goto end

:end
exit %errorlevel%

