const conexion      = require('../database')();
const jwt           = require('jsonwebtoken');
const server_config = require('config');

// function ListarFavoritos(req,res){
//     Hoteles(req,res);
//     Viajes(req,res);
//     Restaurantes(req,res);
//     Tour(req,res);
//     Paquete(req,res);
// }


function Hoteles(req,res){
    let query = "SELECT H.idHotel, H.Nombre, H.Descripcion, H.Imagen FROM"+ 
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN  hotel AS H ON O.idHotel = H.idHotel WHERE F.idUsuario = 1";
    conexion.query(query).
    then(hoteles => {
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
    }).catch(err => {
        console.log(err);
    });
}

function Viajes(req,res){
    let query = "SELECT  V.Nombre, V.Descripcion FROM"+ 
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN viajes AS V ON O.idViaje = V.idViaje WHERE F.idUsuario = 1";
    conexion.query(query).
    then(viajes => {
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
    }).catch(err => {
        console.log(err);
    });
}

function Restaurantes(req,res){
    let query = "SELECT  R.Nombre, R.Descripcion FROM"+ 
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN restaurantes AS R ON O.idRestaurante = R.idRestaurante WHERE F.idUsuario = 1";
    conexion.query(query).
    then(restaurantes => {
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
    }).catch(err => {
        console.log(err);
    });
}

function Tour(req,res){
    let query = "SELECT  T.Nombre, T.Descripcion FROM"+ 
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN tour AS T ON O.idTour = T.idTour WHERE F.idUsuario = 1";
    conexion.query(query).
    then(tour => {
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
    }).catch(err => {
        console.log(err);
    });
}

function Paquete(req,res){
    let query = "SELECT  P.Nombre, P.Descripcion FROM"+
    "(organizador AS O  INNER JOIN favoritos AS F ON O.idFavoritos = F.idFavoritos)"+
    "JOIN paquetes AS P ON O.idPaquete = P.idPaquete WHERE F.idUsuario = 1";
    conexion.query(query).
    then(paquete => {
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
    }).catch(err => {
        console.log(err);
    });
}

module.exports = {
    Hoteles,
    Viajes,
    Restaurantes,
    Tour,
    Paquete,
}