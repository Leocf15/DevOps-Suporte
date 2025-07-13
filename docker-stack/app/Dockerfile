# Usar Node.js versão 18
FROM node:18-alpine

# Criar pasta da aplicação
WORKDIR /app

# Copiar arquivos de dependências
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar código da aplicação
COPY . .

# Expor porta 3000
EXPOSE 3000

# Comando para iniciar
CMD ["npm", "start"]
