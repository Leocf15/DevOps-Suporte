
# Meu Projeto

Este é meu README.
# 🚀 Teste Técnico DevOps/Suporte

## 📋 Sobre o Projeto

Este repositório contém a solução completa para o teste técnico de DevOps/Suporte, incluindo:

- **Aplicação Node.js** com Express
- **Banco PostgreSQL** com dados de exemplo
- **Nginx** como proxy reverso
- **Scripts de automação** para backup
- **Pipeline CI/CD** com GitHub Actions
- **Consultas SQL** para análise de dados

## 🏗️ Arquitetura

┌───────────────┐ ┌───────────────┐ ┌───────────────┐
│ Nginx │───▶│ Node.js App │───▶│ PostgreSQL │
│ (Proxy :80) │ │ (:3000) │ │ (:5432) │
└───────────────┘ └───────────────┘ └───────────────┘


## 🚀 Como Executar

### Pré-requisitos
- Docker 20.10+
- Docker Compose 2.0+
- Git

### Execução Rápida

```bash
# 1. Clonar repositório
git clone <URL_DO_SEU_REPOSITORIO>
cd teste-tecnico-devops

# 2. Executar aplicação
cd docker-stack
docker-compose up -d

# 3. Aguardar inicialização (30-60 segundos)
sleep 60

# 4. Testar aplicação
curl http://localhost/health

# Verificar status dos containers
docker-compose ps

# Logs da aplicação
docker-compose logs app

# Logs do banco
docker-compose logs postgres
