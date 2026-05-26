@echo off
setlocal

cd /d "%~dp0"

if not exist ".venv\Scripts\python.exe" (
    echo Creating local Python environment...
    py -3.11 -m venv .venv
    if errorlevel 1 (
        echo Python 3.11 was not found. Install Python 3.11.10, then run this file again.
        pause
        exit /b 1
    )
)

echo Installing required packages...
".venv\Scripts\python.exe" -m pip install --upgrade pip
".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 (
    echo Package installation failed. Check the error above.
    pause
    exit /b 1
)

echo Starting JupyterLab...
".venv\Scripts\python.exe" -m jupyter lab
