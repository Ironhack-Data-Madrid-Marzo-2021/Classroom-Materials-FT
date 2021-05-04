from config.configuration import db, collection


def mensajes():
    """
    Función que devuelve todas las frases de Dumbledore :)
    """
    query = {"character_name": "Albus Dumbledore"}
    frases = list(collection.find(query,{"_id": 0}))
    return frases



def mensajespersonaje(personaje):
    """
    Función que devuelve todas las frases un personaje
    """
    query = {"character_name": f"{personaje}"}
    frases = list(collection.find(query,{"_id": 0}))
    return frases

