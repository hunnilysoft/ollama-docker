# Utiliza a imagem base oficial do Ollama
FROM ollama/ollama:latest

# Define metadados do container
LABEL maintainer="Seu Nome <seu.email@exemplo.com>"
LABEL description="Container Docker para Ollama com suporte a GPU"

# Configuração do ambiente
ENV OLLAMA_HOST=0.0.0.0
ENV OLLAMA_PORT=11434
ENV OLLAMA_KEEP_ALIVE=5m

# Instala dependências adicionais (opcional)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Cria um usuário dedicado (melhor prática de segurança)
RUN adduser --disabled-password --gecos "" ollama && \
    mkdir -p /home/ollama/.ollama && \
    chown ollama:ollama /home/ollama/.ollama

# Configura diretório de trabalho e permissões
WORKDIR /home/ollama
RUN chown -R ollama:ollama /home/ollama

# Configura volume para persistência de dados
VOLUME /home/ollama/.ollama

# Porta exposta
EXPOSE 11434

# Muda para o usuário não-root
USER ollama

# Ponto de entrada padrão
ENTRYPOINT ["ollama"]

# Comando padrão (serve para iniciar o servidor)
CMD ["serve"]