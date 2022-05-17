const express = require('express');
const app = express();
const morgan = require('morgan');
const cors = require('cors');

app.use(morgan('dev'));
app.use(cors());
app.use(require('./routes/favoritos'));
app.use(require('./routes/reservas'));

//Rutas que hacen uso de post
//app.use(express.urlencoded({ extended: true }));    //Middleware para formato x-www-form-urlencoded
app.use(express.json());    //Middleware para usar post en formato json
app.use(require('./routes/logIn'));

module.exports = app;