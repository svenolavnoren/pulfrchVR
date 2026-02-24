@echo off
setlocal

REM --- Hitta var vi är ---
set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

echo.
echo pulfrichVR launcher
echo --------------------
echo Working directory: %SCRIPT_DIR%
echo.

REM --- Försök hitta Python ---
set "PYTHON_EXE="

REM 1) Om du senare vill packa med embedded Python: .\python\python.exe
if exist "%SCRIPT_DIR%python\python.exe" (
    set "PYTHON_EXE=%SCRIPT_DIR%python\python.exe"
)

REM 2) Annars försök med python i PATH
if "%PYTHON_EXE%"=="" (
    where python >nul 2>nul
    if %errorlevel%==0 (
        for /f "delims=" %%P in ('where python') do (
            set "PYTHON_EXE=%%P"
            goto :have_python
        )
    )
)

REM 3) Om fortfarande inget: ge ett tydligt fel
if "%PYTHON_EXE%"=="" (
    echo Could not find Python on this system.
    echo.
    echo Please install Python 3.11 or later from https://www.python.org/downloads/windows/
    echo and then run this file again.
    echo.
    pause
    exit /b 1
)

:have_python
echo Using Python: %PYTHON_EXE%
echo.

REM --- Skapa venv om den inte finns ---
if not exist "%SCRIPT_DIR%.venv\Scripts\python.exe" (
    echo Creating virtual environment in .venv ...
    "%PYTHON_EXE%" -m venv "%SCRIPT_DIR%.venv"
    if errorlevel 1 (
        echo.
        echo Failed to create virtual environment.
        echo.
        pause
        exit /b 1
    )

    echo.
    echo Installing Python packages (this may take a minute) ...
    "%SCRIPT_DIR%.venv\Scripts\python.exe" -m pip install --upgrade pip
    "%SCRIPT_DIR%.venv\Scripts\python.exe" -m pip install -r "%SCRIPT_DIR%requirements.txt"
    if errorlevel 1 (
        echo.
        echo Failed to install Python packages.
        echo.
        pause
        exit /b 1
    )
)

REM --- Starta appen ---
echo.
echo Starting pulfrichVR ...
echo.
"%SCRIPT_DIR%.venv\Scripts\python.exe" "%SCRIPT_DIR%pulfrichVR_0.9-087.py" %*

endlocal
