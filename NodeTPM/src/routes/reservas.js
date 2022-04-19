const { Router } = require("express");
const router = Router();
const reservacion = require('../models/Reserva');

router.get('/api/reservas', (req, res) => {
    res.json('User List');
});

router.get('/api/reservas/listar', (req, res) => { 
     reservacion.Listar(req, res);
});

module.exports = router;