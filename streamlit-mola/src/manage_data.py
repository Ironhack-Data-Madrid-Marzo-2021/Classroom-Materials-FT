import pandas as pd

def carga_data():
    data = pd.read_csv("data/clean.csv")
    return data


def grafico_barras_st():
    data = carga_data()
    data = data.groupby("character_name").agg({"character_name":'count'}).rename(columns={"character_name":"character_name", "character_name":"número de frases"}).reset_index().set_index("character_name", drop=True)
    return data


def lista_personajes():
    data = carga_data()
    return list(data.character_name.unique())


def grafico(personaje):
    data = carga_data()
    data = data[(data["character_name"]== f"{personaje}")]
    return data

def bar_2():
    data = carga_data()
    data = data.groupby("character_name").agg({'polarity': 'mean'}).reset_index().set_index("character_name", drop=True)
    return data
