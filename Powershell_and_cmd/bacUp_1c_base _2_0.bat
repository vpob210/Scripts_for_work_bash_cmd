@echo off
REM узнаем дату
setlocal enabledelayedexpansion
set "datestamp=%date:/=.%"

REM завершаем 1с если есть
taskkill /t /f /fi "IMAGENAME eq 1cv8c.exe"
timeout /t 180

REM копируем во временную папку
xcopy D:\Base0 "\\< IP >\share\1c\Base backup\Base0Backup\%datestamp%" /s /e /i
xcopy D:\Base3 "\\< IP >\share\1c\Base backup\Base3Backup\%datestamp%" /s /e /i