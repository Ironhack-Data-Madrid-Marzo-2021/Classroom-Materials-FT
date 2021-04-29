from flask import Flask, request
import tools.getdata as get
import json
import markdown.extensions.fenced_code

app = Flask(__name__)


@app.route("/")
def index():
    readme_file = open("Readme.md", "r")
    md_template = markdown.markdown( 
        readme_file.read(), extensions=["fenced_code"]
    )
    return md_template


@app.route("/frases")
def frases():
    frases = get.mensajespersonaje()
    return json.dumps(frases)



















app.run("0.0.0.0", 5000, debug=True)