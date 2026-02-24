#!/usr/bin/env bash
set -euo pipefail

echo
echo "pulfrichVR launcher (Linux)"
echo "---------------------------"

# --- Hitta skriptets katalog ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Working directory: $SCRIPT_DIR"
echo

# --- Försök hitta Python (föredra python3) ---
PYTHON_EXE=""

if command -v python3 >/dev/null 2>&1; then
    PYTHON_EXE="$(command -v python3)"
elif command -v python >/dev/null 2>&1; then
    PYTHON_EXE="$(command -v python)"
fi

if [[ -z "$PYTHON_EXE" ]]; then
    echo "Could not find Python on this system."
    echo
    echo "Please install Python 3.11 or later (e.g. via your package manager)"
    echo "and then run this script again."
    echo
    exit 1
fi

echo "Using Python: $PYTHON_EXE"
echo

# --- Skapa venv om den inte finns ---
if [[ ! -x "$SCRIPT_DIR/.venv/bin/python" ]]; then
    echo "Creating virtual environment in .venv ..."
    "$PYTHON_EXE" -m venv "$SCRIPT_DIR/.venv"

    echo
    echo "Installing Python packages (this may take a minute) ..."
    "$SCRIPT_DIR/.venv/bin/python" -m pip install --upgrade pip
    "$SCRIPT_DIR/.venv/bin/python" -m pip install -r "$SCRIPT_DIR/requirements.txt"
fi

# --- (valfritt) snabb ffmpeg-koll ---
if ! command -v ffmpeg >/dev/null 2>&1; then
    echo
    echo "Warning: ffmpeg not found in PATH."
    echo "pulfrichVR expects ffmpeg to be installed."
    echo "On Debian/Mint/Ubuntu you can usually run:  sudo apt install ffmpeg"
    echo
    # vi låter ändå programmet starta – get_ffmpeg_cmd() kan hitta lokala binärer
fi

# --- Starta appen ---
echo
echo "Starting pulfrichVR ..."
echo
"$SCRIPT_DIR/.venv/bin/python" "$SCRIPT_DIR/pulfrichVR.py" "$@"
