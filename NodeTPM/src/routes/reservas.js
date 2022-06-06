const { Router } = require("express");
const router = Router();
const Organizador = require('../models/Organizado');

router.post('/reservas/Hoteles', (req, res, next) => {
    const {id} = req.body;
    let sql = "SELECT H.idHotel, H.Nombre, H.Descripcion, H.Imagen, H.Costo, H.Calificacion , RS.FechaEntrada FROM "+ 
    "(organizador AS O  INNER JOIN reserva_servicio AS RS ON O.idReserva = RS.idReserva) "+
    "JOIN  hotel AS H ON O.idHotel = H.idHotel WHERE RS.idUsuario = "+id;
    Organizador.ListarSQL(res, sql);
});

router.post('/reservas/Viajes', (req, res) => { 
    const {id} = req.body;
    let sql = "SELECT  V.idViaje, V.Nombre, V.Descripcion, V.Imagen, V.Costo, V.Calificacion , RS.FechaEntrada  FROM "+
    "(organizador AS O  INNER JOIN reserva_servicio AS RS ON O.idReserva = RS.idReserva) "+
    "JOIN viajes AS V ON O.idViaje = V.idViaje WHERE RS.idUsuario = 1";
    Organizador. ListarSQL(res, sql);
});

router.post('/reservas/Restaurantes', (req, res) =>{
    const {id} = req.body;
    let sql = "SELECT  R.idRestaurante, R.Nombre, R.Descripcion, R.Imagen, R.Costo, R.Calificacion , RS.FechaEntrada  FROM "+
    "(organizador AS O  INNER JOIN reserva_servicio AS RS ON O.idReserva = RS.idReserva) "+
    "JOIN restaurantes AS R ON O.idRestaurante = R.idRestaurante WHERE RS.idUsuario = "+id; 
    Organizador.ListarSQL(res, sql);
});

router.post('/reservas/Tour', (req, res) => { 
    const {id} = req.body;
    let sql = "SELECT  T.idTour, T.Nombre, T.Descripcion, T.Imagen, T.Costo, T.Calificacion , RS.FechaEntrada  FROM "+
    "(organizador AS O  INNER JOIN reserva_servicio AS RS ON O.idReserva = RS.idReserva) "+
    "JOIN tour AS T ON O.idTour = T.idTour WHERE RS.idUsuario = "+id;
    Organizador.ListarSQL(res, sql);
});

router.post('/reservas/Paquetes', (req, res) => { 
    const {id} = req.body;
    let sql = "SELECT  P.idPaquete, P.Nombre, P.Descripcion, P.Imagen, P.Costo, P.Calificacion , RS.FechaEntrada  FROM "+
    "(organizador AS O  INNER JOIN reserva_servicio AS RS ON O.idReserva = RS.idReserva) "+
    "JOIN paquetes AS P ON O.idPaquete = P.idPaquete WHERE RS.idUsuario = "+id;
    Organizador.ListarSQL(res, sql);
});

router.post('/reservas/hotelN', (req, res) => { 
    const {id,tipo} = req.body;
    let sql;

    if(tipo == "Administrador") sql = "SELECT H.Nombre,R.FechaEntrada,R.FechaSalida,R.FormaPago,R.idReserva,R.confirmado,R.idUsuario "+
    "FROM organizador AS O INNER JOIN hotel AS H  ON O.idHotel = H.idHotel INNER JOIN reserva_servicio AS R ON O.idReserva = R.idReserva "+
    "WHERE O.TipoGuardado = 'Reserva' AND O.idHotel != '';";

    else sql = "SELECT H.Nombre,R.FechaEntrada,R.FechaSalida,R.FormaPago,R.idReserva,R.confirmado,R.idUsuario "+
    "FROM organizador AS O INNER JOIN hotel AS H  ON O.idHotel = H.idHotel INNER JOIN reserva_servicio AS R ON O.idReserva = R.idReserva "+
    "WHERE O.TipoGuardado = 'Reserva' AND O.idHotel != '' AND H.idUsuario = "+id;

    Organizador.ListarSQL(res, sql);
});

router.post('/reservas/viajeN', (req, res) => { 
    const {id,tipo} = req.body;
    let sql;

    if(tipo == "Administrador") sql = "SELECT H.Nombre,R.FechaEntrada,R.FechaSalida,R.FormaPago,R.idReserva,R.confirmado,R.idUsuario "+
    "FROM organizador AS O INNER JOIN viajes AS H  ON O.idViaje = H.idViaje INNER JOIN reserva_servicio AS R ON O.idReserva = R.idReserva "+
    "WHERE O.TipoGuardado = 'Reserva' AND O.idViaje != '';";

    else sql = "SELECT H.Nombre,R.FechaEntrada,R.FechaSalida,R.FormaPago,R.idReserva,R.confirmado,R.idUsuario "+
    "FROM organizador AS O INNER JOIN viajes AS H  ON O.idViaje = H.idViaje INNER JOIN reserva_servicio AS R ON O.idReserva = R.idReserva "+
    "WHERE O.TipoGuardado = 'Reserva' AND O.idViaje != '' AND H.idUsuario = "+id;

    Organizador.ListarSQL(res, sql);
});

router.post('/reservas/tourN', (req, res) => { 
    const {id,tipo} = req.body;
    let sql;

    if(tipo == "Administrador") sql = "SELECT H.Nombre,R.FechaEntrada,R.FechaSalida,R.FormaPago,R.idReserva,R.confirmado,R.idUsuario "+
    "FROM organizador AS O INNER JOIN tour AS H  ON O.idTour = H.idTour INNER JOIN reserva_servicio AS R ON O.idReserva = R.idReserva "+
    "WHERE O.TipoGuardado = 'Reserva' AND O.idTour != '';";

    else sql = "SELECT H.Nombre,R.FechaEntrada,R.FechaSalida,R.FormaPago,R.idReserva,R.confirmado,R.idUsuario "+
    "FROM organizador AS O INNER JOIN tour AS H  ON O.idTour = H.idTour INNER JOIN reserva_servicio AS R ON O.idReserva = R.idReserva "+
    "WHERE O.TipoGuardado = 'Reserva' AND O.idTour != '' AND H.idUsuario"+id;

    Organizador.ListarSQL(res, sql);
});

router.post('/reservas/restauranteN', (req, res) => { 
    const {id,tipo} = req.body;
    let sql;

    if(tipo == "Administrador") sql = "SELECT H.Nombre,R.FechaEntrada,R.FechaSalida,R.FormaPago,R.idReserva,R.confirmado,R.idUsuario "+
    "FROM organizador AS O INNER JOIN restaurantes AS H  ON O.idRestaurante = H.idRestaurante INNER JOIN reserva_servicio AS R ON O.idReserva = R.idReserva "+
    "WHERE O.TipoGuardado = 'Reserva' AND O.idRestaurante != '';";

    else sql = "SELECT H.Nombre,R.FechaEntrada,R.FechaSalida,R.FormaPago,R.idReserva,R.confirmado,R.idUsuario "+
    "FROM organizador AS O INNER JOIN tour AS H  ON O.idTour = H.idTour INNER JOIN reserva_servicio AS R ON O.idReserva = R.idReserva "+
    "WHERE O.TipoGuardado = 'Reserva' AND O.idTour != '' AND H.idUsuario = "+id;

    Organizador.ListarSQL(res, sql);
});

router.post('/reservas/eliminar', (req, res) => { 
    const {id} = req.body;
    let sql;

    sql = "DELETE FROM organizador WHERE idReserva = "+id+";";
    Organizador.eliminarReserva(res, sql);
    sql = "DELETE FROM reserva_servicio WHERE idReserva = "+id+";";
    Organizador.eliminarReserva(res, sql);
});

router.post('/reservas/confirmar', (req, res) => { 
    const {id} = req.body;
    let sql;

    sql = "UPDATE reserva_servicio SET confirmado = 1 WHERE idReserva = "+id+";";
    Organizador.eliminarReserva(res, sql);
});

router.post('/reservas/email', (req, res) => { 
    const {id} = req.body;
    let sql;

    sql = "SELECT Email FROM usuarios WHERE idUsuario = "+id;
    Organizador.mandarEmail(res, sql);
});

module.exports = router;