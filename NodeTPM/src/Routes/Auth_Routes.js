const { Router } = require('express')
const { check } = require( 'express-validator' )
const { Validar_Datos } = require( '../middlewares/Validar_datos' )
const { Existe_Email } = require('../helpers/Validar_BD')
const router = Router()
const Auth_Controller = require( '../Controllers/Auth_Controller' )

router.post(
    '/login', 
    [
        check( 'Email', 'Email es invalido o esta vacio' ).isEmail(),
        check( 'Email' ).custom( Existe_Email ),
        check( 'Contrasena', 'Contraseña Requerida').not().isEmpty(),
        check( 'Contrasena', 'La contraseña debe ser mayor de 8 caracteres' ).isLength({ min: 8 }),
        Validar_Datos
    ],
    Auth_Controller.Login
)

module.exports = router