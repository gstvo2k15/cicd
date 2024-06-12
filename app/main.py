"""
This module contains the main application.
"""

from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello():
    """Return a friendly HTTP greeting."""
    return "Hello, World!"


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
