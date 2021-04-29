from flask import Flask, request
import tools.datos as dat
from  tools.paraeldado import funciondado




app = Flask(__name__)

@app.route("/")
def index():
    return "Hola mundo"


@app.route("/fer")
def datos():
    fer = dat.datosFer()
    return fer


@app.route("/ana")
def datos2():
    ana = dat.datosAna()
    return ana


@app.route("/tiraeldado")
def dado():
    return funciondado()








app.run("0.0.0.0",5000, debug=True)
 