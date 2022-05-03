const conexion      = require('../database')();
const jwt           = require('jsonwebtoken');
const server_config = require('config');

function getTourists(res){
    conexion.query('SELECT * FROM turista').then(
        rows => {
            const accessToken = jwt.sign({ nombre: rows[0].nombre }, server_config.get('app.JWT_SECRET'), {
                expiresIn: "1d"
            });
            res.header("Access-Control-Allow-Origin", "*");
            res.status(200).json({
                rows
            });  
            res.status(401).json({
                msg : 'no existe'
            })  
        }
    ).catch(
        err => {console.log(err)}
    );
}

module.exports = {
    getTourists,
}