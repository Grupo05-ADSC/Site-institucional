const express = require('express');
const app = express();
const path = require('path');
const cors = require('cors');

// Configurar o ambiente de processo
process.env.AMBIENTE_PROCESSO = "producao"; // Ou "desenvolvimento"
const PORTA = process.env.AMBIENTE_PROCESSO === "producao" ? 80 : 3333; 

// Configurar CORS
app.use(cors());

app.use(express.json());
// Configurar os diretórios estáticos
app.use(express.static(path.join(__dirname, 'Site-institucional')));
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'css')));
app.use(express.static(path.join(__dirname, 'img')));
app.use(express.static(path.join(__dirname, 'js'))); 
app.use(express.static(path.join(__dirname, 'ProjetoPI')));   
app.use(express.static(path.join(__dirname, 'backend')));     
app.use(express.static(path.join(__dirname, 'backendJS')));     
app.use(express.static(path.join(__dirname, 'routes')));   

const Rota1 = require("../ProjetoPI/backend/backendJS/routes/usuarioRouter");
const Rota2 = require("../ProjetoPI/backend/backendJS/routes/darkstoreRouter"); 
const Rota3 = require("../ProjetoPI/backend/backendJS/routes/funcionarioRouter");
const Rota4 = require("../ProjetoPI/backend/backendJS/routes/perfilRouter");
const Rota5 = require("../ProjetoPI/backend/backendJS/routes/maquinasRouter");
const Rota6 = require("../ProjetoPI/backend/backendJS/routes/metricasRouter");
const Rota7 = require("../ProjetoPI/backend/backendJS/routes/graficosRouter");
const Rota8 = require("../ProjetoPI/backend/backendJS/routes/slackRouter");
const Rota9 = require("../ProjetoPI/backend/backendJS/routes/processoRouter");

app.use('/usuario', Rota1);
app.use('/darkstore', Rota2);
app.use('/funcionario', Rota3);
app.use('/perfil', Rota4);
app.use('/maquinas', Rota5);
app.use('/metricas', Rota6);
app.use('/graficos', Rota7);
app.use('/slack', Rota8);
app.use('/processo', Rota9);

// Iniciar o servidor
app.listen(PORTA, function () {
    console.log(`Servidor ativo: http://localhost:${PORTA}`);
});
