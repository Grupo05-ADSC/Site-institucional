const express = require('express');
const app = express();
const path = require('path');

//process.env.AMBIENTE_PROCESSO = "desenvolvimento"
process.env.AMBIENTE_PROCESSO = "producao"
var PORTA = process.env.AMBIENTE_PROCESSO == "producao" ? 80:3333; 

app.use(express.static(path.join(__dirname, 'Site-institucional')));
app.use(express.static(path.join(__dirname, 'dashboard')));
app.use(express.static(path.join(__dirname, 'css')));
app.use(express.static(path.join(__dirname, 'img')));

const indexRoute = require('./routes/index');
app.use('/', indexRoute);

app.listen(PORTA, function () {
    console.log(`Servidor ativo na porta: ${PORTA}`);
});