const { Router } = require("express");
const router = Router();
const Hotel = require('../models/Hotel');
const Viajes = require('../models/Viaje');
const Restaurantes = require('../models/Restaurante');
const Tours = require('../models/Tour');
const Paquetes = require('../models/Paquete');

router.post('/Agregar/Hotel/', (req, res, next) => { 
    const {nombre} = req.body;
    const {descripcion} = req.body;
    const {categoria} = req.body;
    const {costo} = req.body;
    const {numeroHab} = req.body;
    const {tipoHab} = req.body;
    const {numeroExt} = req.body;
    const {calle} = req.body;
    const {colonia} = req.body;
    const {ciudad} = req.body;
    const {estado} = req.body;
    const {codigoPostal} = req.body;
    const {telefono} = req.body;
    const {idUser} = req.body;

    
    console.log(req.body);
    // let sql = "SELECT idUsuario,Usuario,TipoUsuario FROM usuarios WHERE Email = '"+email+"' AND Password = '"+pass+"';";
    let sql = "INSERT INTO hotel(Nombre, Descripcion, Categoria, Costo, NumHabitacion, TipoHabitacion, NumeroExterior, Calle, Colonia, Ciudad, Estado, CodigoPostal, idUsuario ) VALUES ('"+nombre+"','"+descripcion+"','"+categoria+"',"+costo+","+numeroHab+",'"+tipoHab+"','"+numeroExt+"','"+calle+"','"+colonia+"','"+ciudad+"','"+estado+"',"+codigoPostal+","+idUser+");";
    Hotel.Agregar(res,sql);
    //res.json(req.body);
    console.log(sql);
    //res.json(sql);
});

router.post('/Agregar/Viaje/', (req, res, next) => {
    const {nombre} = req.body;
    const {descripcion} = req.body;
    const {costo} = req.body;
    const {origen} = req.body;
    const {destino} = req.body;
    const {numeroAsientos} = req.body;
    const {idUser} = req.body;

    console.log(req.body);
    let sql = "INSERT INTO viajes(Nombre, Descripcion, Origen, Destino, Costo,NumPlazas, idUsuario) VALUES ('"+nombre+"','"+descripcion+"','"+origen+"','"+destino+"',"+costo+","+numeroAsientos+","+idUser+")";
    Viajes.Agregar(res,sql);
});

router.post('/Agregar/Restaurante', (req, res, next) => {
    const {nombre} = req.body;
    const {descripcion} = req.body;
    const {costo} = req.body;
    const {categoria} = req.body;
    const {idUser} = req.body;

    console.log(req.body);
    let sql = "INSERT INTO restaurantes(Nombre, Descripcion, Costo, Categoria,idUsuario) VALUES ('"+nombre+"','"+descripcion+"',"+costo+",'"+categoria+"',"+idUser+")";
    Restaurantes.Agregar(res,sql);
});

router.post('/Agregar/Tour', (req, res, next) => {
    const {nombre} = req.body;
    const {descripcion} = req.body;
    const {costo} = req.body;
    const {cantidad} = req.body;
    const {ciudad} = req.body;
    const {idUser} = req.body;

    console.log(req.body);
    let sql = "INSERT INTO tour(Nombre, Descripcion, Cantidad, Costo, Ciudad, idUsuario) VALUES ('"+nombre+"','"+descripcion+"',"+cantidad+","+costo+",'"+ciudad+"',"+idUser+")";
    Tours.Agregar(res,sql);
});

router.post('/Agregar/Paquete', (req, res, next) => {
    const {nombre} = req.body;
    const {descripcion} = req.body;
    const {numeroPaquete} = req.body;
    const {costo} = req.body;
    const {idUser} = req.body;

    console.log(req.body);
    let sql = "INSERT INTO paquetes(Nombre, Descripcion, NumeroPaquetes, Costo, idUsuario) VALUES ('"+nombre+"','"+descripcion+"',"+numeroPaquete+","+costo+","+idUser+")";
    Paquetes.Agregar(res,sql);
});

module.exports = router;