const conexion      = require('../database')();
const jwt           = require('jsonwebtoken');
const server_config = require('config');

function login(res, sql){
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
    login,
}