#!/bin/sh

# Exit on error
set -e 

# Activate venv
. bin/activate

# Run flask app
python3 app.py
