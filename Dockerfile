FROM python:3.11-slim

# Evita buffering en logs
ENV PYTHONUNBUFFERED=1

# Instala dependencias necesarias
RUN apt-get update && apt-get install -y curl git && apt-get clean

# Instala Reflex
RUN pip install reflex

# Crea el directorio de trabajo
WORKDIR /app

# Copia el contenido del proyecto
COPY . .

# Exporta (build) la app para producción
RUN reflex export --env prod

# Comando por defecto para correr la app
CMD ["reflex", "run", "--env", "prod"]
