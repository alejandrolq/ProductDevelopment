# Clase streamlit

**Nombre: José Alejandro López Quel**

**Carné: 21001127**

**Product Development**

**Sección U**

A continuación se muestran los archivos de la clase de streamlit. Los cuales estan divididos en:

- first_app: Contiene todos los comandos utilizados para la creación de la primera app de streamlit. - [first_app.py](https://github.com/alejandrolq/ProductDevelopment/blob/main/streamlit/first_app.py "First Streamlit App")
- uber_pickups: Contiene la app desarrollada para mostrar los datos de los pickups de Uber. - [uber_pickups.py](https://github.com/alejandrolq/ProductDevelopment/blob/main/streamlit/uber_pickups.py "Uber Pickups App")

Se incluyen los cambios en el archivo uber_pickups:
- Ordenar por fecha: `.sort_values(by='date_time')`
- Crear un histograma para las horas del día: 
`hist_values = np.histogram(data.date_time.dt.hour, bins=24, range=(0,24))[0]`
`st.bar_chart(hist_values)`
