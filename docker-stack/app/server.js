const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');

const app = express();
const PORT = process.env.PORT || 3000;

// Configurações básicas
app.use(cors());
app.use(express.json());

// Conexão com banco de dados
const pool = new Pool({
  user: process.env.DB_USER || 'postgres',
  host: process.env.DB_HOST || 'postgres',
  database: process.env.DB_NAME || 'testdb',
  password: process.env.DB_PASSWORD || 'postgres123',
  port: process.env.DB_PORT || 5432,
});

// Rota principal
app.get('/', (req, res) => {
  res.json({
    message: 'Aplicação Node.js funcionando!',
    version: '1.0.0',
    status: 'OK'
  });
});

// Rota de saúde (health check)
app.get('/health', (req, res) => {
  res.json({ 
    status: 'OK', 
    timestamp: new Date().toISOString()
  });
});

// Testar conexão com banco
app.get('/api/db-test', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT NOW() as current_time');
    client.release();
    
    res.json({
      database: 'Conectado com sucesso!',
      current_time: result.rows[0].current_time
    });
  } catch (err) {
    res.status(500).json({
      database: 'Erro na conexão',
      error: err.message
    });
  }
});

// Iniciar servidor
app.listen(PORT, '0.0.0.0', () => {
  console.log(`🚀 Servidor rodando na porta ${PORT}`);
});
