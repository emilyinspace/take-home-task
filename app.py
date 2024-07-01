#!/usr/bin/env python3

# Displays interesting Chuck Norris jokes from API[https://api.chucknorris.io/]

import requests
import os
from flask import Flask, render_template, abort, url_for
import json
import html

import json

base_url = "https://api.chucknorris.io/jokes/random"

resp = requests.get(url = base_url)
resp_dumped = json.dumps(resp.json())

app = Flask(__name__, template_folder="templates")

@app.route("/")
def index():
    return render_template('index.html', title="page", jsonfile=json.dumps(resp.json()))

if __name__ == '__main__':
    # Listen to all addresses, as we run this app inside a container.
    # Hence, listening on localhost would not suffice.
    app.run(host='0.0.0.0', debug=True)

    
