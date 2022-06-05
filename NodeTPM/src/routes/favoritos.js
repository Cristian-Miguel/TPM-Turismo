const { Router } = require("express");
const router = Router();
const Organizador = require('../models/Organizado');

router.get('/favoritos/Hoteles/:idUser', (req, res) => { 
    let sql = "SELECT H.idHotel, H.Nombre, H.Descripcion, H.Imagen FROM"+ 
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN  hotel AS H ON O.idHotel = H.idHotel WHERE F.idUsuario = "+req.params.idUser;
    Organizador.ListarSQL(res,sql);
});

router.get('/favoritos/Viajes/:idUser', (req, res) => { 
    let sql = "SELECT  V.idViaje, V.Nombre, V.Descripcion, V.Imagen FROM"+ 
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN viajes AS V ON O.idViaje = V.idViaje WHERE F.idUsuario = "+req.params.idUser;
    Organizador.ListarSQL(res,sql);
});

router.get('/favoritos/Restaurantes/:idUser', (req, res) => { 
    let sql = "SELECT  R.idRestaurante, R.Nombre, R.Descripcion, R.Imagen FROM"+ 
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN restaurantes AS R ON O.idRestaurante = R.idRestaurante WHERE F.idUsuario = "+req.params.idUser;
    Organizador.ListarSQL(res,sql);
});

router.get('/favoritos/Tour/:idUser', (req, res) => { 
    let sql = "SELECT  T.idTour, T.Nombre, T.Descripcion, T.Imagen FROM"+ 
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN tour AS T ON O.idTour = T.idTour WHERE F.idUsuario = "+req.params.idUser;
    Organizador.ListarSQL(res,sql);
});

router.get('/favoritos/Paquete/:idUser', (req, res) => { 
    let sql = "SELECT  P.idPaquete, P.Nombre, P.Descripcion, P.Imagen FROM"+
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN paquetes AS P ON O.idPaquete = P.idPaquete WHERE F.idUsuario = "+req.params.idUser;   
    Organizador.ListarSQL(res,sql);
});



module.exports = router;