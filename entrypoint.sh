#!/bin/sh

set -e 
pwd
echo '---------------------'
ls
. ./bin/activate
echo '------------------ > > > '
pip -V # TODO: delete it
export PATH="/usr/src/app/bin:$PATH"
echo '-----------> after export'
pip -V
python3 app.py
