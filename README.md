# -DA-project-consultas-SQL_JOAQUINMF
Repo para el ejercicio consultas_SQL

# Proyecto de Limpieza y Procesamiento de Datos — Base de Datos Sakila

Este proyecto consiste en la extracción, limpieza preliminar (SQL) y procesamiento final (Python) de datos provenientes de la base de datos **Sakila**.  
El objetivo es construir tres dataframes mediante consultas SQL, seleccionar uno para aplicar limpieza exhaustiva y luego procesarlo en un notebook de Google Colab.

---

# 📁 Estructura del Proyecto

/sql/
sakila-schema.sql
sakila-data.sql
extraction_dataframes.sql
cleaning_dataframe1.sql

/notebook/
limpieza_final.ipynb

/data/
df_clientes_limpio.csv
df_cliente_final.csv

---


---

# 🗃️ Dataframes Generados desde SQL

Se generaron tres dataframes mediante joins entre tablas de la base de datos Sakila:

### **1. Actividad de clientes**  
Tablas: `customer`, `address`, `city`, `country`, `rental`, `payment`  
Objetivo: Describir el comportamiento de alquileres y pagos por cliente.

### **2. Catálogo de películas**  
Tablas: `film`, `film_category`, `category`, `language`, `inventory`  
Objetivo: Crear una vista del catálogo con categorías, idioma y disponibilidad.

### **3. Elenco y popularidad**  
Tablas: `film`, `actor`, `film_actor`  
Objetivo: Analizar actores por película y frecuencia de aparición.

El dataframe **seleccionado para limpieza completa** fue:

👉 **Dataframe 1 — Actividad de clientes**

---

# 🧩 1. Pasos SQL del Proyecto

## ✔ Instalación de la base de datos Sakila
1. Importar `sakila-schema.sql` en el servidor MySQL  
2. Importar `sakila-data.sql`  
3. Confirmar que las tablas fueron creadas correctamente

## ✔ Extracción de los tres dataframes  
Las consultas fueron incluidas en `extraction_dataframes.sql`.  
Se utilizaron **joins basados en claves primarias y foráneas** para garantizar integridad.

## ✔ Limpieza SQL del Dataframe seleccionado  
En el archivo `cleaning_dataframe1.sql` se realizó:

- Estandarización de texto con `LOWER()` y `TRIM()`
- Eliminación de alquileres sin pago o sin devolución
- Filtrado de montos de pago positivos
- Eliminación de registros con `payment_id` o `rental_id` nulos
- Validación de consistencia temporal (`rental_date < return_date`)
- Creación de la columna derivada `rental_duration` con `DATEDIFF()`

## ✔ Exportación del DataFrame limpio  
El resultado final fue exportado como `df_clientes_limpio.csv` desde MySQL Workbench.

---

# 🧹 2. Criterios de Limpieza Aplicados

La limpieza se realizó en dos etapas: **SQL** (preliminar) y **Python** (final).

## 🗄️ Limpieza en SQL
- Conversión a minúsculas y eliminación de espacios en campos de texto  
- Eliminación de registros con datos clave faltantes  
- Validación de integridad referencial  
- Filtrado de pagos inválidos (`amount > 0`)  
- Filtrado de alquileres completados (`return_date IS NOT NULL`)

## 🐍 Limpieza en Python
- Conversión de columnas de fecha a formato datetime  
- Normalización de cadenas: `lower()`, `strip()`  
- Conversión de tipos numéricos (float, int)  
- Detección y eliminación de duplicados  
- Revisión de valores faltantes y documentación de decisiones  
- Detección y eliminación de *outliers* simples por Z-score  
- Creación de columnas derivadas («payment_month», «customer_full_name»)  
- Visualización para revisar distribuciones  
- Exportación final del dataset en CSV y Parquet  

---

# 🧪 3. Instrucciones para Ejecutar el Notebook

1. Abrir **Google Colab**
2. Cargar el archivo `df_clientes_limpio.csv`  
   - O bien montar Google Drive
3. Ejecutar todas las celdas del notebook en orden:
   - **Carga del dataset**
   - **Conversión de fechas**
   - **Normalización y limpieza**
   - **Detección de outliers**
   - **Columnas derivadas**
   - **Visualizaciones**
4. Confirmar que la última celda exporta los archivos:
   - `df_cliente_final.csv`
   - `df_cliente_final.parquet`

El notebook incluye comentarios explicando cada etapa.

---

# 🧠 4. Descripción de Decisiones Tomadas

Durante el proyecto se tomaron decisiones basadas en criterios de calidad de datos y consistencia:

### ✔ Elección del dataframe para limpieza completa  
Se seleccionó el **Dataframe 1** debido a su complejidad y utilidad analítica (actividad y pagos de clientes).

### ✔ Estandarización de cadenas  
Se decidió normalizar todo en minúsculas para evitar problemas de duplicación y comparaciones inconsistentes.

### ✔ Exclusión de registros incompletos  
Se excluyeron alquileres sin devolución y pagos sin monto válido, ya que estos no reflejan actividad real del cliente.

### ✔ Corrección de fechas  
Se impuso la regla `rental_date < return_date` para eliminar registros corruptos.

### ✔ Eliminación de outliers en Python  
Se utilizó Z-score simple en «amount» para detectar valores atípicos y mejorar la distribución del dataset.

### ✔ Generación de columnas derivadas  
Se añadieron atributos útiles como:
- `rental_duration` (SQL)
- `payment_month` (Python)
- `customer_full_name` (Python)

Estas columnas facilitan futuros análisis temporales y de comportamiento.

---

# 🎯 Conclusión

El proyecto permite:

- Comprender la estructura de Sakila  
- Practicar joins complejos  
- Aplicar limpieza en SQL y Python de forma combinada  
- Documentar un flujo reproducible  
- Obtener un dataset final apto para análisis posteriores  
