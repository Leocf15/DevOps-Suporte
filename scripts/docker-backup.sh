#!/bin/bash

# Script de backup para volumes Docker
# Uso: ./docker-backup.sh nome_do_volume

set -e  # Parar se der erro

# Configurações
VOLUME_NAME=${1:-"postgres-data"}
BACKUP_DIR="/tmp/docker-backups"
REMOTE_USER="backup"
REMOTE_HOST="192.168.0.100"
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')

echo "🔄 Iniciando backup do volume: $VOLUME_NAME"

# 1. Verificar se Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "❌ ERRO: Docker não está instalado!"
    echo "💡 Para instalar: curl -sSL https://get.docker.com | sh"
    exit 1
fi

echo "✅ Docker encontrado"

# 2. Verificar se volume existe
if ! docker volume inspect "$VOLUME_NAME" &> /dev/null; then
    echo "❌ ERRO: Volume '$VOLUME_NAME' não encontrado!"
    echo "📋 Volumes disponíveis:"
    docker volume ls
    exit 1
fi

echo "✅ Volume '$VOLUME_NAME' encontrado"

# 3. Criar diretório de backup
mkdir -p "$BACKUP_DIR"
echo "📁 Diretório de backup: $BACKUP_DIR"

# 4. Criar backup
BACKUP_FILE="${BACKUP_DIR}/${VOLUME_NAME}_backup_${TIMESTAMP}.tar.gz"

echo "📦 Criando backup..."
docker run --rm \
    -v "$VOLUME_NAME":/data:ro \
    -v "$BACKUP_DIR":/backup \
    alpine:latest \
    tar -czf "/backup/$(basename "$BACKUP_FILE")" -C /data .

if [ -f "$BACKUP_FILE" ]; then
    BACKUP_SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
    echo "✅ Backup criado: $BACKUP_FILE ($BACKUP_SIZE)"
else
    echo "❌ ERRO: Falha ao criar backup"
    exit 1
fi

# 5. Enviar via SCP (simulado)
echo "📤 Enviando backup via SCP..."
echo "🔗 Destino: $REMOTE_USER@$REMOTE_HOST"

# Comando SCP (comentado para não dar erro se servidor não existir)
# scp "$BACKUP_FILE" "$REMOTE_USER@$REMOTE_HOST:/backups/"

echo "✅ Backup enviado com sucesso (simulado)"

# 6. Verificar integridade (simulado)
echo "🔍 Verificando integridade..."
LOCAL_CHECKSUM=$(sha256sum "$BACKUP_FILE" | cut -d' ' -f1)
echo "📋 Checksum local: $LOCAL_CHECKSUM"

echo "🎉 Backup concluído com sucesso!"
echo "📄 Arquivo: $BACKUP_FILE"
echo "📊 Tamanho: $BACKUP_SIZE"
