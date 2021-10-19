#!/usr/bin/env bash

#
# Iniciar servidor
# 
#

# 1. Check if .env file exists
if [ -e .env ]; then
    source .env
else 
    echo "Faltando arquivo .env"
    exit 1
fi

# 2. Create docker network
echo "Criando network '$NETWORK'"
docker network create $NETWORK

# 3. Update local images
echo "Atualizando imagem"
docker-compose pull

echo "Iniciar docker-compose"
docker-compose -f "docker-compose.yml" up -d

exit 0
