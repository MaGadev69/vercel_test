FROM python:3.11

# Evita buffering en logs
ENV PYTHONUNBUFFERED=1

# Instala dependencias del sistema si hace falta
RUN apt-get update && apt-get install -y curl

# Instala Reflex
RUN pip install reflex

# Copia tu app
WORKDIR /app
COPY . /app

# Exporta (build) en producción
RUN reflex export --env production

# Corre el backend + frontend
CMD ["reflex", "run", "--env", "production"]
