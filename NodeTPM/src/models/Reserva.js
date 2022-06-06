const conexion      = require('../database')();
const jwt           = require('jsonwebtoken');
const server_config = require('config');

function Listar(req,res){
    conexion.query("SELECT * FROM apoyos").
    then(rows => {
        const accessToken = jwt.sign({ idHotel: rows[0].idApoyo }, server_config.get('app.JWT_SECRET'), {
            expiresIn: "1d"
        });
        res.header("Access-Control-Allow-Origin", "*");
        //madamos los datos obtenidos
        res.status(200).json({
            rows
        });  
        //madamos error si hay algun problema
        res.status(401).json({
                msg : 'no existes'
        })  
    }).catch(err => {
        console.log(err);
    });
}

function Agregar(res, sql){
    conexion.query(sql).
    then(row => {

        if (row.length == 0) {
            res.header("Access-Control-Allow-Origin", "*");
            res.status(404).json({
                
            });
        } else {
            res.header("Access-Control-Allow-Origin", "*");
            //madamos los datos obtenidos
            res.status(200).json({
                //rows
            });  
        }

    }).catch(err => {
        console.log(err);
    });
}

function temp(res, sql,tipo,id){
    conexion.query(sql).
    then(row => {

        if (row.length == 0) {
            res.header("Access-Control-Allow-Origin", "*");
            res.status(404).json({
                
            });
        } else {
            res.header("Access-Control-Allow-Origin", "*");
            if (!row) {
                //madamos error si hay algun problema
                res.status(401).json({
                msg : 'no existes'
                }) 
            } else {
                //madamos los datos obtenidos
                res.status(200).json({
                    row
                });
                temp2(row[0].idReserva,tipo,id);
            }

        }

    }).catch(err => {
        console.log(err);
    });
}

function temp2(idReserva,TipoServicio,idDestino){
    let sql2;
    if(TipoServicio == "Hotel") sql2 = "INSERT INTO organizador(TipoGuardado,idReserva,idHotel) VALUES ('Reserva',"+idReserva+",'"+idDestino+"');";
    if(TipoServicio == "Restaurante") sql2 = "INSERT INTO organizador(TipoGuardado,idReserva,idRestaurante) VALUES ('Reserva',"+idReserva+",'"+idDestino+"');";
    if(TipoServicio == "Tour") sql2 = "INSERT INTO organizador(TipoGuardado,idReserva,idTour) VALUES ('Reserva',"+idReserva+",'"+idDestino+"');";
    console.log(sql2);

    conexion.query(sql2).
    then(row => {

        if (row.length == 0) {
            res.header("Access-Control-Allow-Origin", "*");
            res.status(404).json({
                
            });
        } else {
            res.header("Access-Control-Allow-Origin", "*");
            if (!row) {
                //madamos error si hay algun problema
                res.status(401).json({
                msg : 'no existes'
                }) 
            } else {
                //madamos los datos obtenidos
                res.status(200).json({
                    row
                }); 
            }

        }

    }).catch(err => {
        console.log(err);
    });
}

module.exports = {
    Listar,Agregar,temp
}