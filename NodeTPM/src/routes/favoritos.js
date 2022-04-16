const { Router } = require("express");
const router = Router();
const Hoteles = require('../models/Hotel');

router.get('/api/favoritos', (req, res) => {
    res.json('User List');
});

router.get('/api/favoritos/listar', (req, res) => { 
        Hoteles.Listar(req, res);
});

module.exports = router;