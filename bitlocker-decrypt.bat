@echo off
Setlocal
Set current=%~dp0

rem https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/manage-bde-off#BKMK_Examples
rem run script as admin. Decrypts the drive and turns off BitLocker. All key protectors are removed when decryption is complete. 

TITLE Disable-Bitlocker


manage-bde –off C: >> current%disable-bitlocker.log


echo %errorlevel% >> %current%disable-bitlocker.log
exit %errorlevel%
