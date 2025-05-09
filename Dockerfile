FROM python:3.11-slim

# Evita buffering en logs
ENV PYTHONUNBUFFERED=1

# Instala dependencias del sistema
RUN apt-get update && apt-get install -y curl git build-essential

# Instala Reflex
RUN pip install reflex

# Crea directorio de trabajo
WORKDIR /app

# Copia todo el proyecto
COPY . /app

# Exporta en producción
RUN reflex export --env prod

# Expone el puerto por defecto de Reflex (puede cambiar según tu config)
EXPOSE 3000

# Comando para correr la app
CMD ["reflex", "run", "--env", "prod"]

