FROM python:3.11-slim

# Evita buffering en logs
ENV PYTHONUNBUFFERED=1

# Instala dependencias necesarias
RUN apt-get update && apt-get install -y curl unzip

# Instala bun
RUN curl -fsSL https://bun.sh/install | bash

# Agrega bun al PATH
ENV PATH="/root/.bun/bin:$PATH"

# Instala Reflex
RUN pip install reflex

# Establece el directorio de trabajo
WORKDIR /app

# Copia todos los archivos del proyecto
COPY . .

# Exporta el frontend (build para producción)
RUN reflex export --env prod

# Corre el servidor Reflex
CMD ["reflex", "run", "--env", "prod"]

