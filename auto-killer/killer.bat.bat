@echo off
chcp 65001 > nul
echo Ожидание зависших процессов...

:loop
:: Поиск и принудительное закрытие всех зависших процессов
taskkill /f /fi "status eq not responding"

:: Ожидание 60 секунд (1 минута) перед следующей проверкой
timeout /t 60 /nobreak > nul

goto loop
