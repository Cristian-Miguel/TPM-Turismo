const { Router } = require("express");
const router = Router();
const Organizador = require('../models/Organizado');

router.get('/api/favoritos', (req, res) => {
    res.json('User List');
});

router.get('/favoritos/Hoteles', (req, res) => { 
    Organizador.FavHoteles(req,res);
});

router.get('/favoritos/Viajes', (req, res) => { 
    Organizador.FavViajes(req,res);
});

router.get('/favoritos/Restaurantes', (req, res) => { 
    Organizador.FavRestaurantes(req,res);
});

router.get('/favoritos/Tour', (req, res) => { 
    Organizador.FavTour(req,res);
});

router.get('/favoritos/Paquete', (req, res) => { 
    Organizador.FavPaquete(req,res);
});



module.exports = router;