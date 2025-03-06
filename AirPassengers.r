# Cargar librerías necesarias
library(tseries)  # Para prueba de estacionariedad
library(ggplot2)  # Para visualización
library(forecast) # Para análisis de series temporales

# 1. Carga del dataset
data("AirPassengers")

# Inspeccionar la estructura del dataset
print(class(AirPassengers))   # Verifica que es una serie temporal (ts)
print(summary(AirPassengers)) # Resumen estadístico
print(start(AirPassengers))   # Inicio de la serie
print(end(AirPassengers))     # Fin de la serie
print(frequency(AirPassengers)) # Frecuencia: 12 (mensual)

# 2. Exploración inicial
# Gráfico de la serie temporal
plot(AirPassengers, main="Número de Pasajeros Aéreos (1949-1960)", ylab="Pasajeros (en miles)", xlab="Año", col="blue")

# Cálculo de estadísticas descriptivas
mean_val <- mean(AirPassengers)
sd_val <- sd(AirPassengers)
cat("Media:", mean_val, "\nDesviación estándar:", sd_val, "\n")

# 3. Análisis de tendencia y estacionalidad
# Descomposición de la serie temporal
decomposed <- decompose(AirPassengers)
plot(decomposed)

# 4. Análisis de estacionariedad
# Gráficos ACF y PACF
acf(AirPassengers, main="Autocorrelación (ACF)")
pacf(AirPassengers, main="Autocorrelación Parcial (PACF)")

# Prueba de Dickey-Fuller Aumentada
adf_result <- adf.test(AirPassengers)
print(adf_result)

# Si la serie no es estacionaria, aplicar diferenciación
diff_series <- diff(AirPassengers)
plot(diff_series, main="Serie diferenciada de AirPassengers")

# Verificar nuevamente la estacionariedad
adf_result_diff <- adf.test(diff_series)
print(adf_result_diff)

# 5. Detección de valores atípicos
boxplot(AirPassengers, main="Boxplot de AirPassengers", ylab="Número de pasajeros")

# 6. Interpretación de resultados
cat("La serie muestra una clara tendencia creciente y un patrón estacional.\n")
cat("El análisis de ACF/PACF indica la necesidad de diferenciación para hacerla estacionaria.\n")