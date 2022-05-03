const conexion      = require('../database')();
const jwt           = require('jsonwebtoken');
const server_config = require('config');

function login(email,pass,res){
    conexion.query('SELECT idUsuarios,nombre FROM usuarios WHERE Email = "'+email+'", Password = "'+pass+'";').then(
        rows => {
            const accessToken = jwt.sign({ idUsuarios: rows[0].idUsuarios }, server_config.get('app.JWT_SECRET'), {
                expiresIn: "1d"
            });
            res.header("Access-Control-Allow-Origin", "*");
            res.status(200).json({
                rows
            });  
            res.status(401).json({
                    msg : 'no existes'
            })  
        }
    ).catch(
        err => {console.log(err)}
    );
}

function exist(email,res){
    conexion.query('SELECT email FROM usuarios WHERE Email = "'+email+'";').then(
        rows => {
            const accessToken = jwt.sign({ idUsuarios: rows[0].idUsuarios }, server_config.get('app.JWT_SECRET'), {
                expiresIn: "1d"
            });
            res.header("Access-Control-Allow-Origin", "*");
            res.status(200).json({
                rows
            });  
            res.status(401).json({
                    msg : 'no existes'
            })  
        }
    ).catch(
        err => {console.log(err)}
    );
}

function singUp(usuario,email,pass,tipo,imagen,nombre,primerAp,segundoAp,fechaNac,RFC,res){
    conexion.query('INSERT INTO usuarios VALUES ("'+usuario+'","'+email+'","'+pass+'","'+tipo+'","'+imagen+'","'+nombre+'","'+primerAp+'","'+segundoAp+'","'+fechaNac+'","'+RFC+'")').then(
        rows => {
            const accessToken = jwt.sign({ idUsuarios: rows[0].idUsuarios }, server_config.get('app.JWT_SECRET'), {
                expiresIn: "1d"
            });
            res.header("Access-Control-Allow-Origin", "*");
            res.status(200).json({
                rows
            });  
            res.status(401).json({
                    msg : 'no existes'
            })  
        }
    ).catch(
        err => {console.log(err)}
    );
}

module.exports = {
    login,
    exist,
    singUp
}