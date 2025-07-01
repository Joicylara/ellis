FROM python:3.11-slim
WORKDIR /app

# Etapa 3: Copiar o arquivo de dependências para o diretório de trabalho.
# Isso é feito primeiro para aproveitar o cache de camadas do Docker.
COPY requirements.txt .

# Etapa 4: Instalar as dependências.
# A flag --no-cache-dir reduz o tamanho da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Etapa 5: Copiar o restante do código da aplicação.
COPY . .

# Etapa 6: Expor a porta em que a aplicação será executada.
EXPOSE 8000

# Etapa 7: Definir o comando para executar a aplicação.
# Usar 0.0.0.0 para tornar a aplicação acessível de fora do contêiner.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
