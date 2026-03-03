@echo off
setlocal
echo Chargement du script...
powershell.exe -NoProfile -Command "Get-Content '%~dp0s3-interactive.ps1' -Raw | Invoke-Expression"
pause