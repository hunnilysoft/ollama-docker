# Ollama Docker Container

Container Docker para executar o Ollama com as últimas atualizações, agora com suporte a Docker Compose.

## Pré-requisitos

- Docker instalado
- Docker Compose instalado (para a versão compose)
- Pelo menos 8GB de RAM recomendado (para modelos maiores)
- Espaço em disco adequado (os modelos podem ocupar vários GB)
- Para GPU: NVIDIA Container Toolkit instalado

## Como usar

### Opção 1: Usando Docker Compose (recomendado)

1. Crie um arquivo `docker-compose.yml` com o conteúdo fornecido
2. Execute:

```bash
docker compose up -d