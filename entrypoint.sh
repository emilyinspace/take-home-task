#!/bin/sh

set -e 

# Activate venv
. bin/activate

# Run flask app
python3 app.py
