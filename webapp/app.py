#!/usr/bin/env python3
"""
  Web application that returns an html on each request
  with a random chuck norris joke :)
"""

# Displays interesting Chuck Norris jokes from API[https://api.chucknorris.io/]

import requests
from flask import Flask, render_template

# URL path that gives random jokes
BASE_URL = "https://api.chucknorris.io/jokes/random"

# Creating Flask application
app = Flask(__name__, template_folder="templates")

# The root "/" path route is added to the app
@app.route("/")


def index():
    """ 
        Function that is executed on each app request
    """
    # First, execute a GET request on the base URL
    response = requests.get(url = BASE_URL)

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
