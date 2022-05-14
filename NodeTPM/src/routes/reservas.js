const { Router } = require("express");
const router = Router();
const Organizador = require('../models/Organizado');

router.get('/reservas/Hoteles', (req, res) => { 
    let sql = "SELECT H.idHotel, H.Nombre, H.Descripcion, H.Imagen, H.Costo, H.Calificacion , RS.FechaEntrada FROM "+ 
    "(organizador AS O  INNER JOIN reserva_servicio AS RS ON O.idReserva = RS.idReserva) "+
    "JOIN  hotel AS H ON O.idHotel = H.idHotel WHERE RS.idUsuario = 1";
    Organizador.ListarSQL(res, sql);
});

router.get('/reservas/Viajes', (req, res) => { 
    let sql = "SELECT  V.idViaje, V.Nombre, V.Descripcion, V.Imagen, V.Costo, V.Calificacion , RS.FechaEntrada  FROM "+
    "(organizador AS O  INNER JOIN reserva_servicio AS RS ON O.idReserva = RS.idReserva) "+
    "JOIN viajes AS V ON O.idViaje = V.idViaje WHERE RS.idUsuario = 1";
    Organizador. ListarSQL(res, sql);
});

router.get('/reservas/Restaurantes', (req, res) =>{
    let sql = "SELECT  R.idRestaurante, R.Nombre, R.Descripcion, R.Imagen, R.Costo, R.Calificacion , RS.FechaEntrada  FROM "+
    "(organizador AS O  INNER JOIN reserva_servicio AS RS ON O.idReserva = RS.idReserva) "+
    "JOIN restaurantes AS R ON O.idRestaurante = R.idRestaurante WHERE RS.idUsuario = 1";  
    Organizador.ListarSQL(res, sql);
});

router.get('/reservas/Tour', (req, res) => { 
    let sql = "SELECT  T.idTour, T.Nombre, T.Descripcion, T.Imagen, T.Costo, T.Calificacion , RS.FechaEntrada  FROM "+
    "(organizador AS O  INNER JOIN reserva_servicio AS RS ON O.idReserva = RS.idReserva) "+
    "JOIN tour AS T ON O.idTour = T.idTour WHERE RS.idUsuario = 1";
    Organizador.ListarSQL(res, sql);
});

router.get('/reservas/Paquetes', (req, res) => { 
    let sql = "SELECT  P.idPaquete, P.Nombre, P.Descripcion, P.Imagen, P.Costo, P.Calificacion , RS.FechaEntrada  FROM "+
    "(organizador AS O  INNER JOIN reserva_servicio AS RS ON O.idReserva = RS.idReserva) "+
    "JOIN paquetes AS P ON O.idPaquete = P.idPaquete WHERE RS.idUsuario = 1";
    Organizador.ListarSQL(res, sql);
});

module.exports = router;