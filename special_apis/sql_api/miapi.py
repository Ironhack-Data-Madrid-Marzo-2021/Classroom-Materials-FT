
from flask import Flask, request
from flask import jsonify
import json
import markdown.extensions.fenced_code
import tools.getdata as get
import tools.postdata as pos




app = Flask(__name__)


@app.route("/")
def index():
    readme_file = open("Readme.md", "r")
    md_template = markdown.markdown( 
        readme_file.read(), extensions=["fenced_code"]
    )
    return md_template



@app.route("/frases/<name>")
def frasespersonaje(name):
    frases = get.mensajespersonaje(name)
    return jsonify(frases)


@app.route("/nuevafrase", methods=["POST"])
def insertamensaje():
    escena = request.form.get("scene")
    personaje = request.form.get("character_name")
    frase = request.form.get("dialogue")
    pos.insertamensaje(escena, personaje, frase)
    return "Se ha introducido el mensaje en la base de datos"







app.run("0.0.0.0", 5000, debug=True)