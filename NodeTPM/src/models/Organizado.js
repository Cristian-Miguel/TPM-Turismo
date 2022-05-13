const conexion      = require('../database')();
const jwt           = require('jsonwebtoken');
const server_config = require('config');

function FavHoteles(req,res){
    let query = "SELECT H.idHotel, H.Nombre, H.Descripcion, H.Imagen FROM"+ 
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN  hotel AS H ON O.idHotel = H.idHotel WHERE F.idUsuario = 1";
    conexion.query(query).
    then(hoteles => {

        if (hoteles.length == 0) {
            res.header("Access-Control-Allow-Origin", "*");
            res.status(200).json({
                
            });
        } else {
            const accessToken = jwt.sign({ idHotel: hoteles[0].Nombre }, server_config.get('app.JWT_SECRET'), {
                expiresIn: "1d"
            });
            res.header("Access-Control-Allow-Origin", "*");
            //madamos los datos obtenidos
            res.status(200).json({
                hoteles
            });  
            //madamos error si hay algun problema
            res.status(401).json({
                    msg : 'no existes'
            })  
        }

    }).catch(err => {
        console.log(err);
    });
}

function FavViajes(req,res){
    let query = "SELECT  V.idViaje, V.Nombre, V.Descripcion, V.Imagen FROM"+ 
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN viajes AS V ON O.idViaje = V.idViaje WHERE F.idUsuario = 1";
    conexion.query(query).
    then(viajes => {
        if (viajes.length == 0) {
            res.header("Access-Control-Allow-Origin", "*");
            res.status(200).json({
                
            });
            res.status(401).json({
                msg : 'no existes'
            }) 
        } else {
            const accessToken = jwt.sign({ idHotel: viajes[0].Nombre }, server_config.get('app.JWT_SECRET'), {
                expiresIn: "1d"
            });
            res.header("Access-Control-Allow-Origin", "*");
            //madamos los datos obtenidos
            res.status(200).json({
                viajes
            });  
            //madamos error si hay algun problema
            res.status(401).json({
                    msg : 'no existes'
            }) 
        }
          
    }).catch(err => {
        console.log(err);
    });
}

function FavRestaurantes(req,res){
    let query = "SELECT  R.idRestaurante, R.Nombre, R.Descripcion, R.Imagen FROM"+ 
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN restaurantes AS R ON O.idRestaurante = R.idRestaurante WHERE F.idUsuario = 1";
    conexion.query(query).
    then(restaurantes => {

        if (restaurantes.length == 0) {
            res.header("Access-Control-Allow-Origin", "*");
            res.status(200).json({
                
            });
        } else {
            const accessToken = jwt.sign({ idHotel: restaurantes[0].Nombre }, server_config.get('app.JWT_SECRET'), {
                expiresIn: "1d"
            });
            res.header("Access-Control-Allow-Origin", "*");
            //madamos los datos obtenidos
            res.status(200).json({
                restaurantes
            });  
            //madamos error si hay algun problema
            res.status(401).json({
                    msg : 'no existes'
            }) 
        }

         
    }).catch(err => {
        console.log(err);
    });
}

function FavTour(req,res){
    let query = "SELECT  T.idTour, T.Nombre, T.Descripcion, T.Imagen FROM"+ 
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN tour AS T ON O.idTour = T.idTour WHERE F.idUsuario = 1";

    conexion.query(query).
    then(tour => {

        if (tour.length == 0) {
            res.header("Access-Control-Allow-Origin", "*");
            res.status(200).json({
                
            });
        } else {
            const accessToken = jwt.sign({ idHotel: tour[0].Nombre }, server_config.get('app.JWT_SECRET'), {
                expiresIn: "1d"
            });
            res.header("Access-Control-Allow-Origin", "*");
            //madamos los datos obtenidos
            res.status(200).json({
                tour
            });  
            //madamos error si hay algun problema
            res.status(401).json({
                    msg : 'no existes'
            }) 
        }

        

    }).catch(err => {
        console.log(err);
    });
}

function FavPaquete(req,res){
    let query = "SELECT  P.idPaquete, P.Nombre, P.Descripcion, P.Imagen FROM"+
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN paquetes AS P ON O.idPaquete = P.idPaquete WHERE F.idUsuario = 1";
    conexion.query(query).
    then(paquete => {

        if (paquete.length == 0) {
            res.header("Access-Control-Allow-Origin", "*");
            res.status(200).json({
                
            });
        } else {
            const accessToken = jwt.sign({ idHotel: paquete[0].Nombre }, server_config.get('app.JWT_SECRET'), {
                expiresIn: "1d"
            });
            res.header("Access-Control-Allow-Origin", "*");
            //madamos los datos obtenidos
            res.status(200).json({
                paquete
            });  
            //madamos error si hay algun problema
            res.status(401).json({
                    msg : 'no existes'
            })   
        }

    }).catch(err => {
        console.log(err);
    });
}

function ReservacionesUsuario(req,res, sql){
    conexion.query(sql).
    then(row => {

        if (row.length == 0) {
            res.header("Access-Control-Allow-Origin", "*");
            res.status(200).json({
                
            });
        } else {
            const accessToken = jwt.sign({ Nombre: row[0].Nombre }, server_config.get('app.JWT_SECRET'), {
                expiresIn: "1d"
            });
            res.header("Access-Control-Allow-Origin", "*", accessToken);
            //madamos los datos obtenidos
            res.status(200).json({
                row
            });  
            //madamos error si hay algun problema
            res.status(401).json({
                    msg : 'no existes'
            })  
        }

    }).catch(err => {
        console.log(err);
    });
}




module.exports = {
    FavHoteles,
    FavViajes,
    FavRestaurantes,
    FavTour,
    FavPaquete,
    ReservacionesUsuario,
}