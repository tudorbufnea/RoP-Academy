@echo off
title ROP Trading Academy - Server Local
echo.
echo  ╔══════════════════════════════════════╗
echo  ║     ROP TRADING ACADEMY              ║
echo  ║     Pornire server local...          ║
echo  ╚══════════════════════════════════════╝
echo.

:: Detecteaza Python
python --version >nul 2>&1
if %errorlevel% == 0 (
    set PYTHON=python
    goto :found_python
)
python3 --version >nul 2>&1
if %errorlevel% == 0 (
    set PYTHON=python3
    goto :found_python
)
echo  [EROARE] Python nu este instalat.
echo  Descarca de la: https://www.python.org/downloads/
echo  Bifeaza "Add Python to PATH" la instalare.
echo.
pause
exit /b 1

:found_python
echo  Python detectat. Pornesc serverul pe http://localhost:8765
echo.
echo  Aplicatia se va deschide automat in browser.
echo  Nu inchide aceasta fereastra cat timp folosesti aplicatia.
echo.

:: Schimba directorul la locatia scriptului
cd /d "%~dp0"

:: Deschide browserul dupa 1.5 secunde
start "" /b cmd /c "timeout /t 2 /nobreak >nul && start http://localhost:8765/ROP-Trading-Academy.html"

:: Porneste serverul (blocheaza fereastra)
%PYTHON% -m http.server 8765

echo.
echo  Serverul s-a oprit.
pause
