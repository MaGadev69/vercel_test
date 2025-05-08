FROM python:3.11-slim

# Evita buffering en logs
ENV PYTHONUNBUFFERED=1

# Instala dependencias del sistema si hace falta
RUN apt-get update && apt-get install -y curl

# Instala Reflex
RUN pip install reflex

# Copia solo la carpeta exportada por Reflex
COPY .web /app

# Exporta (build) en producción
RUN reflex export --env prod


# Corre el backend + frontend
CMD ["reflex", "run", "--env", "prod"]
