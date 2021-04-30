from config.configuration import engine


def insertamensaje(escena,personaje,frase):
    engine.execute(f"""
    INSERT INTO frases (scene,character_name,dialogue) VALUES
    ({escena},'{personaje}','{frase}');
    """
    )