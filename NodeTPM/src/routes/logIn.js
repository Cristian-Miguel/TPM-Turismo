const { Router } = require("express");
const router = Router();
const Usuarios = require('../models/Usuarios');

router.post('/Usuarios/LogIn/', (req, res, next) => { 
    const {email} = req.body;
    const {pass} = req.body;

    console.log(req.body);
    //et sql = "SELECT idUsuarios,Usuario FROM usuarios WHERE Email = '"+email+"' AND Password = '"+pass+"';";
    //Usuarios.login(res,sql);
    res.json(req.body);
});

module.exports = router;
//node src/index.js