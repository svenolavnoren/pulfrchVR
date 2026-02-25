@echo off
setlocal

REM --- Find where this script lives ---
set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

echo.
echo pulfrichVR launcher
echo --------------------
echo Working directory: %SCRIPT_DIR%
echo.

REM --- If a venv already exists, use it directly ---
if exist "%SCRIPT_DIR%.venv\Scripts\python.exe" (
    set "VENV_PY=%SCRIPT_DIR%.venv\Scripts\python.exe"
    goto run_app
)

REM --- Find a Python interpreter to CREATE the venv ---

set "PYTHON_BOOT="

REM 1) Embedded python\python.exe next to this script (optional)
if exist "%SCRIPT_DIR%python\python.exe" (
    set "PYTHON_BOOT=%SCRIPT_DIR%python\python.exe"
)

REM 2) Prefer the 'py' launcher if available
if "%PYTHON_BOOT%"=="" (
    where py >nul 2>nul
    if not errorlevel 1 (
        set "PYTHON_BOOT=py"
    )
)

REM 3) Fallback: plain 'python' from PATH
if "%PYTHON_BOOT%"=="" (
    where python >nul 2>nul
    if not errorlevel 1 (
        for /f "delims=" %%P in ('where python') do (
            set "PYTHON_BOOT=%%P"
            goto have_boot
        )
    )
)

:have_boot
if "%PYTHON_BOOT%"=="" (
    echo Could not find a Python 3 installation.
    echo.
    echo Please install Python 3.11 or later from:
    echo   https://www.python.org/downloads/windows/
    echo and then run this file again.
    echo.
    pause
    exit /b 1
)

echo Using Python to create venv: %PYTHON_BOOT%
echo.

REM --- Create the virtual environment ---
echo Creating virtual environment in .venv ...
"%PYTHON_BOOT%" -m venv "%SCRIPT_DIR%.venv"
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

:run_app
echo.
echo Starting pulfrichVR ...
echo.
"%SCRIPT_DIR%.venv\Scripts\python.exe" "%SCRIPT_DIR%pulfrichVR.py" %*
endlocal
