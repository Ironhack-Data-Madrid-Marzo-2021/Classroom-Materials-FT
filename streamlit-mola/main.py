import streamlit as st
from PIL import Image
import src.manage_data as dat
import plotly.express as px
import pandas as pd
import folium
from streamlit_folium import folium_static
import codecs
import streamlit.components.v1 as components



imagen = Image.open("images/portada2.jpg")
st.image(imagen)

st.write("""
# Mi súper Dashboard
Con Jake el perro y Finn el humano lo pasaremos guaaaaay
""")

st.dataframe(dat.carga_data())

st.write("""
Gragiquito de barras propio de streamlit
""")


st.dataframe(dat.grafico_barras_st())
datos = dat.grafico_barras_st()
st.bar_chart(datos)

st.write("""
Gráfico de Plotly
""")

personaje = st.selectbox(

    "Selecciona un personaje", dat.lista_personajes()
)

datagraf = dat.grafico(personaje)

fig = px.line(datagraf, y="polarity", title = f"Evolución de la polaridad de {personaje}")

st.plotly_chart(fig)

st.write("""Formulario de texto""")
texto = st.text_input("Lo que tiene que introducir", "Texto por defecto")
st.write("Ha introducido ", texto)


st.write ("""Gestor de archivos""")

uploaded_file = st.file_uploader("Sube un csv")

if uploaded_file: 
    dataframe = pd.read_csv(uploaded_file)
    st.write(dataframe)

foto = st.file_uploader("Sube una foto")
if foto:
    imagen = Image.open(foto)
    imagen.save("data/foto.png")
    st.write ("tu foto se ha subido correctamente")


st.write("Columnas")

datines = dat.bar_2()

col1,col2 = st.beta_columns([4,2])

col1.subheader("El Gráfico")
col1.bar_chart(datines)

col2.subheader("Los datos")
col2.write(datines)


map_1 = folium.Map(location = [45.50935, -73.57225], zoom_start = 15)
folium_static(map_1)


archivo = codecs.open("data/mapa.html", "r")
mapa = archivo.read()
components.html(mapa, height = 550)