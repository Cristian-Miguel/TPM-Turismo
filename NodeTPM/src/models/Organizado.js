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

function  Buscarfolio(res, sql){
    conexion.query(sql).
    then(row => {

        if (row.length == 0) {
            res.header("Access-Control-Allow-Origin", "*");
            res.status(200).json({
                
            });
        } else {
            const query = ""
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