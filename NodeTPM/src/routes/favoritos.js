const { Router } = require("express");
const router = Router();
const Organizador = require('../models/Organizado');

router.get('/api/favoritos', (req, res) => {
    res.json('User List');
});

// router.get('/api/favoritos/listar', (req, res) => { 
//         // Hoteles.Listar(req, res);
//         Organizador.ListarFavoritos(req, res);
// });

router.get('/favoritos/Hoteles', (req, res) => { 
    Organizador.Hoteles(req,res);
});

router.get('/favoritos/Viajes', (req, res) => { 
    Organizador.Viajes(req,res);
});

router.get('/favoritos/Restaurantes', (req, res) => { 
    Organizador.Restaurantes(req,res);
});

router.get('/favoritos/Tour', (req, res) => { 
    Organizador.Tour(req,res);
});

router.get('/favoritos/Paquete', (req, res) => { 
    Organizador.Paquete(req,res);
});



module.exports = router;