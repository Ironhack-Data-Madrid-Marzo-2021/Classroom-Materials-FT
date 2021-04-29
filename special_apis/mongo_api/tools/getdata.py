from config.configuration import db, collection


def mensajespersonaje():
    """
    Función que devuelve todas las frases de Dumbledore :)
    """
    query = {"character_name": "Albus Dumbledore"}
    frases = list(collection.find(query,{"_id": 0}))
    return frases