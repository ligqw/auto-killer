@echo off
chcp 65001 > nul
title Universal System Optimization

:: Check for Administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Please run this script as an ADMINISTRATOR!
    pause
    exit /b
)

echo =======================================================
echo  Running universal configuration optimization...
echo =======================================================

echo [1/6] Creating a System Restore Point...
:: Start VSS service, enable protection, and create a restore point
net start vss > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f > nul 2>&1
powershell -NoProfile -Command "Enable-ComputerRestore -Drive 'C:\'; Checkpoint-Computer -Description 'BeforeOptimization' -RestorePointType 'MODIFY_SETTINGS'" > nul 2>&1

echo [2/6] Cleaning up temporary files and cache...
del /f /q /s "%TEMP%\*" > nul 2>&1
for /f "delims=" %%p in ('dir /ad /b "%TEMP%"') do rmdir /s /q "%TEMP%\%%p" > nul 2>&1
del /f /q /s "%SystemRoot%\Temp\*" > nul 2>&1
for /f "delims=" %%p in ('dir /ad /b "%SystemRoot%\Temp"') do rmdir /s /q "%SystemRoot%\Temp\%%p" > nul 2>&1

net stop wuauserv > nul 2>&1
net stop bits > nul 2>&1
timeout /t 3 /nobreak > nul
del /f /q /s "%SystemRoot%\SoftwareDistribution\Download\*" > nul 2>&1
net start bits > nul 2>&1
net start wuauserv > nul 2>&1

echo [3/6] Safely flushing DNS cache...
ipconfig /flushdns > nul 2>&1

echo [4/6] Optimizing power plan and CPU cores (Desktop only)...
:: Reliable battery check (if the output string is empty, it is a desktop PC)
wmic path win32_battery get Caption 2>nul | findstr /r /c:"[a-zA-Z0-9]" > nul 2>&1
if %errorLevel% neq 0 (
    :: This is a Desktop PC — enabling High Performance and core unparking
    powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c > nul 2>&1
    powercfg /attributes 54533251-82bd-4e29-950d-4136c166a751 0cc5b647-c36e-417e-ba9d-d17442bc94de -ATTRIB_HIDE > nul 2>&1
    powercfg /setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82bd-4e29-950d-4136c166a751 0cc5b647-c36e-417e-ba9d-d17442bc94de 0 > nul 2>&1
    powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c > nul 2>&1
)

echo [5/6] Disabling telemetry and game overlay...
sc config DiagTrack start= disabled > nul 2>&1
net stop DiagTrack > nul 2>&1

:: Disabling GameDVR and GameConfigStore (corrected registry paths)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d 0 /f > nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f > nul 2>&1

:: GPU Telemetry (NVIDIA & AMD)
sc config NvTelemetryContainer start= disabled > nul 2>&1
net stop NvTelemetryContainer > nul 2>&1
sc config AMDCrashDefenderService start= disabled > nul 2>&1
net stop AMDCrashDefenderService > nul 2>&1

echo [6/6] Optimizing RAM and frozen processes...
taskkill /f /fi "status eq not responding" > nul 2>&1
powershell -NoProfile -Command "$code = '[DllImport(\"psapi.dll\")] public static extern bool EmptyWorkingSet(IntPtr hProcess);'; $type = Add-Type -MemberDefinition $code -Name 'MemClean' -Namespace 'Win32' -PassThru; Get-Process | ForEach-Object { try { $type::EmptyWorkingSet($_.Handle) } catch {} }" > nul 2>&1

echo =======================================================
echo  Optimization successfully completed!
echo  It is recommended to restart your computer.
echo =======================================================
pause
exit /b
