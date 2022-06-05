const { Router } = require("express");
const router = Router();
const Organizador = require('../models/Organizado');

router.post('/empresa/Hoteles/', (req, res, next) => {
    const {id,tipo} = req.body;
    let sql;

    if(tipo == "Administrador") sql = "SELECT * FROM Hotel";
    else sql = "SELECT * FROM Hotel WHERE idUsuario = "+id;
    Organizador.ListarSQL(res, sql);
});

router.post('/empresa/Viajes/', (req, res, next) => {
    const {id,tipo} = req.body; 
    let sql;

    if(tipo == "Administrador") sql = "SELECT * FROM Viajes";
    else sql = "SELECT * FROM Viajes WHERE idUsuario = "+id;
    Organizador. ListarSQL(res, sql);
});

router.post('/empresa/Restaurantes/', (req, res, next) =>{
    const {id,tipo} = req.body;
    let sql;

    if(tipo == "Administrador") sql = "SELECT * FROM Restaurantes";
    else sql = "SELECT * FROM Restaurantes WHERE idUsuario = "+id;  
    Organizador.ListarSQL(res, sql);
});

router.post('/empresa/Tour/', (req, res, next) => { 
    const {id,tipo} = req.body; 
    let sql;

    if(tipo == "Administrador") sql = "SELECT * FROM Tour";
    else sql = "SELECT * FROM Tour WHERE idUsuario = "+id;
    Organizador.ListarSQL(res, sql);
});

router.post('/empresa/Paquetes/', (req, res, next) => {
    const {id,tipo} = req.body;
    let sql;

    if(tipo == "Administrador") sql = "SELECT * FROM Paquetes";
    else sql = "SELECT * FROM Paquetes WHERE idUsuario = "+id;
    Organizador.ListarSQL(res, sql);
});

module.exports = router;