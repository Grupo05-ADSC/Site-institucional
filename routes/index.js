const express = require('express');
const router = express.Router();
const path = require('path');

router.get('/cadastro', (req, res) => {
    res.sendFile(path.join(__dirname, '../cadastro.html'));
});

router.get('/login', (req, res) => {
    res.sendFile(path.join(__dirname, '../login.html'));
});

router.get('/dash', (req, res) => {
    res.sendFile(path.join(__dirname, '../dashboard/dash.html'));
});
router.get('/dashGeral', (req, res) => {
    res.sendFile(path.join(__dirname, '../dashboard/dashGeral.html'));
});

router.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../index.html'));
});

module.exports = router;
