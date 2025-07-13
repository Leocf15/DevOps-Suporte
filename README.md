# 🚀 Teste Técnico DevOps/Suporte - Estrutura Completa

**Repositório:** https://github.com/Leocf15/DevOps-Suporte
 
**Autor:** Leonardo CF

## 📁 Estrutura dos Arquivos

Baseado na imagem fornecida, aqui estão todos os arquivos organizados conforme a estrutura do seu repositório:

### 📂 `.github/workflows/`
- **`ci-cd.yml`** - Pipeline CI/CD com GitHub Actions

### 📂 `pilha-de-encaixe/` (docker-stack)

#### 📂 `app/`
- **`Dockerfile`** - Container da aplicação Node.js
- **`package.json`** - Dependências e scripts Node.js  
- **`server.js`** - Servidor Express com API REST

#### 📂 `nginx/`
- **`nginx.conf`** - Configuração do proxy reverso + logs Wazuh

#### 📂 `postgres/`
- **`init.sql`** - Schema do banco + dados de exemplo

#### Arquivo raiz:
- **`docker-compose.yml`** - Orquestração completa dos serviços

### 📂 `documentos/`
- **`respostas-teoricas.md`** - Todas as respostas teóricas do teste

### 📂 `roteiros/` (scripts)
- **`docker-backup.sh`** - Script de backup Docker + SCP

### 📂 `sql/`
- **`consultas.sql`** - Consulta principal + queries adicionais

### Arquivo raiz:
- **`LEIA-ME.md`** - Este arquivo (README em português)

## 🎯 Como Usar Esta Estrutura

### 1. **Copiar para seu repositório GitHub:**

```bash
# Clonar seu repositório
git clone https://github.com/Leocf15/DevOps-Suporte.git
cd DevOps-Suporte

# Criar estrutura de pastas
mkdir -p .github/workflows
mkdir -p pilha-de-encaixe/{app,nginx,postgres}
mkdir -p documentos
mkdir -p roteiros  
mkdir -p sql

# Copiar cada arquivo para sua pasta correspondente
# (use os arquivos que criei na pasta estrutura_completa)
```

### 2. **Organização dos arquivos:**

```
DevOps-Suporte/
├── .github/workflows/ci-cd.yml
├── pilha-de-encaixe/
│   ├── app/
│   │   ├── Dockerfile
│   │   ├── package.json
│   │   └── server.js
│   ├── nginx/
│   │   └── nginx.conf
│   ├── postgres/
│   │   └── init.sql
│   └── docker-compose.yml
├── documentos/
│   └── respostas-teoricas.md
├── roteiros/
│   └── docker-backup.sh
├── sql/
│   └── consultas.sql
└── LEIA-ME.md
```

### 3. **Executar a aplicação:**

```bash
cd pilha-de-encaixe
docker-compose up -d
```

### 4. **Testar funcionamento:**

```bash
curl http://localhost/health
curl http://localhost/api/status
curl http://localhost/api/db-test
```

## ✅ Checklist de Entrega

- [x] **Dockerfile** para aplicação Node.js
- [x] **Docker Compose** com Node.js + PostgreSQL + Nginx  
- [x] **Script Shell** para backup Docker + SCP
- [x] **Configuração Wazuh** para monitoramento Nginx
- [x] **GitHub Actions** com CI/CD pipeline
- [x] **Consulta SQL** para tickets por usuário
- [x] **Respostas teóricas** completas
- [x] **Estrutura organizada** conforme solicitado

## 🚀 Próximos Passos

1. **Copie os arquivos** para as pastas corretas no seu repositório
2. **Faça commit e push** de todos os arquivos
3. **Teste localmente** que tudo funciona
4. **Gere o PDF** com as respostas teóricas
5. **Entregue** o link do repositório + PDF

## 📞 Suporte

Se precisar de ajuda com algum arquivo específico, me avise!

**Repositório:** https://github.com/Leocf15/DevOps-Suporte
