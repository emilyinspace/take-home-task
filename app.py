#!/usr/bin/env python3

# Displays interesting Chuck Norris jokes from API[https://api.chucknorris.io/]

import requests
import os
from flask import Flask, render_template, abort, url_for
import json
import html

import json

# URL path that gives random jokes
base_url = "https://api.chucknorris.io/jokes/random"

"""
TODO: delete
resp = requests.get(url = base_url)
resp_json = resp.json()
resp_dumped = json.dumps(resp.json())

print(resp_json['value'])
"""

# Creating Flask application
app = Flask(__name__, template_folder="templates")

# The root "/" path route is added to the app
@app.route("/")


# Function that is executed on each request
def index():

    # First, execute a GET request on the base URL
    response = requests.get(url = base_url)

    # The json method, returns the response but json-encoded
    resp_json = response.json()

    # Only random joke (value field) is needed from response
    random_joke = resp_json['value'] 

    # Render the HTML template, providing the necessarry variable
    return render_template('index.html', title="page", random_joke=random_joke)


# If script was run directly then
if __name__ == '__main__':
    # Listen to all addresses, as we run this app inside a container.
    # Hence, listening on localhost would not suffice.
    app.run(host='0.0.0.0', debug=True)

    
