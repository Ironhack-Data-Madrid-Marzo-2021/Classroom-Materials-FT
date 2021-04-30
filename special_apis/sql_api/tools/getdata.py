from config.configuration import engine
import pandas as pd

def mensajespersonaje(nombre):
    query = f"""
    SELECT character_name, dialogue
    FROM frases
    WHERE character_name = "{nombre}"
    """
    #Investigad que se puede renderizar un dataframe con flask
    
    data = pd.read_sql_query(query,engine)
    return data.to_json(orient="records")