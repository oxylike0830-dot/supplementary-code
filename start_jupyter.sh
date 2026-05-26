#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if [ ! -x ".venv/bin/python" ]; then
    echo "Creating local Python environment..."
    python3.11 -m venv .venv
fi

echo "Installing required packages..."
".venv/bin/python" -m pip install --upgrade pip
".venv/bin/python" -m pip install -r requirements.txt

echo "Starting JupyterLab..."
".venv/bin/python" -m jupyter lab
