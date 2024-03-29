const { Router } = require( 'express' )
const { check } = require( 'express-validator' )
const router = Router()
const { EmployeeGet, EmployeeInsert, EmployeeUpdate, EmployeeDelete } = require( '../Controllers/Hotel_Controller' )
const { validate_token } = require('../middlewares/Validar_JWT')
const { accessRol } = require('../middlewares/Validar_Roles')
const { Exist_Hotel, Exist_User } = require('../helpers/Validar_BD')
const { validate_data } = require( '../middlewares/Validar_datos' )

//--------- Routes ---------\\
router.get( '/list', [
    validate_token,
    accessRol(1,4),
    validate_data
], EmployeeGet )

router.post( '/insert', [
    validate_token,
    accessRol(1,4),
    check( 'Id_Usuario', 'id Usuario es requiredo' ).not().isEmpty(),
    check( 'Id_Usuario', 'id Usuario es requiredo' ).isNumeric(),
    check( 'Id_Usuario', 'id Usuario es requiredo' ).custom( Exist_User ),
    check( 'Nombre', 'Nombre es requiredo' ).not().isEmpty(),
    check( 'Nombre', 'El nombre del hotel debe de tener menos de 100 caracteres' ).isLength({max: 100}),
    check( 'Descripcion', 'La descripcion es requireda' ).not().isEmpty(),
    check( 'Descripcion', 'La descripcion debe tener menos de 100 caracteres' ).isLength({max: 100}),
    check( 'Imagen', 'La imagen es requerida' ).not().isEmpty(),
    check( 'Categoria', 'Birth date required' ).not().isEmpty(),
    check( 'Categoria', 'La categotia debe tener menos de 50 caracteres' ).isLength({max: 50}),
    check( 'Costo', 'El costo es requerido' ).not().isEmpty(),
    check( 'Costo', 'El costo es requerido' ).isFloat(),
    check( 'Numero_Habitacion', 'El numero de habitacion es requerido' ).not().isEmpty(),
    check( 'Numero_Habitacion', 'El numero de habitacion es requerido' ).isNumeric(),
    check( 'Tipo_Habitacion', 'El tipo de habitacion es requerido' ).not().isEmpty(),
    check( 'Tipo_Habitacion', 'El tipo de habitacion debe tener menos de 50 caracteres' ).isLength({ max:50 }),
    check( 'Numero_Exterior', 'El numero exterior es requerido' ).not().isEmpty(),
    check( 'Numero_Exterior', 'El numero exterior debe tener menos de 10 caracteres' ).isLength({max: 10}),
    check( 'Calle', 'La calle es requireda' ).not().isEmpty(),
    check( 'Calle', 'La calle debe tener menos de 50 caracteres' ).isLength({max: 50}),
    check( 'Colonia', 'La conia es requireda' ).not().isEmpty(),
    check( 'Ciudad', 'La Ciudad requireda' ).not().isEmpty(),
    check( 'Ciudad', 'La ciudad debe tener menos de 50 caracteres' ).isLength({max: 50}),
    check( 'Estado', 'El estado es requiredo' ).not().isEmpty(),
    check( 'Estado', 'El estado debe tener menos de 70 caracteres' ).isLength({max: 70}),
    check( 'Codigo_Postal', 'El codigo postal es requerido' ).not().isEmpty(),
    check( 'Codigo_Postal', 'El codigo postal es requerido' ).isNumeric(),
    check( 'Descuento', 'El descuento es requerido' ).not().isEmpty(),
    check( 'Descuento', 'El descuento es requerido' ).isFloat(),
    check( 'Calificacion', 'La calificacion es requerida' ).not().isEmpty(),
    check( 'Calificacion', 'La calificacion es requerida' ).isFloat(),
    validate_data
], EmployeeInsert )

router.post( '/update', [
    validate_token,
    accessRol(1,4),
    check( 'Id_Hotel', 'id Hotel es requiredo' ).not().isEmpty(),
    check( 'Id_Hotel', 'id Hotel es requiredo' ).isNumeric(),
    check( 'Id_Hotel', 'id Hotel es requiredo' ).custom( Exist_Hotel ),
    check( 'Id_Usuario', 'id Usuario es requiredo' ).not().isEmpty(),
    check( 'Id_Usuario', 'id Usuario es requiredo' ).isNumeric(),
    check( 'Id_Usuario', 'id Usuario es requiredo' ).custom( Exist_User ),
    check( 'Nombre', 'Nombre es requiredo' ).not().isEmpty(),
    check( 'Nombre', 'El nombre del hotel debe de tener menos de 100 caracteres' ).isLength({max: 100}),
    check( 'Descripcion', 'La descripcion es requireda' ).not().isEmpty(),
    check( 'Descripcion', 'La descripcion debe tener menos de 100 caracteres' ).isLength({max: 100}),
    check( 'Imagen', 'La imagen es requerida' ).not().isEmpty(),
    check( 'Categoria', 'Birth date required' ).not().isEmpty(),
    check( 'Categoria', 'La categotia debe tener menos de 50 caracteres' ).isLength({max: 50}),
    check( 'Costo', 'El costo es requerido' ).not().isEmpty(),
    check( 'Costo', 'El costo es requerido' ).isFloat(),
    check( 'Numero_Habitacion', 'El numero de habitacion es requerido' ).not().isEmpty(),
    check( 'Numero_Habitacion', 'El numero de habitacion es requerido' ).isNumeric(),
    check( 'Tipo_Habitacion', 'El tipo de habitacion es requerido' ).not().isEmpty(),
    check( 'Tipo_Habitacion', 'El tipo de habitacion debe tener menos de 50 caracteres' ).isLength({ max:50 }),
    check( 'Numero_Exterior', 'El numero exterior es requerido' ).not().isEmpty(),
    check( 'Numero_Exterior', 'El numero exterior debe tener menos de 10 caracteres' ).isLength({max: 10}),
    check( 'Calle', 'La calle es requireda' ).not().isEmpty(),
    check( 'Calle', 'La calle debe tener menos de 50 caracteres' ).isLength({max: 50}),
    check( 'Colonia', 'La conia es requireda' ).not().isEmpty(),
    check( 'Ciudad', 'La Ciudad requireda' ).not().isEmpty(),
    check( 'Ciudad', 'La ciudad debe tener menos de 50 caracteres' ).isLength({max: 50}),
    check( 'Estado', 'El estado es requiredo' ).not().isEmpty(),
    check( 'Estado', 'El estado debe tener menos de 70 caracteres' ).isLength({max: 70}),
    check( 'Codigo_Postal', 'El codigo postal es requerido' ).not().isEmpty(),
    check( 'Codigo_Postal', 'El codigo postal es requerido' ).isNumeric(),
    check( 'Descuento', 'El descuento es requerido' ).not().isEmpty(),
    check( 'Descuento', 'El descuento es requerido' ).isFloat(),
    check( 'Calificacion', 'La calificacion es requerida' ).not().isEmpty(),
    check( 'Calificacion', 'La calificacion es requerida' ).isFloat(),
    validate_data
], EmployeeUpdate )

router.post( '/delete', [
    validate_token,
    accessRol(1,4),
    check( 'id', 'Id number required' ).not().isEmpty(),
    check( 'id', 'Id number required' ).isNumeric(),
    check( 'id', 'Id number required' ).custom( Exist_Payroll ),
    validate_data
], EmployeeDelete )