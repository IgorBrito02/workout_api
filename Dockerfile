# Usa uma imagem base oficial do Python
FROM python:3.12-slim

# Instala as dependências de build necessárias para pacotes como o asyncpg
RUN apt-get update && apt-get install -y build-essential \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de requisitos e instala as dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação
COPY . .