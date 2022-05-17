const { Router } = require("express");
const router = Router();
const Usuarios = require('../models/Usuarios');

router.get('/Usuarios/LogIn/', (req, res) => { 
    //const {email} = req.params || {};
    //const {pass} = req.query || {};

    res.json({
        correo: req.params.email,
        contraseña: 123,
    });
    //let sql = "SELECT idUsuarios,Usuario FROM usuarios WHERE Email = '"+email+"' AND Password = '"+pass+"';";
    //Usuarios.login(res,sql);
});

module.exports.router;