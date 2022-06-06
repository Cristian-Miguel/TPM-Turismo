const conexion      = require('../database')();
const jwt           = require('jsonwebtoken');
const server_config = require('config');
var nodemailer = require('nodemailer');

function  ListarSQL(res, sql){
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

function eliminarReserva(res, sql){
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
            }

        }

    }).catch(err => {
        console.log(err);
    });
}

function Buscarfolio(res, sql, id){
    conexion.query(sql).
    then(rows => {

        if (rows.length == 0) {
            res.header("Access-Control-Allow-Origin", "*");
            res.status(200).json({
                
            });
        } else {
            // console.log(rows[0].idViaje);
            if(rows[0].idRestaurante != null){
                const querysql = "SELECT Re.idRestaurante AS id, Re.*, T.Nombre AS Turista, T.ApellidoPaterno, T.ApellidoMaterno FROM "+
                "reserva_servicio AS R INNER JOIN turista AS T ON R.idTurista = T.idTurista "+
                "INNER JOIN organizador AS O ON O.idReserva = R.idReserva "+
                "INNER JOIN Restaurantes AS Re ON Re.idRestaurante = O.idRestaurante "+
                "WHERE R.idReserva = "+id+" AND Re.idRestaurante = "+rows[0].idRestaurante;
                conexion.query(querysql).then( row => {
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
                });
            }
            else if(rows[0].idViaje != null){
                const querysql = "SELECT Re.idViaje AS id, Re.*, T.Nombre AS Turista, T.ApellidoPaterno, T.ApellidoMaterno FROM "+
                "reserva_servicio AS R INNER JOIN turista AS T ON R.idTurista = T.idTurista "+
                "INNER JOIN organizador AS O ON O.idReserva = R.idReserva "+
                "INNER JOIN Viajes AS Re ON Re.idViaje = O.idViaje "+
                "WHERE R.idReserva = "+id+" AND Re.idViaje = "+rows[0].idViaje;
                conexion.query(querysql).then( row => {
                    res.send(row)
                });
            }
            else if(rows[0].idHotel != null){
                const querysql = "SELECT Re.idHotel AS id, Re.*, T.Nombre AS Turista, T.ApellidoPaterno, T.ApellidoMaterno FROM "+
                "reserva_servicio AS R INNER JOIN turista AS T ON R.idTurista = T.idTurista "+
                "INNER JOIN organizador AS O ON O.idReserva = R.idReserva "+
                "INNER JOIN Hotel AS Re ON Re.idHotel = O.idHotel "+
                "WHERE R.idReserva = "+id+" AND Re.idHotel = "+rows[0].idHotel;
                conexion.query(querysql).then( row => {
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
                });
            }
            else if(rows[0].idTour != null){
                const querysql = "SELECT Re.idTour AS id, Re.*, T.Nombre AS Turista, T.ApellidoPaterno, T.ApellidoMaterno FROM "+
                "reserva_servicio AS R INNER JOIN turista AS T ON R.idTurista = T.idTurista "+
                "INNER JOIN organizador AS O ON O.idReserva = R.idReserva "+
                "INNER JOIN Tour AS Re ON Re.idTour = O.idTour "+
                "WHERE R.idReserva = "+id+" AND Re.idTour = "+rows[0].idTour;
                conexion.query(querysql).then( row => {
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
                });
            }
            else if(rows[0].idPaquete != null){
                const querysql = "SELECT Re.idPaquete AS id, Re.*, T.Nombre AS Turista, T.ApellidoPaterno, T.ApellidoMaterno FROM "+
                "reserva_servicio AS R INNER JOIN turista AS T ON R.idTurista = T.idTurista "+
                "INNER JOIN organizador AS O ON O.idReserva = R.idReserva "+
                "INNER JOIN Paquetes AS Re ON Re.idPaquete = O.idPaquete "+
                "WHERE R.idReserva = "+id+" AND Re.idPaquete = "+rows[0].idPaquete;
                conexion.query(querysql).then( row => {
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
                });
            }

        }

    }).catch(err => {
        console.log(err);
    });
}

                
function mandarEmail(res, sql){
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

                formato(row[0].Email);
            }

        }

    }).catch(err => {
        console.log(err);
    });
}

function formato(email){
    var transporter = nodemailer.createTransport({
        host: "smtp-mail.outlook.com", // hostname
        port: 587, // port for secure SMTP
        secureConnection: false,
        tls: {
        ciphers:'SSLv3'
        },
        auth: {
            user: 'jef38g@hotmail.com',
            pass: 'kdvkvswofrvjmgiu'
        }
      });
      
      var mailOptions = {
        from: 'jef38g@hotmail.com',
        to: email,
        subject: 'Confirmación',
        text: 'Su reserva ha sido confirmada'
      };
      
      transporter.sendMail(mailOptions, function(error, info){
        if (error) {
          console.log(error);
        } else {
          console.log('Email sent: ' + info.response);
        }
      });
}

module.exports = {
    ListarSQL,
    eliminarReserva,
    Buscarfolio,
    mandarEmail,
}