const { Router } = require("express");
const router = Router();
const reservacion = require('../models/Reserva');

router.get('/api/reservas', (req, res) => {
    res.json('User List');
});

// router.get('/api/reservas/listar', (req, res) => { 
//      reservacion.Listar(req, res);
// });

router.get('/reservas/Hoteles', (req, res) => { 
    reservacion.Listar(req, res);
});

router.get('/reservas/Viajes', (req, res) => { 
    reservacion.Listar(req, res);
});

router.get('/reservas/Restaurantes', (req, res) => { 
    reservacion.Listar(req, res);
});

router.get('/reservas/Tour', (req, res) => { 
    reservacion.Listar(req, res);
});

router.get('/reservas/Paquetes', (req, res) => { 
    reservacion.Listar(req, res);
});

module.exports = router;