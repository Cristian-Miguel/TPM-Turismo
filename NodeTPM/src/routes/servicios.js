const { Router } = require("express");
const router = Router();
const Organizador = require('../models/Organizado');

router.get('/servicios/Hoteles', (req, res) => { 
    let sql = "SELECT * FROM Hotel";
    Organizador.ListarSQL(res, sql);
});

router.get('/servicios/Viajes', (req, res) => { 
    let sql = "SELECT * FROM Viajes";
    Organizador. ListarSQL(res, sql);
});

router.get('/servicios/Restaurantes', (req, res) =>{
    let sql = "SELECT * FROM Restaurantes";  
    Organizador.ListarSQL(res, sql);
});

router.get('/servicios/Tour', (req, res) => { 
    let sql = "SELECT * FROM Tour";
    Organizador.ListarSQL(res, sql);
});

router.get('/servicios/Paquetes', (req, res) => { 
    let sql = "SELECT * FROM Paquetes";
    Organizador.ListarSQL(res, sql);
});

module.exports = router;