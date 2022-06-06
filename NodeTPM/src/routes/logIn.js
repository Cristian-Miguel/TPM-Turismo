const { Router } = require("express");
const router = Router();
const Usuarios = require('../models/Usuarios');
// const Hotel = require('../models/Hotel');

router.post('/Usuarios/LogIn/', (req, res, next) => { 
    const {email} = req.body;
    const {pass} = req.body;

    console.log(req.body);
    let sql = "SELECT idUsuario,Usuario,TipoUsuario FROM usuarios WHERE Email = '"+email+"' AND Password = '"+pass+"';";
    Usuarios.login(res,sql);
    //res.json(req.body);
});

router.post('/Usuarios/Repetido/', (req, res, next) => {
    const {email} = req.body;

    let sql = "SELECT Email FROM usuarios WHERE Email = '"+email+"';";
    Usuarios.login(res,sql);
    //res.json(req.body);
});

router.post('/Usuarios/Nombre/', (req, res, next) => {
    const {id,columna,tabla} = req.body;

    let sql = "SELECT * FROM "+tabla+" LEFT JOIN usuarios ON "+tabla+".idUsuario = usuarios.idUsuario WHERE "+columna+" = '"+id+"';";
    Usuarios.login(res,sql);
    //res.json(req.body);
});

router.post('/Usuarios/Registrar/', (req, res, next) => {
    const {user,name,apeP,apeM,cumple,rfc,foto,tipo} = req.body;
    const {email} = req.body;
    const {pass} = req.body;

    console.log(req.body);
    let sql = "INSERT INTO usuarios(Usuario,Email,Password,TipoUsuario,Imagen,Nombre,ApellidoPaterno,ApellidoMaterno,FechNac,RFC) VALUES ('"+user+"','"+email+"','"+pass+"','"+tipo+"','"+foto+"','"+name+"','"+apeP+"','"+apeM+"','"+cumple+"','"+rfc+"');";
    Usuarios.registrar(res,sql);
    //res.json(req.body);
});

router.post('/Usuarios/Listar/', (req, res, next) => {
    console.log(req.body);
    let sql = "SELECT idUsuario,Usuario,Email,TipoUsuario FROM usuarios WHERE TipoUsuario != 'Administrador'";
    Usuarios.registrar(res,sql);
    //res.json(req.body);
});

router.post('/Usuarios/Borrar/', (req, res, next) => {
    console.log(req.body);
    let sql = "SELECT idUsuario,Usuario,Email,TipoUsuario FROM usuarios WHERE TipoUsuario != 'Administrador'";
    Usuarios.registrar(res,sql);
    //res.json(req.body);
});

module.exports = router;
//node src/index.js
//nodemon src/index.js