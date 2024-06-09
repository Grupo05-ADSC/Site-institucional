const express = require('express');
const router = express.Router();
const path = require('path');

router.get('/cadastro', (req, res) => {
    res.sendFile(path.join(__dirname, '../public/cadastro.html'));
});

router.get('/login', (req, res) => {
    res.sendFile(path.join(__dirname, '../public/login.html'));
});

router.get('/dash', (req, res) => {
    res.sendFile(path.join(__dirname, '../public/dash.html'));
});
router.get('/dashGeral', (req, res) => {
    res.sendFile(path.join(__dirname, '../public/dashGeral.html'));
});

router.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../public/index.html'));
});

module.exports = router;
