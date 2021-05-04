from config.configuration import collection


def insertamensaje(escena,personaje,frase):
    dict_insert = {"scene": escena,
    "character_name": personaje,
    "dialogue": frase 
    }
    collection.insert_one(dict_insert)
    
